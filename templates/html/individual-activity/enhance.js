  google.load('visualization', '1', {'packages': ['geochart','corechart','table']});

   $(document).ready(function(){
		$(".datatable").each(function(){

			table_div = $(this).parent().find(".graph").attr("id");

			var data = new google.visualization.DataTable();
		    data.addColumn('string', 'Name');
		    data.addColumn('number', 'Value');
		    data.addColumn('string', 'Vocabulary');

			var displayGraph = 0;
			$(this).find("tr:has(td)").each(function(){
				if(weight = parseInt($(this).find(".weight").html())) {} else {weight = 1}

				if(!$(this).find(".vocabulary").html()=="") { vocab = $(this).find(".vocabulary").html(); } else { vocab = "Unspecified"; } 
				data.addRows([[$(this).find(".name").html(), weight, vocab]]);
				displayGraph++;
			});

			//Now create a section for each vocabulary
			types = data.getDistinctValues(2); /*Type is in column 3 - change if it moves*/
			for(col in types) {
				vocabSelect = types[col];

				var vocabData = new google.visualization.DataTable();
			    vocabData.addColumn('string', 'Name');
			    vocabData.addColumn('number', 'Value');
				vocabRows = data.getFilteredRows([{column:2, value: vocabSelect}]);
				for(row in vocabRows) {
					vocabData.addRows([[data.getValue(parseInt(vocabRows[row]),0),data.getValue(parseInt(vocabRows[row]),1)]]);
				}
				if(types[col]) {
					$(this).parent().find(".graph").append("<div id='"+table_div + "_" + vocabSelect +"' class='pie-chart'></div>")
					var chart = new google.visualization.PieChart(document.getElementById(table_div + "_" + vocabSelect));
					chart.draw(vocabData, {width: 350, height: 240, title: vocabSelect + " vocabulary", legend: "right" });
				}
				delete vocabData;
			}

			delete data;
		});

		$(".transactiontable").each(function(){
			/* For transactions we first build a data-table and replace the original table with it...*/
			table_div = $(this).parent().find(".table").attr("id");
			graph_div = $(this).parent().find(".graph").attr("id");

			var data = new google.visualization.DataTable();
			var re = new RegExp("-?[0-9]{1,100}","g");
		    data.addColumn('number', 'Year');
		    data.addColumn('string', 'Currency');
		    data.addColumn('number', 'Value');
		    data.addColumn('string', 'Type');
		    data.addColumn('string', 'Description');
			$(this).find("tr:has(td)").each(function(){
				year = new Date($(this).find(".transaction-date").html()).getFullYear();
				valueString = $(this).find(".transaction-value").html();
				currency = valueString.substr(0,3);
				valueString = String(valueString.match(re));
				value = parseInt(valueString.replace(/[,]/g, ""));
				data.addRows([[year,currency, value, $(this).find(".transaction-type").html(),$(this).find(".transaction-description").html()]]);
			});
			var table = new google.visualization.Table(document.getElementById(table_div));
			$(this).hide();
			table.draw(data, {showRowNumber: false});

			/* Now we need to find out what range the transaction values range over, and then build a new data table summarising them */
			var graphData = new google.visualization.DataTable();
			graphData.addColumn('string', 'Year');
			types = data.getDistinctValues(3); /*Type is in column 3 - change if it moves*/
			for(col in types) {
				graphData.addColumn('number', types[col]);
			}
			years = data.getColumnRange(0); /*Year is in column 0 - change if it moves*/
			var valueForTypeAndYear = 0; var graphRow = 0;
			if(years.min == years.max) { max = years.max + 1 } else { max = years.max } /*Have to handle for only one year */
			for(range=years.min;range!=max;range++) {
				graphData.addRows(1); 
				graphData.setCell(graphRow,0," "+range);
				for(col in types) {
					rowsForTypeAndYear = data.getFilteredRows([{column:0, value: range},{column:3,value:types[col]}]);
					for(row in rowsForTypeAndYear) {
						valueForTypeAndYear = valueForTypeAndYear + data.getValue(parseInt(rowsForTypeAndYear[row]),2);
					}
					graphData.setCell(graphRow,parseInt(col)+1,valueForTypeAndYear);						
					valueForTypeAndYear = 0;
				}
				graphRow++;
			}
			var chart = new google.visualization.ColumnChart(document.getElementById(graph_div));
			chart.draw(graphData, {width: 600, height: 300, title: 'Transactions', legend: 'bottom',
			                          hAxis: {title: 'Year'}, vAxis: {title: currency}
			                         });

		});


		$("ul.geography").each(function(){

				map_div = $(this).parent().find(".map").attr("id");

				var data = new google.visualization.DataTable();
			    data.addColumn('string', 'Country');
			    data.addColumn('number', 'Value');
				$(this).find("li span").each(function(){
					data.addRows([[$(this).attr("id"), 1]]);
				});
				var options = {};
				var container = document.getElementById(map_div);
			    var geochart = new google.visualization.GeoChart(container);
			    geochart.draw(data, options);
				delete data;
		});
   });