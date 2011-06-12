xmlns:ActivityDateType="http://dev.yipl.com.np/iati-aims/public/api/codelists/ActivityDateType"
xmlns:ActivityStatus="http://dev.yipl.com.np/iati-aims/public/api/codelists/ActivityStatus"
xmlns:AdministrativeAreaCodeFirst-level="http://dev.yipl.com.np/iati-aims/public/api/codelists/AdministrativeAreaCode(First-level)"
xmlns:AdministrativeAreaCodeSecond-level="http://dev.yipl.com.np/iati-aims/public/api/codelists/AdministrativeAreaCode(Second-level)"
xmlns:AidType="http://dev.yipl.com.np/iati-aims/public/api/codelists/AidType"
xmlns:CollaborationType="http://dev.yipl.com.np/iati-aims/public/api/codelists/CollaborationType"
xmlns:Country="http://dev.yipl.com.np/iati-aims/public/api/codelists/Country"
xmlns:Currency="http://dev.yipl.com.np/iati-aims/public/api/codelists/Currency"
xmlns:DescriptionType="http://dev.yipl.com.np/iati-aims/public/api/codelists/DescriptionType"
xmlns:Document="http://dev.yipl.com.np/iati-aims/public/api/codelists/Document"
xmlns:FileFormat="http://dev.yipl.com.np/iati-aims/public/api/codelists/FileFormat"
xmlns:FinanceType="http://dev.yipl.com.np/iati-aims/public/api/codelists/FinanceType"
xmlns:FlowType="http://dev.yipl.com.np/iati-aims/public/api/codelists/FlowType"
xmlns:GazetteerAgency="http://dev.yipl.com.np/iati-aims/public/api/codelists/GazetteerAgency"
xmlns:GeographicalPrecision="http://dev.yipl.com.np/iati-aims/public/api/codelists/GeographicalPrecision"
xmlns:Language="http://dev.yipl.com.np/iati-aims/public/api/codelists/Language"
xmlns:LocationType="http://dev.yipl.com.np/iati-aims/public/api/codelists/LocationType"
xmlns:OrganisationIdentifier="http://dev.yipl.com.np/iati-aims/public/api/codelists/OrganisationIdentifier"
xmlns:OrganisationRole="http://dev.yipl.com.np/iati-aims/public/api/codelists/OrganisationRole"
xmlns:OrganisationType="http://dev.yipl.com.np/iati-aims/public/api/codelists/OrganisationType"
xmlns:PolicyMarker="http://dev.yipl.com.np/iati-aims/public/api/codelists/PolicyMarker"
xmlns:PolicySignificance="http://dev.yipl.com.np/iati-aims/public/api/codelists/PolicySignificance"
xmlns:PublisherType="http://dev.yipl.com.np/iati-aims/public/api/codelists/PublisherType"
xmlns:Region="http://dev.yipl.com.np/iati-aims/public/api/codelists/Region"
xmlns:RelatedActivityType="http://dev.yipl.com.np/iati-aims/public/api/codelists/RelatedActivityType"
xmlns:Sector="http://dev.yipl.com.np/iati-aims/public/api/codelists/Sector"
xmlns:TiedStatus="http://dev.yipl.com.np/iati-aims/public/api/codelists/TiedStatus"
xmlns:TransactionType="http://dev.yipl.com.np/iati-aims/public/api/codelists/TransactionType"
xmlns:VerificationStatus="http://dev.yipl.com.np/iati-aims/public/api/codelists/VerificationStatus"
xmlns:Vocabulary="http://dev.yipl.com.np/iati-aims/public/api/codelists/Vocabulary"







<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:ActivityDateType="http://dev.yipl.com.np/iati-aims/public/api/codelists/ActivityDateType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//ActivityDateType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="ActivityDateType:codes">
  <xsl:param name="code"/><xsl:value-of select="ActivityDateType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<ActivityDateType:codes>
  <ActivityDateType:code id="end-actual">The actual end date, such as date of last disbursement</ActivityDateType:code>
  <ActivityDateType:code id="end-planned">The planned end date as recorded in project documentation</ActivityDateType:code>
  <ActivityDateType:code id="start-actual">The actual start date, such as date of first disbursement</ActivityDateType:code>
  <ActivityDateType:code id="start-planned">The planned start date as recorded in project documentation. Can be date of signature of activity agreement or approval by relevant body</ActivityDateType:code>
</ActivityDateType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:ActivityStatus="http://dev.yipl.com.np/iati-aims/public/api/codelists/ActivityStatus" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//ActivityStatus:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="ActivityStatus:codes">
  <xsl:param name="code"/><xsl:value-of select="ActivityStatus:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<ActivityStatus:codes>
  <ActivityStatus:code id="5">Cancelled</ActivityStatus:code>
  <ActivityStatus:code id="3">Completion</ActivityStatus:code>
  <ActivityStatus:code id="2">Implementation</ActivityStatus:code>
  <ActivityStatus:code id="1">Pipeline/identification</ActivityStatus:code>
  <ActivityStatus:code id="4">Post-completion</ActivityStatus:code>
</ActivityStatus:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:AdministrativeAreaCodeFirst-level="http://dev.yipl.com.np/iati-aims/public/api/codelists/AdministrativeAreaCode(First-level)" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//AdministrativeAreaCodeFirst-level:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="AdministrativeAreaCodeFirst-level:codes">
  <xsl:param name="code"/><xsl:value-of select="AdministrativeAreaCodeFirst-level:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<AdministrativeAreaCodeFirst-level:codes>
</AdministrativeAreaCodeFirst-level:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:AdministrativeAreaCodeSecond-level="http://dev.yipl.com.np/iati-aims/public/api/codelists/AdministrativeAreaCode(Second-level)" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//AdministrativeAreaCodeSecond-level:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="AdministrativeAreaCodeSecond-level:codes">
  <xsl:param name="code"/><xsl:value-of select="AdministrativeAreaCodeSecond-level:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<AdministrativeAreaCodeSecond-level:codes>
</AdministrativeAreaCodeSecond-level:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:AidType="http://dev.yipl.com.np/iati-aims/public/api/codelists/AidType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//AidType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="AidType:codes">
  <xsl:param name="code"/><xsl:value-of select="AidType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<AidType:codes>
  <AidType:code id="A01">General budget support</AidType:code>
  <AidType:code id="A02">Sector budget support</AidType:code>
  <AidType:code id="B01">Core support to NGOs, other private bodies, PPPs and research institutes</AidType:code>
  <AidType:code id="B02">Core contributions to multilateral institutions</AidType:code>
  <AidType:code id="B03">Contributions to specific-purpose programmes and funds managed by international organisations (multilateral, INGO)</AidType:code>
  <AidType:code id="B04">Basket funds/pooled funding</AidType:code>
  <AidType:code id="C01">Project-type interventions</AidType:code>
  <AidType:code id="D01">Donor country personnel</AidType:code>
  <AidType:code id="D02">Other technical assistance</AidType:code>
  <AidType:code id="E01">Scholarships/training in donor country</AidType:code>
  <AidType:code id="E02">Imputed student costs</AidType:code>
  <AidType:code id="F01">Debt relief</AidType:code>
  <AidType:code id="G01">Administrative costs not included elsewhere</AidType:code>
  <AidType:code id="H01">Development awareness</AidType:code>
  <AidType:code id="H02">Refugees in donor countries</AidType:code>
</AidType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:CollaborationType="http://dev.yipl.com.np/iati-aims/public/api/codelists/CollaborationType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//CollaborationType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="CollaborationType:codes">
  <xsl:param name="code"/><xsl:value-of select="CollaborationType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<CollaborationType:codes>
  <CollaborationType:code id="1">Bilateral</CollaborationType:code>
  <CollaborationType:code id="2">Multilateral</CollaborationType:code>
  <CollaborationType:code id="4">Multilateral outflows</CollaborationType:code>
  <CollaborationType:code id="5">Aid through NGOs</CollaborationType:code>
  <CollaborationType:code id="6">Aid to NGOs</CollaborationType:code>
  <CollaborationType:code id="7">Aid through PPPs</CollaborationType:code>
</CollaborationType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:Country="http://dev.yipl.com.np/iati-aims/public/api/codelists/Country" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//Country:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="Country:codes">
  <xsl:param name="code"/><xsl:value-of select="Country:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<Country:codes>
  <Country:code id="AF">Afghanistan</Country:code>
  <Country:code id="AL">Albania</Country:code>
  <Country:code id="DZ">Algeria</Country:code>
  <Country:code id="AO">Angola</Country:code>
  <Country:code id="AI">Anguilla</Country:code>
  <Country:code id="AG">Antigua and Barbuda</Country:code>
  <Country:code id="AR">Argentina</Country:code>
  <Country:code id="AM">Armenia</Country:code>
  <Country:code id="AZ">Azerbaijan</Country:code>
  <Country:code id="BD">Bangladesh</Country:code>
  <Country:code id="BB">Barbados</Country:code>
  <Country:code id="BY">Belarus</Country:code>
  <Country:code id="BZ">Belize</Country:code>
  <Country:code id="BJ">Benin</Country:code>
  <Country:code id="BT">Bhutan</Country:code>
  <Country:code id="BO">Bolivia</Country:code>
  <Country:code id="BA">Bosnia-Herzegovina</Country:code>
  <Country:code id="BW">Botswana</Country:code>
  <Country:code id="BR">Brazil</Country:code>
  <Country:code id="BF">Burkina Faso</Country:code>
  <Country:code id="BI">Burundi</Country:code>
  <Country:code id="KH">Cambodia</Country:code>
  <Country:code id="CM">Cameroon</Country:code>
  <Country:code id="CV">Cape Verde</Country:code>
  <Country:code id="CF">Central African Rep.</Country:code>
  <Country:code id="TD">Chad</Country:code>
  <Country:code id="CL">Chile</Country:code>
  <Country:code id="CN">China</Country:code>
  <Country:code id="CO">Colombia</Country:code>
  <Country:code id="KM">Comoros</Country:code>
  <Country:code id="CD">Congo, Dem. Rep.</Country:code>
  <Country:code id="CG">Congo, Rep.</Country:code>
  <Country:code id="CK">Cook Islands</Country:code>
  <Country:code id="CR">Costa Rica</Country:code>
  <Country:code id="CI">Cote d'Ivoire</Country:code>
  <Country:code id="HR">Croatia</Country:code>
  <Country:code id="CU">Cuba</Country:code>
  <Country:code id="DJ">Djibouti</Country:code>
  <Country:code id="DM">Dominica</Country:code>
  <Country:code id="DO">Dominican Republic</Country:code>
  <Country:code id="EC">Ecuador</Country:code>
  <Country:code id="EG">Egypt</Country:code>
  <Country:code id="SV">El Salvador</Country:code>
  <Country:code id="GQ">Equatorial Guinea</Country:code>
  <Country:code id="ER">Eritrea</Country:code>
  <Country:code id="ET">Ethiopia</Country:code>
  <Country:code id="GA">Gabon</Country:code>
  <Country:code id="GM">Gambia</Country:code>
  <Country:code id="GE">Georgia</Country:code>
  <Country:code id="GH">Ghana</Country:code>
  <Country:code id="GD">Grenada</Country:code>
  <Country:code id="GT">Guatemala</Country:code>
  <Country:code id="GN">Guinea</Country:code>
  <Country:code id="GW">Guinea-Bissau</Country:code>
  <Country:code id="GY">Guyana</Country:code>
  <Country:code id="HT">Haiti</Country:code>
  <Country:code id="HN">Honduras</Country:code>
  <Country:code id="IN">India</Country:code>
  <Country:code id="ID">Indonesia</Country:code>
  <Country:code id="IR">Iran</Country:code>
  <Country:code id="IQ">Iraq</Country:code>
  <Country:code id="JM">Jamaica</Country:code>
  <Country:code id="JO">Jordan</Country:code>
  <Country:code id="KZ">Kazakhstan</Country:code>
  <Country:code id="KE">Kenya</Country:code>
  <Country:code id="KI">Kiribati</Country:code>
  <Country:code id="KP">Korea, Dem. Rep.</Country:code>
  <Country:code id="KG">Kyrgyz Republic</Country:code>
  <Country:code id="LA">Laos</Country:code>
  <Country:code id="LB">Lebanon</Country:code>
  <Country:code id="LS">Lesotho</Country:code>
  <Country:code id="LR">Liberia</Country:code>
  <Country:code id="LY">Libya</Country:code>
  <Country:code id="MK">Macedonia (FYR)</Country:code>
  <Country:code id="MG">Madagascar</Country:code>
  <Country:code id="MW">Malawi</Country:code>
  <Country:code id="MY">Malaysia</Country:code>
  <Country:code id="MV">Maldives</Country:code>
  <Country:code id="ML">Mali</Country:code>
  <Country:code id="MH">Marshall Islands</Country:code>
  <Country:code id="MR">Mauritania</Country:code>
  <Country:code id="MU">Mauritius</Country:code>
  <Country:code id="YT">Mayotte</Country:code>
  <Country:code id="MX">Mexico</Country:code>
  <Country:code id="FM">Micronesia, Fed. States</Country:code>
  <Country:code id="MD">Moldova</Country:code>
  <Country:code id="MN">Mongolia</Country:code>
  <Country:code id="ME">Montenegro</Country:code>
  <Country:code id="MS">Montserrat</Country:code>
  <Country:code id="MA">Morocco</Country:code>
  <Country:code id="MZ">Mozambique</Country:code>
  <Country:code id="MM">Myanmar</Country:code>
  <Country:code id="NA">Namibia</Country:code>
  <Country:code id="NR">Nauru</Country:code>
  <Country:code id="NI">Nicaragua</Country:code>
  <Country:code id="NE">Niger</Country:code>
  <Country:code id="NG">Nigeria</Country:code>
  <Country:code id="NU">Niue</Country:code>
  <Country:code id="OM">Oman</Country:code>
  <Country:code id="PK">Pakistan</Country:code>
  <Country:code id="PW">Palau</Country:code>
  <Country:code id="PS">Palestinian Adm. Areas</Country:code>
  <Country:code id="PA">Panama</Country:code>
  <Country:code id="PG">Papua New Guinea</Country:code>
  <Country:code id="PY">Paraguay</Country:code>
  <Country:code id="PE">Peru</Country:code>
  <Country:code id="PH">Philippines</Country:code>
  <Country:code id="RW">Rwanda</Country:code>
  <Country:code id="WS">Samoa</Country:code>
  <Country:code id="ST">Sao Tome & Principe</Country:code>
  <Country:code id="SA">Saudi Arabia</Country:code>
  <Country:code id="SN">Senegal</Country:code>
  <Country:code id="RS">Serbia</Country:code>
  <Country:code id="SC">Seychelles</Country:code>
  <Country:code id="SL">Sierra Leone</Country:code>
  <Country:code id="SB">Solomon Islands</Country:code>
  <Country:code id="SO">Somalia</Country:code>
  <Country:code id="ZA">South Africa</Country:code>
  <Country:code id="LK">Sri Lanka</Country:code>
  <Country:code id="SH">St. Helena</Country:code>
  <Country:code id="KN">St. Kitts-Nevis</Country:code>
  <Country:code id="LC">St. Lucia</Country:code>
  <Country:code id="VC">St.Vincent & Grenadines</Country:code>
  <Country:code id="SD">Sudan</Country:code>
  <Country:code id="SR">Suriname</Country:code>
  <Country:code id="SZ">Swaziland</Country:code>
  <Country:code id="SY">Syria</Country:code>
  <Country:code id="TJ">Tajikistan</Country:code>
  <Country:code id="TZ">Tanzania</Country:code>
  <Country:code id="TH">Thailand</Country:code>
  <Country:code id="TL">Timor-Leste</Country:code>
  <Country:code id="TG">Togo</Country:code>
  <Country:code id="TK">Tokelau</Country:code>
  <Country:code id="TO">Tonga</Country:code>
  <Country:code id="TT">Trinidad and Tobago</Country:code>
  <Country:code id="TN">Tunisia</Country:code>
  <Country:code id="TR">Turkey</Country:code>
  <Country:code id="TM">Turkmenistan</Country:code>
  <Country:code id="TC">Turks and Caicos Islands</Country:code>
  <Country:code id="TV">Tuvalu</Country:code>
  <Country:code id="UG">Uganda</Country:code>
  <Country:code id="UA">Ukraine</Country:code>
  <Country:code id="GB">United Kingdom</Country:code>
  <Country:code id="UY">Uruguay</Country:code>
  <Country:code id="UZ">Uzbekistan</Country:code>
  <Country:code id="VU">Vanuatu</Country:code>
  <Country:code id="VE">Venezuela</Country:code>
  <Country:code id="VN">Viet Nam</Country:code>
  <Country:code id="WF">Wallis & Futuna</Country:code>
  <Country:code id="YE">Yemen</Country:code>
  <Country:code id="ZM">Zambia</Country:code>
  <Country:code id="ZW">Zimbabwe</Country:code>
</Country:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:Currency="http://dev.yipl.com.np/iati-aims/public/api/codelists/Currency" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//Currency:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="Currency:codes">
  <xsl:param name="code"/><xsl:value-of select="Currency:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<Currency:codes>
  <Currency:code id="AFN">Afghani</Currency:code>
  <Currency:code id="DZD">Algerian Dinar</Currency:code>
  <Currency:code id="ARS">Argentine Peso</Currency:code>
  <Currency:code id="AMD">Armenian Dram</Currency:code>
  <Currency:code id="AWG">Aruban Guilder</Currency:code>
  <Currency:code id="AUD">Australian Dollar</Currency:code>
  <Currency:code id="AZN">Azerbaijanian Manat</Currency:code>
  <Currency:code id="BSD">Bahamian Dollar</Currency:code>
  <Currency:code id="BHD">Bahraini Dinar</Currency:code>
  <Currency:code id="THB">Baht</Currency:code>
  <Currency:code id="PAB">Balboa</Currency:code>
  <Currency:code id="BBD">Barbados Dollar</Currency:code>
  <Currency:code id="BYR">Belarussian Ruble</Currency:code>
  <Currency:code id="BZD">Belize Dollar</Currency:code>
  <Currency:code id="BMD">Bermudian Dollar</Currency:code>
  <Currency:code id="VEF">Bolivar Fuerte</Currency:code>
  <Currency:code id="BOB">Boliviano</Currency:code>
  <Currency:code id="BRL">Brazilian Real</Currency:code>
  <Currency:code id="BND">Brunei Dollar</Currency:code>
  <Currency:code id="BGN">Bulgarian Lev</Currency:code>
  <Currency:code id="BIF">Burundi Franc</Currency:code>
  <Currency:code id="CAD">Canadian Dollar</Currency:code>
  <Currency:code id="CVE">Cape Verde Escudo</Currency:code>
  <Currency:code id="KYD">Cayman Islands Dollar</Currency:code>
  <Currency:code id="GHS">Cedi</Currency:code>
  <Currency:code id="XOF">CFA Franc BCEAO</Currency:code>
  <Currency:code id="XAF">CFA Franc BEAC</Currency:code>
  <Currency:code id="XPF">CFP Franc</Currency:code>
  <Currency:code id="CLP">Chilean Peso</Currency:code>
  <Currency:code id="COP">Colombian Peso</Currency:code>
  <Currency:code id="KMF">Comoro Franc</Currency:code>
  <Currency:code id="CDF">Congolese Franc</Currency:code>
  <Currency:code id="BAM">Convertible Marks</Currency:code>
  <Currency:code id="NIO">Cordoba Oro</Currency:code>
  <Currency:code id="CRC">Costa Rican Colon</Currency:code>
  <Currency:code id="HRK">Croatian Kuna</Currency:code>
  <Currency:code id="CUP">Cuban Peso</Currency:code>
  <Currency:code id="CZK">Czech Koruna</Currency:code>
  <Currency:code id="GMD">Dalasi</Currency:code>
  <Currency:code id="DKK">Danish Krone</Currency:code>
  <Currency:code id="MKD">Denar</Currency:code>
  <Currency:code id="DJF">Djibouti Franc</Currency:code>
  <Currency:code id="STD">Dobra</Currency:code>
  <Currency:code id="DOP">Dominican Peso</Currency:code>
  <Currency:code id="VND">Dong</Currency:code>
  <Currency:code id="XCD">East Caribbean Dollar</Currency:code>
  <Currency:code id="EGP">Egyptian Pound</Currency:code>
  <Currency:code id="SVC">El Salvador Colon</Currency:code>
  <Currency:code id="ETB">Ethiopian Birr</Currency:code>
  <Currency:code id="EUR">Euro</Currency:code>
  <Currency:code id="FKP">Falkland Islands Pound</Currency:code>
  <Currency:code id="FJD">Fiji Dollar</Currency:code>
  <Currency:code id="HUF">Forint</Currency:code>
  <Currency:code id="GIP">Gibraltar Pound</Currency:code>
  <Currency:code id="HTG">Gourde</Currency:code>
  <Currency:code id="PYG">Guarani</Currency:code>
  <Currency:code id="GNF">Guinea Franc</Currency:code>
  <Currency:code id="GYD">Guyana Dollar</Currency:code>
  <Currency:code id="HKD">Hong Kong Dollar</Currency:code>
  <Currency:code id="UAH">Hryvnia</Currency:code>
  <Currency:code id="ISK">Iceland Krona</Currency:code>
  <Currency:code id="INR">Indian Rupee</Currency:code>
  <Currency:code id="IRR">Iranian Rial</Currency:code>
  <Currency:code id="IQD">Iraqi Dinar</Currency:code>
  <Currency:code id="JMD">Jamaican Dollar</Currency:code>
  <Currency:code id="JOD">Jordanian Dinar</Currency:code>
  <Currency:code id="KES">Kenyan Shilling</Currency:code>
  <Currency:code id="PGK">Kina</Currency:code>
  <Currency:code id="LAK">Kip</Currency:code>
  <Currency:code id="EEK">Kroon</Currency:code>
  <Currency:code id="KWD">Kuwaiti Dinar</Currency:code>
  <Currency:code id="AOA">Kwanza</Currency:code>
  <Currency:code id="MMK">Kyat</Currency:code>
  <Currency:code id="GEL">Lari</Currency:code>
  <Currency:code id="LVL">Latvian Lats</Currency:code>
  <Currency:code id="LBP">Lebanese Pound</Currency:code>
  <Currency:code id="ALL">Lek</Currency:code>
  <Currency:code id="HNL">Lempira</Currency:code>
  <Currency:code id="SLL">Leone</Currency:code>
  <Currency:code id="LRD">Liberian Dollar</Currency:code>
  <Currency:code id="LYD">Libyan Dinar</Currency:code>
  <Currency:code id="SZL">Lilangeni</Currency:code>
  <Currency:code id="LTL">Lithuanian Litas</Currency:code>
  <Currency:code id="LSL">Loti</Currency:code>
  <Currency:code id="MGA">Malagasy Ariary</Currency:code>
  <Currency:code id="MWK">Malawi Kwacha</Currency:code>
  <Currency:code id="MYR">Malaysian Ringgit</Currency:code>
  <Currency:code id="TMT">Manat</Currency:code>
  <Currency:code id="MUR">Mauritius Rupee</Currency:code>
  <Currency:code id="MZN">Metical</Currency:code>
  <Currency:code id="MXN">Mexican Peso</Currency:code>
  <Currency:code id="MXV">Mexican Unidad de Inversion (UDI)</Currency:code>
  <Currency:code id="MDL">Moldovan Leu</Currency:code>
  <Currency:code id="MAD">Moroccan Dirham</Currency:code>
  <Currency:code id="BOV">Mvdol</Currency:code>
  <Currency:code id="NGN">Naira</Currency:code>
  <Currency:code id="ERN">Nakfa</Currency:code>
  <Currency:code id="NAD">Namibia Dollar</Currency:code>
  <Currency:code id="NPR">Nepalese Rupee</Currency:code>
  <Currency:code id="ANG">Netherlands Antillian Guilder</Currency:code>
  <Currency:code id="ILS">New Israeli Sheqel</Currency:code>
  <Currency:code id="RON">New Leu</Currency:code>
  <Currency:code id="TWD">New Taiwan Dollar</Currency:code>
  <Currency:code id="NZD">New Zealand Dollar</Currency:code>
  <Currency:code id="BTN">Ngultrum</Currency:code>
  <Currency:code id="KPW">North Korean Won</Currency:code>
  <Currency:code id="NOK">Norwegian Krone</Currency:code>
  <Currency:code id="PEN">Nuevo Sol</Currency:code>
  <Currency:code id="MRO">Ouguiya</Currency:code>
  <Currency:code id="TOP">Paanga</Currency:code>
  <Currency:code id="PKR">Pakistan Rupee</Currency:code>
  <Currency:code id="MOP">Pataca</Currency:code>
  <Currency:code id="CUC">Peso Convertible</Currency:code>
  <Currency:code id="UYU">Peso Uruguayo</Currency:code>
  <Currency:code id="PHP">Philippine Peso</Currency:code>
  <Currency:code id="GBP">Pound Sterling</Currency:code>
  <Currency:code id="BWP">Pula</Currency:code>
  <Currency:code id="QAR">Qatari Rial</Currency:code>
  <Currency:code id="GTQ">Quetzal</Currency:code>
  <Currency:code id="ZAR">Rand</Currency:code>
  <Currency:code id="OMR">Rial Omani</Currency:code>
  <Currency:code id="KHR">Riel</Currency:code>
  <Currency:code id="MVR">Rufiyaa</Currency:code>
  <Currency:code id="IDR">Rupiah</Currency:code>
  <Currency:code id="RUB">Russian Ruble</Currency:code>
  <Currency:code id="RWF">Rwanda Franc</Currency:code>
  <Currency:code id="SHP">Saint Helena Pound</Currency:code>
  <Currency:code id="SAR">Saudi Riyal</Currency:code>
  <Currency:code id="RSD">Serbian Dinar</Currency:code>
  <Currency:code id="SCR">Seychelles Rupee</Currency:code>
  <Currency:code id="SGD">Singapore Dollar</Currency:code>
  <Currency:code id="SBD">Solomon Islands Dollar</Currency:code>
  <Currency:code id="KGS">Som</Currency:code>
  <Currency:code id="SOS">Somali Shilling</Currency:code>
  <Currency:code id="TJS">Somoni</Currency:code>
  <Currency:code id="LKR">Sri Lanka Rupee</Currency:code>
  <Currency:code id="SDG">Sudanese Pound</Currency:code>
  <Currency:code id="SRD">Surinam Dollar</Currency:code>
  <Currency:code id="SEK">Swedish Krona</Currency:code>
  <Currency:code id="CHF">Swiss Franc</Currency:code>
  <Currency:code id="SYP">Syrian Pound</Currency:code>
  <Currency:code id="BDT">Taka</Currency:code>
  <Currency:code id="WST">Tala</Currency:code>
  <Currency:code id="TZS">Tanzanian Shilling</Currency:code>
  <Currency:code id="KZT">Tenge</Currency:code>
  <Currency:code id="TTD">Trinidad and Tobago Dollar</Currency:code>
  <Currency:code id="MNT">Tugrik</Currency:code>
  <Currency:code id="TND">Tunisian Dinar</Currency:code>
  <Currency:code id="TRY">Turkish Lira</Currency:code>
  <Currency:code id="AED">UAE Dirham</Currency:code>
  <Currency:code id="UGX">Uganda Shilling</Currency:code>
  <Currency:code id="COU">Unidad de Valor Real</Currency:code>
  <Currency:code id="CLF">Unidades de fomento</Currency:code>
  <Currency:code id="UYI">Uruguay Peso en Unidades Indexadas</Currency:code>
  <Currency:code id="USD">US Dollar</Currency:code>
  <Currency:code id="USN">US Dollar (Next day)</Currency:code>
  <Currency:code id="USS">US Dollar (Same day)</Currency:code>
  <Currency:code id="UZS">Uzbekistan Sum</Currency:code>
  <Currency:code id="VUV">Vatu</Currency:code>
  <Currency:code id="KRW">Won</Currency:code>
  <Currency:code id="YER">Yemeni Rial</Currency:code>
  <Currency:code id="JPY">Yen</Currency:code>
  <Currency:code id="CNY">Yuan Renminbi</Currency:code>
  <Currency:code id="ZMK">Zambian Kwacha</Currency:code>
  <Currency:code id="ZWL">Zimbabwe Dollar</Currency:code>
  <Currency:code id="PLN">Zloty</Currency:code>
</Currency:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:DescriptionType="http://dev.yipl.com.np/iati-aims/public/api/codelists/DescriptionType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//DescriptionType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="DescriptionType:codes">
  <xsl:param name="code"/><xsl:value-of select="DescriptionType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<DescriptionType:codes>
  <DescriptionType:code id="1">General</DescriptionType:code>
  <DescriptionType:code id="2">Objectives</DescriptionType:code>
  <DescriptionType:code id="3">Target Groups</DescriptionType:code>
</DescriptionType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:Document="http://dev.yipl.com.np/iati-aims/public/api/codelists/Document" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//Document:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="Document:codes">
  <xsl:param name="code"/><xsl:value-of select="Document:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<Document:codes>
  <Document:code id="A01">Pre- and post-project impact appraisal</Document:code>
  <Document:code id="A02">Objectives / Purpose of activity</Document:code>
  <Document:code id="A03">Intended ultimate beneficiaries</Document:code>
  <Document:code id="A04">Conditions</Document:code>
  <Document:code id="A05">Budget</Document:code>
  <Document:code id="A06">Summary information about contract</Document:code>
  <Document:code id="A07">Review of project performance and evaluation</Document:code>
  <Document:code id="A08">Results, outcomes and outputs</Document:code>
  <Document:code id="A09">Memorandum of understanding (If agreed by all parties)</Document:code>
  <Document:code id="B01">Annual report</Document:code>
  <Document:code id="B02">Strategy paper</Document:code>
  <Document:code id="B03">Country strategy paper</Document:code>
</Document:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:FileFormat="http://dev.yipl.com.np/iati-aims/public/api/codelists/FileFormat" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//FileFormat:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="FileFormat:codes">
  <xsl:param name="code"/><xsl:value-of select="FileFormat:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<FileFormat:codes>
  <FileFormat:code id="csv">Comma Separated Values</FileFormat:code>
  <FileFormat:code id="xml">Extensible Markup Language</FileFormat:code>
  <FileFormat:code id="html">Hypertext Markup Language</FileFormat:code>
  <FileFormat:code id="vnd.ms-excel">Microsoft Excel</FileFormat:code>
  <FileFormat:code id="vnd.ms-powerpoint">Microsoft Powerpoint</FileFormat:code>
  <FileFormat:code id="msword">Microsoft Word</FileFormat:code>
  <FileFormat:code id="pdf">Portable Data Format</FileFormat:code>
  <FileFormat:code id="rtf">Rich Text Format</FileFormat:code>
  <FileFormat:code id="plain">Text only</FileFormat:code>
</FileFormat:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:FinanceType="http://dev.yipl.com.np/iati-aims/public/api/codelists/FinanceType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//FinanceType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="FinanceType:codes">
  <xsl:param name="code"/><xsl:value-of select="FinanceType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<FinanceType:codes>
  <FinanceType:code id="110">Aid grant excluding debt reorganisation</FinanceType:code>
  <FinanceType:code id="111">Subsidies to national private investors</FinanceType:code>
  <FinanceType:code id="210">Interest subsidy grant in AF</FinanceType:code>
  <FinanceType:code id="211">Interest subsidy to national private exporters</FinanceType:code>
  <FinanceType:code id="310">Deposit basis</FinanceType:code>
  <FinanceType:code id="311">Encashment basis</FinanceType:code>
  <FinanceType:code id="410">Aid loan excluding debt reorganisation</FinanceType:code>
  <FinanceType:code id="411">Investment-related loan to developing countries</FinanceType:code>
  <FinanceType:code id="412">Loan in a joint venture with the recipient</FinanceType:code>
  <FinanceType:code id="413">Loan to national private investor</FinanceType:code>
  <FinanceType:code id="414">Loan to national private exporter</FinanceType:code>
  <FinanceType:code id="451">Non-banks guaranteed export credits</FinanceType:code>
  <FinanceType:code id="452">Non-banks non-guaranteed portions of guaranteed export credits</FinanceType:code>
  <FinanceType:code id="453">Bank export credits</FinanceType:code>
  <FinanceType:code id="510">Acquisition of equity as part of a joint venture with the recipient</FinanceType:code>
  <FinanceType:code id="511">Acquisition of equity not part of joint venture in developing countries</FinanceType:code>
  <FinanceType:code id="512">Other acquisition of equity. Investment in a country on the DAC List of ODA Recipients that is not made to acquire a lasting interest in an enterprise.</FinanceType:code>
  <FinanceType:code id="610">Debt forgiveness: ODA claims (P)</FinanceType:code>
  <FinanceType:code id="611">Debt forgiveness: ODA claims (I)</FinanceType:code>
  <FinanceType:code id="612">Debt forgiveness: OOF claims (P)</FinanceType:code>
  <FinanceType:code id="613">Debt forgiveness: OOF claims (I)</FinanceType:code>
  <FinanceType:code id="614">Debt forgiveness: Private claims (P)</FinanceType:code>
  <FinanceType:code id="615">Debt forgiveness: Private claims (I)</FinanceType:code>
  <FinanceType:code id="616">Debt forgiveness: OOF claims (DSR)</FinanceType:code>
  <FinanceType:code id="617">Debt forgiveness: Private claims (DSR)</FinanceType:code>
  <FinanceType:code id="618">Debt forgiveness: Other</FinanceType:code>
  <FinanceType:code id="620">Debt rescheduling: ODA claims (P)</FinanceType:code>
  <FinanceType:code id="621">Debt rescheduling: ODA claims (I)</FinanceType:code>
  <FinanceType:code id="622">Debt rescheduling: OOF claims (P)</FinanceType:code>
  <FinanceType:code id="623">Debt rescheduling: OOF claims (I)</FinanceType:code>
  <FinanceType:code id="624">Debt rescheduling: Private claims (P)</FinanceType:code>
  <FinanceType:code id="625">Debt rescheduling: Private claims (I)</FinanceType:code>
  <FinanceType:code id="626">Debt rescheduling: OOF claims (DSR)</FinanceType:code>
  <FinanceType:code id="627">Debt rescheduling: Private claims (DSR)</FinanceType:code>
  <FinanceType:code id="630">Unicode Encode Error</FinanceType:code>
  <FinanceType:code id="631">Unicode Encode Error</FinanceType:code>
  <FinanceType:code id="632">Unicode Encode Error</FinanceType:code>
  <FinanceType:code id="710">Foreign direct investment</FinanceType:code>
  <FinanceType:code id="711">Other foreign direct investment, including reinvested earnings</FinanceType:code>
  <FinanceType:code id="810">Bank bonds</FinanceType:code>
  <FinanceType:code id="811">Non-bank bonds</FinanceType:code>
  <FinanceType:code id="910">Other bank securities/claims</FinanceType:code>
  <FinanceType:code id="911">Other non-bank securities/claims</FinanceType:code>
  <FinanceType:code id="912">Securities and other instruments issued by multilateral agencies</FinanceType:code>
</FinanceType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:FlowType="http://dev.yipl.com.np/iati-aims/public/api/codelists/FlowType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//FlowType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="FlowType:codes">
  <xsl:param name="code"/><xsl:value-of select="FlowType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<FlowType:codes>
  <FlowType:code id="10">ODA</FlowType:code>
  <FlowType:code id="20">OOF</FlowType:code>
  <FlowType:code id="30">PRIVATE NGO</FlowType:code>
  <FlowType:code id="35">PRIVATE MARKET</FlowType:code>
</FlowType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:GazetteerAgency="http://dev.yipl.com.np/iati-aims/public/api/codelists/GazetteerAgency" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//GazetteerAgency:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="GazetteerAgency:codes">
  <xsl:param name="code"/><xsl:value-of select="GazetteerAgency:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<GazetteerAgency:codes>
  <GazetteerAgency:code id="GEO">Geonames.org</GazetteerAgency:code>
  <GazetteerAgency:code id="NGA">National Geospatial-Intelligence Agency</GazetteerAgency:code>
</GazetteerAgency:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:GeographicalPrecision="http://dev.yipl.com.np/iati-aims/public/api/codelists/GeographicalPrecision" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//GeographicalPrecision:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="GeographicalPrecision:codes">
  <xsl:param name="code"/><xsl:value-of select="GeographicalPrecision:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<GeographicalPrecision:codes>
  <GeographicalPrecision:code id="1">Exact location</GeographicalPrecision:code>
  <GeographicalPrecision:code id="2">Near exact location</GeographicalPrecision:code>
  <GeographicalPrecision:code id="3">Second order administrative division</GeographicalPrecision:code>
  <GeographicalPrecision:code id="4">First order administrative division</GeographicalPrecision:code>
  <GeographicalPrecision:code id="5">Estimated coordinates</GeographicalPrecision:code>
  <GeographicalPrecision:code id="6">Independent political entity</GeographicalPrecision:code>
  <GeographicalPrecision:code id="7">Unclear - capital</GeographicalPrecision:code>
  <GeographicalPrecision:code id="8">Local or national capital</GeographicalPrecision:code>
  <GeographicalPrecision:code id="9">Unclear - country</GeographicalPrecision:code>
  <GeographicalPrecision:code id="1">Exact location</GeographicalPrecision:code>
  <GeographicalPrecision:code id="2">Near exact location</GeographicalPrecision:code>
  <GeographicalPrecision:code id="3">Second order administrative division</GeographicalPrecision:code>
  <GeographicalPrecision:code id="4">First order administrative division</GeographicalPrecision:code>
  <GeographicalPrecision:code id="5">Estimated coordinates</GeographicalPrecision:code>
  <GeographicalPrecision:code id="6">Independent political entity</GeographicalPrecision:code>
  <GeographicalPrecision:code id="7">Unclear - capital</GeographicalPrecision:code>
  <GeographicalPrecision:code id="8">Local or national capital</GeographicalPrecision:code>
  <GeographicalPrecision:code id="9">Unclear - country</GeographicalPrecision:code>
</GeographicalPrecision:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:Language="http://dev.yipl.com.np/iati-aims/public/api/codelists/Language" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//Language:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="Language:codes">
  <xsl:param name="code"/><xsl:value-of select="Language:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<Language:codes>
  <Language:code id="ab">Abkhazian</Language:code>
  <Language:code id="aa">Afar</Language:code>
  <Language:code id="af">Afrikaans</Language:code>
  <Language:code id="ak">Akan</Language:code>
  <Language:code id="sq">Albanian</Language:code>
  <Language:code id="am">Amharic</Language:code>
  <Language:code id="ar">Arabic</Language:code>
  <Language:code id="an">Aragonese</Language:code>
  <Language:code id="hy">Armenian</Language:code>
  <Language:code id="as">Assamese</Language:code>
  <Language:code id="av">Avaric</Language:code>
  <Language:code id="ae">Avestan</Language:code>
  <Language:code id="ay">Aymara</Language:code>
  <Language:code id="az">Azerbaijani</Language:code>
  <Language:code id="bm">Bambara</Language:code>
  <Language:code id="ba">Bashkir</Language:code>
  <Language:code id="eu">Basque</Language:code>
  <Language:code id="be">Belarusian</Language:code>
  <Language:code id="bn">Bengali</Language:code>
  <Language:code id="bh">Bihari languages</Language:code>
  <Language:code id="bi">Bislama</Language:code>
  <Language:code id="nb">Unicode Decode Error</Language:code>
  <Language:code id="bs">Bosnian</Language:code>
  <Language:code id="br">Breton</Language:code>
  <Language:code id="bg">Bulgarian</Language:code>
  <Language:code id="my">Burmese</Language:code>
  <Language:code id="ca">Catalan; Valencian</Language:code>
  <Language:code id="km">Central Khmer</Language:code>
  <Language:code id="ch">Chamorro</Language:code>
  <Language:code id="ce">Chechen</Language:code>
  <Language:code id="ny">Chichewa; Chewa; Nyanja</Language:code>
  <Language:code id="zh">Chinese</Language:code>
  <Language:code id="cv">Chuvash</Language:code>
  <Language:code id="kw">Cornish</Language:code>
  <Language:code id="co">Corsican</Language:code>
  <Language:code id="cr">Cree</Language:code>
  <Language:code id="hr">Croatian</Language:code>
  <Language:code id="cs">Czech</Language:code>
  <Language:code id="da">Danish</Language:code>
  <Language:code id="dv">Divehi; Dhivehi; Maldivian</Language:code>
  <Language:code id="nl">Dutch; Flemish</Language:code>
  <Language:code id="dz">Dzongkha</Language:code>
  <Language:code id="en">English</Language:code>
  <Language:code id="eo">Esperanto</Language:code>
  <Language:code id="et">Estonian</Language:code>
  <Language:code id="ee">Ewe</Language:code>
  <Language:code id="fo">Faroese</Language:code>
  <Language:code id="fj">Fijian</Language:code>
  <Language:code id="fi">Finnish</Language:code>
  <Language:code id="fr">French</Language:code>
  <Language:code id="ff">Fulah</Language:code>
  <Language:code id="gd">Gaelic; Scottish Gaelic</Language:code>
  <Language:code id="gl">Galician</Language:code>
  <Language:code id="lg">Ganda</Language:code>
  <Language:code id="ka">Georgian</Language:code>
  <Language:code id="de">German</Language:code>
  <Language:code id="el">Greek</Language:code>
  <Language:code id="gn">Guarani</Language:code>
  <Language:code id="gu">Gujarati</Language:code>
  <Language:code id="ht">Haitian; Haitian Creole</Language:code>
  <Language:code id="ha">Hausa</Language:code>
  <Language:code id="he">Hebrew</Language:code>
  <Language:code id="hz">Herero</Language:code>
  <Language:code id="hi">Hindi</Language:code>
  <Language:code id="ho">Hiri Motu</Language:code>
  <Language:code id="hu">Hungarian</Language:code>
  <Language:code id="is">Icelandic</Language:code>
  <Language:code id="io">Ido</Language:code>
  <Language:code id="ig">Igbo</Language:code>
  <Language:code id="id">Indonesian</Language:code>
  <Language:code id="iu">Inuktitut</Language:code>
  <Language:code id="ik">Inupiaq</Language:code>
  <Language:code id="ga">Irish</Language:code>
  <Language:code id="it">Italian</Language:code>
  <Language:code id="ja">Japanese</Language:code>
  <Language:code id="jv">Javanese</Language:code>
  <Language:code id="kl">Kalaallisut; Greenlandic</Language:code>
  <Language:code id="kn">Kannada</Language:code>
  <Language:code id="kr">Kanuri</Language:code>
  <Language:code id="ks">Kashmiri</Language:code>
  <Language:code id="kk">Kazakh</Language:code>
  <Language:code id="ki">Kikuyu; Gikuyu</Language:code>
  <Language:code id="rw">Kinyarwanda</Language:code>
  <Language:code id="ky">Kirghiz; Kyrgyz</Language:code>
  <Language:code id="kv">Komi</Language:code>
  <Language:code id="kg">Kongo</Language:code>
  <Language:code id="ko">Korean</Language:code>
  <Language:code id="kj">Kuanyama; Kwanyama</Language:code>
  <Language:code id="ku">Kurdish</Language:code>
  <Language:code id="lo">Lao</Language:code>
  <Language:code id="la">Latin</Language:code>
  <Language:code id="lv">Latvian</Language:code>
  <Language:code id="li">Limburgan; Limburger; Limburgish</Language:code>
  <Language:code id="ln">Lingala</Language:code>
  <Language:code id="lt">Lithuanian</Language:code>
  <Language:code id="lu">Luba-Katanga</Language:code>
  <Language:code id="lb">Luxembourgish; Letzeburgesch</Language:code>
  <Language:code id="mk">Macedonian</Language:code>
  <Language:code id="mg">Malagasy</Language:code>
  <Language:code id="ms">Malay</Language:code>
  <Language:code id="ml">Malayalam</Language:code>
  <Language:code id="mt">Maltese</Language:code>
  <Language:code id="gv">Manx</Language:code>
  <Language:code id="mi">Maori</Language:code>
  <Language:code id="mr">Marathi</Language:code>
  <Language:code id="mh">Marshallese</Language:code>
  <Language:code id="mn">Mongolian</Language:code>
  <Language:code id="na">Nauru</Language:code>
  <Language:code id="nv">Navajo; Navaho</Language:code>
  <Language:code id="nd">Ndebele, North; North Ndebele</Language:code>
  <Language:code id="nr">Ndebele, South; South Ndebele</Language:code>
  <Language:code id="ng">Ndonga</Language:code>
  <Language:code id="ne">Nepali</Language:code>
  <Language:code id="se">Northern Sami</Language:code>
  <Language:code id="no">Norwegian</Language:code>
  <Language:code id="nn">Norwegian Nynorsk; Nynorsk, Norwegian</Language:code>
  <Language:code id="oc">Occitan (post 1500)</Language:code>
  <Language:code id="oj">Ojibwa</Language:code>
  <Language:code id="or">Oriya</Language:code>
  <Language:code id="om">Oromo</Language:code>
  <Language:code id="os">Ossetian; Ossetic</Language:code>
  <Language:code id="pi">Pali</Language:code>
  <Language:code id="pa">Panjabi; Punjabi</Language:code>
  <Language:code id="fa">Persian</Language:code>
  <Language:code id="pl">Polish</Language:code>
  <Language:code id="pt">Portuguese</Language:code>
  <Language:code id="ps">Pushto; Pashto</Language:code>
  <Language:code id="qu">Quechua</Language:code>
  <Language:code id="ro">Romanian; Moldavian; Moldovan</Language:code>
  <Language:code id="rm">Romansh</Language:code>
  <Language:code id="rn">Rundi</Language:code>
  <Language:code id="ru">Russian</Language:code>
  <Language:code id="sm">Samoan</Language:code>
  <Language:code id="sg">Sango</Language:code>
  <Language:code id="sa">Sanskrit</Language:code>
  <Language:code id="sc">Sardinian</Language:code>
  <Language:code id="sr">Serbian</Language:code>
  <Language:code id="sn">Shona</Language:code>
  <Language:code id="ii">Sichuan Yi; Nuosu</Language:code>
  <Language:code id="sd">Sindhi</Language:code>
  <Language:code id="si">Sinhala; Sinhalese</Language:code>
  <Language:code id="sk">Slovak</Language:code>
  <Language:code id="sl">Slovenian</Language:code>
  <Language:code id="so">Somali</Language:code>
  <Language:code id="st">Sotho, Southern</Language:code>
  <Language:code id="es">Spanish; Castilian</Language:code>
  <Language:code id="su">Sundanese</Language:code>
  <Language:code id="sw">Swahili</Language:code>
  <Language:code id="ss">Swati</Language:code>
  <Language:code id="sv">Swedish</Language:code>
  <Language:code id="tl">Tagalog</Language:code>
  <Language:code id="ty">Tahitian</Language:code>
  <Language:code id="tg">Tajik</Language:code>
  <Language:code id="ta">Tamil</Language:code>
  <Language:code id="tt">Tatar</Language:code>
  <Language:code id="te">Telugu</Language:code>
  <Language:code id="th">Thai</Language:code>
  <Language:code id="bo">Tibetan</Language:code>
  <Language:code id="ti">Tigrinya</Language:code>
  <Language:code id="to">Tonga (Tonga Islands)</Language:code>
  <Language:code id="ts">Tsonga</Language:code>
  <Language:code id="tn">Tswana</Language:code>
  <Language:code id="tr">Turkish</Language:code>
  <Language:code id="tk">Turkmen</Language:code>
  <Language:code id="tw">Twi</Language:code>
  <Language:code id="ug">Uighur; Uyghur</Language:code>
  <Language:code id="uk">Ukrainian</Language:code>
  <Language:code id="ur">Urdu</Language:code>
  <Language:code id="uz">Uzbek</Language:code>
  <Language:code id="ve">Venda</Language:code>
  <Language:code id="vi">Vietnamese</Language:code>
  <Language:code id="vo">Unicode Decode Error</Language:code>
  <Language:code id="wa">Walloon</Language:code>
  <Language:code id="cy">Welsh</Language:code>
  <Language:code id="fy">Western Frisian</Language:code>
  <Language:code id="wo">Wolof</Language:code>
  <Language:code id="xh">Xhosa</Language:code>
  <Language:code id="yi">Yiddish</Language:code>
  <Language:code id="yo">Yoruba</Language:code>
  <Language:code id="za">Zhuang; Chuang</Language:code>
  <Language:code id="zu">Zulu</Language:code>
  <Language:code id="ab">Abkhazian</Language:code>
  <Language:code id="aa">Afar</Language:code>
  <Language:code id="af">Afrikaans</Language:code>
  <Language:code id="ak">Akan</Language:code>
  <Language:code id="sq">Albanian</Language:code>
  <Language:code id="am">Amharic</Language:code>
  <Language:code id="ar">Arabic</Language:code>
  <Language:code id="an">Aragonese</Language:code>
  <Language:code id="hy">Armenian</Language:code>
  <Language:code id="as">Assamese</Language:code>
  <Language:code id="av">Avaric</Language:code>
  <Language:code id="ae">Avestan</Language:code>
  <Language:code id="ay">Aymara</Language:code>
  <Language:code id="az">Azerbaijani</Language:code>
  <Language:code id="bm">Bambara</Language:code>
  <Language:code id="ba">Bashkir</Language:code>
  <Language:code id="eu">Basque</Language:code>
  <Language:code id="be">Belarusian</Language:code>
  <Language:code id="bn">Bengali</Language:code>
  <Language:code id="bh">Bihari languages</Language:code>
  <Language:code id="bi">Bislama</Language:code>
  <Language:code id="nb">Unicode Decode Error</Language:code>
  <Language:code id="bs">Bosnian</Language:code>
  <Language:code id="br">Breton</Language:code>
  <Language:code id="bg">Bulgarian</Language:code>
  <Language:code id="my">Burmese</Language:code>
  <Language:code id="ca">Catalan; Valencian</Language:code>
  <Language:code id="km">Central Khmer</Language:code>
  <Language:code id="ch">Chamorro</Language:code>
  <Language:code id="ce">Chechen</Language:code>
  <Language:code id="ny">Chichewa; Chewa; Nyanja</Language:code>
  <Language:code id="zh">Chinese</Language:code>
  <Language:code id="cv">Chuvash</Language:code>
  <Language:code id="kw">Cornish</Language:code>
  <Language:code id="co">Corsican</Language:code>
  <Language:code id="cr">Cree</Language:code>
  <Language:code id="hr">Croatian</Language:code>
  <Language:code id="cs">Czech</Language:code>
  <Language:code id="da">Danish</Language:code>
  <Language:code id="dv">Divehi; Dhivehi; Maldivian</Language:code>
  <Language:code id="nl">Dutch; Flemish</Language:code>
  <Language:code id="dz">Dzongkha</Language:code>
  <Language:code id="en">English</Language:code>
  <Language:code id="eo">Esperanto</Language:code>
  <Language:code id="et">Estonian</Language:code>
  <Language:code id="ee">Ewe</Language:code>
  <Language:code id="fo">Faroese</Language:code>
  <Language:code id="fj">Fijian</Language:code>
  <Language:code id="fi">Finnish</Language:code>
  <Language:code id="fr">French</Language:code>
  <Language:code id="ff">Fulah</Language:code>
  <Language:code id="gd">Gaelic; Scottish Gaelic</Language:code>
  <Language:code id="gl">Galician</Language:code>
  <Language:code id="lg">Ganda</Language:code>
  <Language:code id="ka">Georgian</Language:code>
  <Language:code id="de">German</Language:code>
  <Language:code id="el">Greek</Language:code>
  <Language:code id="gn">Guarani</Language:code>
  <Language:code id="gu">Gujarati</Language:code>
  <Language:code id="ht">Haitian; Haitian Creole</Language:code>
  <Language:code id="ha">Hausa</Language:code>
  <Language:code id="he">Hebrew</Language:code>
  <Language:code id="hz">Herero</Language:code>
  <Language:code id="hi">Hindi</Language:code>
  <Language:code id="ho">Hiri Motu</Language:code>
  <Language:code id="hu">Hungarian</Language:code>
  <Language:code id="is">Icelandic</Language:code>
  <Language:code id="io">Ido</Language:code>
  <Language:code id="ig">Igbo</Language:code>
  <Language:code id="id">Indonesian</Language:code>
  <Language:code id="iu">Inuktitut</Language:code>
  <Language:code id="ik">Inupiaq</Language:code>
  <Language:code id="ga">Irish</Language:code>
  <Language:code id="it">Italian</Language:code>
  <Language:code id="ja">Japanese</Language:code>
  <Language:code id="jv">Javanese</Language:code>
  <Language:code id="kl">Kalaallisut; Greenlandic</Language:code>
  <Language:code id="kn">Kannada</Language:code>
  <Language:code id="kr">Kanuri</Language:code>
  <Language:code id="ks">Kashmiri</Language:code>
  <Language:code id="kk">Kazakh</Language:code>
  <Language:code id="ki">Kikuyu; Gikuyu</Language:code>
  <Language:code id="rw">Kinyarwanda</Language:code>
  <Language:code id="ky">Kirghiz; Kyrgyz</Language:code>
  <Language:code id="kv">Komi</Language:code>
  <Language:code id="kg">Kongo</Language:code>
  <Language:code id="ko">Korean</Language:code>
  <Language:code id="kj">Kuanyama; Kwanyama</Language:code>
  <Language:code id="ku">Kurdish</Language:code>
  <Language:code id="lo">Lao</Language:code>
  <Language:code id="la">Latin</Language:code>
  <Language:code id="lv">Latvian</Language:code>
  <Language:code id="li">Limburgan; Limburger; Limburgish</Language:code>
  <Language:code id="ln">Lingala</Language:code>
  <Language:code id="lt">Lithuanian</Language:code>
  <Language:code id="lu">Luba-Katanga</Language:code>
  <Language:code id="lb">Luxembourgish; Letzeburgesch</Language:code>
  <Language:code id="mk">Macedonian</Language:code>
  <Language:code id="mg">Malagasy</Language:code>
  <Language:code id="ms">Malay</Language:code>
  <Language:code id="ml">Malayalam</Language:code>
  <Language:code id="mt">Maltese</Language:code>
  <Language:code id="gv">Manx</Language:code>
  <Language:code id="mi">Maori</Language:code>
  <Language:code id="mr">Marathi</Language:code>
  <Language:code id="mh">Marshallese</Language:code>
  <Language:code id="mn">Mongolian</Language:code>
  <Language:code id="na">Nauru</Language:code>
  <Language:code id="nv">Navajo; Navaho</Language:code>
  <Language:code id="nd">Ndebele, North; North Ndebele</Language:code>
  <Language:code id="nr">Ndebele, South; South Ndebele</Language:code>
  <Language:code id="ng">Ndonga</Language:code>
  <Language:code id="ne">Nepali</Language:code>
  <Language:code id="se">Northern Sami</Language:code>
  <Language:code id="no">Norwegian</Language:code>
  <Language:code id="nn">Norwegian Nynorsk; Nynorsk, Norwegian</Language:code>
  <Language:code id="oc">Occitan (post 1500)</Language:code>
  <Language:code id="oj">Ojibwa</Language:code>
  <Language:code id="or">Oriya</Language:code>
  <Language:code id="om">Oromo</Language:code>
  <Language:code id="os">Ossetian; Ossetic</Language:code>
  <Language:code id="pi">Pali</Language:code>
  <Language:code id="pa">Panjabi; Punjabi</Language:code>
  <Language:code id="fa">Persian</Language:code>
  <Language:code id="pl">Polish</Language:code>
  <Language:code id="pt">Portuguese</Language:code>
  <Language:code id="ps">Pushto; Pashto</Language:code>
  <Language:code id="qu">Quechua</Language:code>
  <Language:code id="ro">Romanian; Moldavian; Moldovan</Language:code>
  <Language:code id="rm">Romansh</Language:code>
  <Language:code id="rn">Rundi</Language:code>
  <Language:code id="ru">Russian</Language:code>
  <Language:code id="sm">Samoan</Language:code>
  <Language:code id="sg">Sango</Language:code>
  <Language:code id="sa">Sanskrit</Language:code>
  <Language:code id="sc">Sardinian</Language:code>
  <Language:code id="sr">Serbian</Language:code>
  <Language:code id="sn">Shona</Language:code>
  <Language:code id="ii">Sichuan Yi; Nuosu</Language:code>
  <Language:code id="sd">Sindhi</Language:code>
  <Language:code id="si">Sinhala; Sinhalese</Language:code>
  <Language:code id="sk">Slovak</Language:code>
  <Language:code id="sl">Slovenian</Language:code>
  <Language:code id="so">Somali</Language:code>
  <Language:code id="st">Sotho, Southern</Language:code>
  <Language:code id="es">Spanish; Castilian</Language:code>
  <Language:code id="su">Sundanese</Language:code>
  <Language:code id="sw">Swahili</Language:code>
  <Language:code id="ss">Swati</Language:code>
  <Language:code id="sv">Swedish</Language:code>
  <Language:code id="tl">Tagalog</Language:code>
  <Language:code id="ty">Tahitian</Language:code>
  <Language:code id="tg">Tajik</Language:code>
  <Language:code id="ta">Tamil</Language:code>
  <Language:code id="tt">Tatar</Language:code>
  <Language:code id="te">Telugu</Language:code>
  <Language:code id="th">Thai</Language:code>
  <Language:code id="bo">Tibetan</Language:code>
  <Language:code id="ti">Tigrinya</Language:code>
  <Language:code id="to">Tonga (Tonga Islands)</Language:code>
  <Language:code id="ts">Tsonga</Language:code>
  <Language:code id="tn">Tswana</Language:code>
  <Language:code id="tr">Turkish</Language:code>
  <Language:code id="tk">Turkmen</Language:code>
  <Language:code id="tw">Twi</Language:code>
  <Language:code id="ug">Uighur; Uyghur</Language:code>
  <Language:code id="uk">Ukrainian</Language:code>
  <Language:code id="ur">Urdu</Language:code>
  <Language:code id="uz">Uzbek</Language:code>
  <Language:code id="ve">Venda</Language:code>
  <Language:code id="vi">Vietnamese</Language:code>
  <Language:code id="vo">Unicode Decode Error</Language:code>
  <Language:code id="wa">Walloon</Language:code>
  <Language:code id="cy">Welsh</Language:code>
  <Language:code id="fy">Western Frisian</Language:code>
  <Language:code id="wo">Wolof</Language:code>
  <Language:code id="xh">Xhosa</Language:code>
  <Language:code id="yi">Yiddish</Language:code>
  <Language:code id="yo">Yoruba</Language:code>
  <Language:code id="za">Zhuang; Chuang</Language:code>
  <Language:code id="zu">Zulu</Language:code>
</Language:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:LocationType="http://dev.yipl.com.np/iati-aims/public/api/codelists/LocationType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//LocationType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="LocationType:codes">
  <xsl:param name="code"/><xsl:value-of select="LocationType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<LocationType:codes>
  <LocationType:code id="PPLC">capital of a political entity</LocationType:code>
  <LocationType:code id="CNS">concession area</LocationType:code>
  <LocationType:code id="FRM">farm</LocationType:code>
  <LocationType:code id="ADM1">first-order administrative division</LocationType:code>
  <LocationType:code id="PCL">political entity (i.e. a country)</LocationType:code>
  <LocationType:code id="PPL">populated place</LocationType:code>
  <LocationType:code id="RES">reserve</LocationType:code>
  <LocationType:code id="PPLA">seat of a first-order administrative division</LocationType:code>
  <LocationType:code id="PPLA2">seat of a second-order administrative division</LocationType:code>
  <LocationType:code id="ADM2">second-order administrative division</LocationType:code>
</LocationType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:OrganisationIdentifier="http://dev.yipl.com.np/iati-aims/public/api/codelists/OrganisationIdentifier" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//OrganisationIdentifier:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="OrganisationIdentifier:codes">
  <xsl:param name="code"/><xsl:value-of select="OrganisationIdentifier:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<OrganisationIdentifier:codes>
  <OrganisationIdentifier:code id=""></OrganisationIdentifier:code>
</OrganisationIdentifier:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:OrganisationRole="http://dev.yipl.com.np/iati-aims/public/api/codelists/OrganisationRole" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//OrganisationRole:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="OrganisationRole:codes">
  <xsl:param name="code"/><xsl:value-of select="OrganisationRole:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<OrganisationRole:codes>
  <OrganisationRole:code id="Accountable">Accountable</OrganisationRole:code>
  <OrganisationRole:code id="Extending">Extending</OrganisationRole:code>
  <OrganisationRole:code id="Funding">Funding</OrganisationRole:code>
  <OrganisationRole:code id="Implementing">Implementing</OrganisationRole:code>
</OrganisationRole:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:OrganisationType="http://dev.yipl.com.np/iati-aims/public/api/codelists/OrganisationType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//OrganisationType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="OrganisationType:codes">
  <xsl:param name="code"/><xsl:value-of select="OrganisationType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<OrganisationType:codes>
  <OrganisationType:code id="80">Academic, Training and Research</OrganisationType:code>
  <OrganisationType:code id="60">Foundation</OrganisationType:code>
  <OrganisationType:code id="10">Government</OrganisationType:code>
  <OrganisationType:code id="21">International NGO</OrganisationType:code>
  <OrganisationType:code id="40">Multilateral</OrganisationType:code>
  <OrganisationType:code id="22">National NGO</OrganisationType:code>
  <OrganisationType:code id="15">Other Public Sector</OrganisationType:code>
  <OrganisationType:code id="70">Private Sector</OrganisationType:code>
  <OrganisationType:code id="30">Public Private Partnership</OrganisationType:code>
  <OrganisationType:code id="23">Regional NGO</OrganisationType:code>
</OrganisationType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:PolicyMarker="http://dev.yipl.com.np/iati-aims/public/api/codelists/PolicyMarker" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//PolicyMarker:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="PolicyMarker:codes">
  <xsl:param name="code"/><xsl:value-of select="PolicyMarker:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<PolicyMarker:codes>
  <PolicyMarker:code id="5">Aid Targeting the Objectives of the Convention on Biological Diversity</PolicyMarker:code>
  <PolicyMarker:code id="8">Aid Targeting the Objectives of the Convention to Combat Desertification</PolicyMarker:code>
  <PolicyMarker:code id="7">Aid Targeting the Objectives of the Framework Convention on Climate Change - Adaptation</PolicyMarker:code>
  <PolicyMarker:code id="6">Aid Targeting the Objectives of the Framework Convention on Climate Change - Mitigation</PolicyMarker:code>
  <PolicyMarker:code id="2">Aid to Environment</PolicyMarker:code>
  <PolicyMarker:code id="1">Gender Equality</PolicyMarker:code>
  <PolicyMarker:code id="3">Participatory Development/Good Governance</PolicyMarker:code>
  <PolicyMarker:code id="4">Trade Development</PolicyMarker:code>
</PolicyMarker:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:PolicySignificance="http://dev.yipl.com.np/iati-aims/public/api/codelists/PolicySignificance" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//PolicySignificance:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="PolicySignificance:codes">
  <xsl:param name="code"/><xsl:value-of select="PolicySignificance:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<PolicySignificance:codes>
  <PolicySignificance:code id="0">not targeted</PolicySignificance:code>
  <PolicySignificance:code id="1">significant objective</PolicySignificance:code>
  <PolicySignificance:code id="2">principal objective</PolicySignificance:code>
  <PolicySignificance:code id="3">principal objective AND in support of an action programme</PolicySignificance:code>
</PolicySignificance:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:PublisherType="http://dev.yipl.com.np/iati-aims/public/api/codelists/PublisherType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//PublisherType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="PublisherType:codes">
  <xsl:param name="code"/><xsl:value-of select="PublisherType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<PublisherType:codes>
  <PublisherType:code id="3">Aggregator</PublisherType:code>
  <PublisherType:code id="1">Aid Provider</PublisherType:code>
  <PublisherType:code id="2">Aid Recipient</PublisherType:code>
</PublisherType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:Region="http://dev.yipl.com.np/iati-aims/public/api/codelists/Region" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//Region:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="Region:codes">
  <xsl:param name="code"/><xsl:value-of select="Region:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<Region:codes>
  <Region:code id="298">Africa, regional</Region:code>
  <Region:code id="498">America, regional</Region:code>
  <Region:code id="798">Asia, regional</Region:code>
  <Region:code id="998">Bilateral, unspecified</Region:code>
  <Region:code id="619">Central Asia, regional</Region:code>
  <Region:code id="89">Europe, regional</Region:code>
  <Region:code id="789">Far East Asia, regional</Region:code>
  <Region:code id="589">Middle East, regional</Region:code>
  <Region:code id="389">North & Central America, regional</Region:code>
  <Region:code id="189">North of Sahara, regional</Region:code>
  <Region:code id="889">Oceania, regional</Region:code>
  <Region:code id="689">South & Central Asia, regional</Region:code>
  <Region:code id="489">South America, regional</Region:code>
  <Region:code id="679">South Asia, regional</Region:code>
  <Region:code id="289">South of Sahara, regional</Region:code>
  <Region:code id="380">West Indies, regional</Region:code>
</Region:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:RelatedActivityType="http://dev.yipl.com.np/iati-aims/public/api/codelists/RelatedActivityType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//RelatedActivityType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="RelatedActivityType:codes">
  <xsl:param name="code"/><xsl:value-of select="RelatedActivityType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<RelatedActivityType:codes>
  <RelatedActivityType:code id="1">Parent</RelatedActivityType:code>
  <RelatedActivityType:code id="2">Child</RelatedActivityType:code>
  <RelatedActivityType:code id="3">Sibling</RelatedActivityType:code>
</RelatedActivityType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:Sector="http://dev.yipl.com.np/iati-aims/public/api/codelists/Sector" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//Sector:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="Sector:codes">
  <xsl:param name="code"/><xsl:value-of select="Sector:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<Sector:codes>
  <Sector:code id="11110">Education policy and administrative management</Sector:code>
  <Sector:code id="11120">Education facilities and training</Sector:code>
  <Sector:code id="11130">Teacher training</Sector:code>
  <Sector:code id="11182">Educational research</Sector:code>
  <Sector:code id="11220">Primary education</Sector:code>
  <Sector:code id="11230">Basic life skills for youth and adults</Sector:code>
  <Sector:code id="11240">Early childhood education</Sector:code>
  <Sector:code id="11320">Secondary education</Sector:code>
  <Sector:code id="11330">Vocational training</Sector:code>
  <Sector:code id="11420">Higher education</Sector:code>
  <Sector:code id="11430">Advanced technical and managerial training</Sector:code>
  <Sector:code id="12110">Health policy and administrative management</Sector:code>
  <Sector:code id="12181">Medical education/training</Sector:code>
  <Sector:code id="12182">Medical research</Sector:code>
  <Sector:code id="12191">Medical services</Sector:code>
  <Sector:code id="12220">Basic health care</Sector:code>
  <Sector:code id="12230">Basic health infrastructure</Sector:code>
  <Sector:code id="12240">Basic nutrition</Sector:code>
  <Sector:code id="12250">Infectious disease control</Sector:code>
  <Sector:code id="12261">Health education</Sector:code>
  <Sector:code id="12262">Malaria control</Sector:code>
  <Sector:code id="12263">Tuberculosis control</Sector:code>
  <Sector:code id="12281">Health personnel development</Sector:code>
  <Sector:code id="13010">Population policy and administrative management</Sector:code>
  <Sector:code id="13020">Reproductive health care</Sector:code>
  <Sector:code id="13030">Family planning</Sector:code>
  <Sector:code id="13040">STD control including HIV/AIDS</Sector:code>
  <Sector:code id="13081">Personnel development for population and reproductive health</Sector:code>
  <Sector:code id="14010">Water resources policy and administrative management</Sector:code>
  <Sector:code id="14015">Water resources protection</Sector:code>
  <Sector:code id="14020">Water supply and sanitation - large systems</Sector:code>
  <Sector:code id="14030">Basic drinking water supply and basic sanitation</Sector:code>
  <Sector:code id="14040">River development</Sector:code>
  <Sector:code id="14050">Waste management/disposal</Sector:code>
  <Sector:code id="14081">Education and training in water supply and sanitation</Sector:code>
  <Sector:code id="15110">Economic and development policy/planning</Sector:code>
  <Sector:code id="15120">Public sector financial management</Sector:code>
  <Sector:code id="15130">Legal and judicial development</Sector:code>
  <Sector:code id="15140">Government administration</Sector:code>
  <Sector:code id="15150">Strengthening civil society</Sector:code>
  <Sector:code id="15161">Elections</Sector:code>
  <Sector:code id="15162">Human rights</Sector:code>
  <Sector:code id="15163">Free flow of information</Sector:code>
  <Sector:code id="15164">Women's equality organisations and institutions</Sector:code>
  <Sector:code id="15210">Security system management and reform</Sector:code>
  <Sector:code id="15220">Civilian peace-building, conflict prevention and resolution</Sector:code>
  <Sector:code id="15230">Post-conflict peace-building (UN)</Sector:code>
  <Sector:code id="15240">Reintegration and SALW control</Sector:code>
  <Sector:code id="15250">Land mine clearance</Sector:code>
  <Sector:code id="15261">Child soldiers (Prevention and demobilisation)</Sector:code>
  <Sector:code id="16010">Social/ welfare services</Sector:code>
  <Sector:code id="16020">Employment policy and administrative management</Sector:code>
  <Sector:code id="16030">Housing policy and administrative management</Sector:code>
  <Sector:code id="16040">Low-cost housing</Sector:code>
  <Sector:code id="16050">Multisector aid for basic social services</Sector:code>
  <Sector:code id="16061">Culture and recreation</Sector:code>
  <Sector:code id="16062">Statistical capacity building</Sector:code>
  <Sector:code id="16063">Narcotics control</Sector:code>
  <Sector:code id="16064">Social mitigation of HIV/AIDS</Sector:code>
  <Sector:code id="21010">Transport policy and administrative management</Sector:code>
  <Sector:code id="21020">Road transport</Sector:code>
  <Sector:code id="21030">Rail transport</Sector:code>
  <Sector:code id="21040">Water transport</Sector:code>
  <Sector:code id="21050">Air transport</Sector:code>
  <Sector:code id="21061">Storage</Sector:code>
  <Sector:code id="21081">Education and training in transport and storage</Sector:code>
  <Sector:code id="22010">Communications policy and administrative management</Sector:code>
  <Sector:code id="22020">Telecommunications</Sector:code>
  <Sector:code id="22030">Radio/television/print media</Sector:code>
  <Sector:code id="22040">Information and communication technology (ICT)</Sector:code>
  <Sector:code id="23010">Energy policy and administrative management</Sector:code>
  <Sector:code id="23020">Power generation/non-renewable sources</Sector:code>
  <Sector:code id="23030">Power generation/renewable sources</Sector:code>
  <Sector:code id="23040">Electrical transmission/ distribution</Sector:code>
  <Sector:code id="23050">Gas distribution</Sector:code>
  <Sector:code id="23061">Oil-fired power plants</Sector:code>
  <Sector:code id="23062">Gas-fired power plants</Sector:code>
  <Sector:code id="23063">Coal-fired power plants</Sector:code>
  <Sector:code id="23064">Nuclear power plants</Sector:code>
  <Sector:code id="23065">Hydro-electric power plants</Sector:code>
  <Sector:code id="23066">Geothermal energy</Sector:code>
  <Sector:code id="23067">Solar energy</Sector:code>
  <Sector:code id="23068">Wind power</Sector:code>
  <Sector:code id="23069">Ocean power</Sector:code>
  <Sector:code id="23070">Biomass</Sector:code>
  <Sector:code id="23081">Energy education/training</Sector:code>
  <Sector:code id="23082">Energy research</Sector:code>
  <Sector:code id="24010">Financial policy and administrative management</Sector:code>
  <Sector:code id="24020">Monetary institutions</Sector:code>
  <Sector:code id="24030">Formal sector financial intermediaries</Sector:code>
  <Sector:code id="24040">Informal/semi-formal financial intermediaries</Sector:code>
  <Sector:code id="24081">Education/training in banking and financial services</Sector:code>
  <Sector:code id="25010">Business support services and institutions</Sector:code>
  <Sector:code id="25020">Privatisation</Sector:code>
  <Sector:code id="31110">Agricultural policy and administrative management</Sector:code>
  <Sector:code id="31120">Agricultural development</Sector:code>
  <Sector:code id="31130">Agricultural land resources</Sector:code>
  <Sector:code id="31140">Agricultural water resources</Sector:code>
  <Sector:code id="31150">Agricultural inputs</Sector:code>
  <Sector:code id="31161">Food crop production</Sector:code>
  <Sector:code id="31162">Industrial crops/export crops</Sector:code>
  <Sector:code id="31163">Livestock</Sector:code>
  <Sector:code id="31164">Agrarian reform</Sector:code>
  <Sector:code id="31165">Agricultural alternative development</Sector:code>
  <Sector:code id="31166">Agricultural extension</Sector:code>
  <Sector:code id="31181">Agricultural education/training</Sector:code>
  <Sector:code id="31182">Agricultural research</Sector:code>
  <Sector:code id="31191">Agricultural services</Sector:code>
  <Sector:code id="31192">Plant and post-harvest protection and pest control</Sector:code>
  <Sector:code id="31193">Agricultural financial services</Sector:code>
  <Sector:code id="31194">Agricultural co-operatives</Sector:code>
  <Sector:code id="31195">Livestock/veterinary services</Sector:code>
  <Sector:code id="31210">Forestry policy and administrative management</Sector:code>
  <Sector:code id="31220">Forestry development</Sector:code>
  <Sector:code id="31261">Fuelwood/charcoal</Sector:code>
  <Sector:code id="31281">Forestry education/training</Sector:code>
  <Sector:code id="31282">Forestry research</Sector:code>
  <Sector:code id="31291">Forestry services</Sector:code>
  <Sector:code id="31310">Fishing policy and administrative management</Sector:code>
  <Sector:code id="31320">Fishery development</Sector:code>
  <Sector:code id="31381">Fishery education/training</Sector:code>
  <Sector:code id="31382">Fishery research</Sector:code>
  <Sector:code id="31391">Fishery services</Sector:code>
  <Sector:code id="32110">Industrial policy and administrative management</Sector:code>
  <Sector:code id="32120">Industrial development</Sector:code>
  <Sector:code id="32130">Small and medium-sized enterprises (SME) development</Sector:code>
  <Sector:code id="32140">Cottage industries and handicraft</Sector:code>
  <Sector:code id="32161">Agro-industries</Sector:code>
  <Sector:code id="32162">Forest industries</Sector:code>
  <Sector:code id="32163">Textiles, leather and substitutes</Sector:code>
  <Sector:code id="32164">Chemicals</Sector:code>
  <Sector:code id="32165">Fertilizer plants</Sector:code>
  <Sector:code id="32166">Cement/lime/plaster</Sector:code>
  <Sector:code id="32167">Energy manufacturing</Sector:code>
  <Sector:code id="32168">Pharmaceutical production</Sector:code>
  <Sector:code id="32169">Basic metal industries</Sector:code>
  <Sector:code id="32170">Non-ferrous metal industries</Sector:code>
  <Sector:code id="32171">Engineering</Sector:code>
  <Sector:code id="32172">Transport equipment industry</Sector:code>
  <Sector:code id="32182">Technological research and development</Sector:code>
  <Sector:code id="32210">Mineral/mining policy and administrative management</Sector:code>
  <Sector:code id="32220">Mineral prospection and exploration</Sector:code>
  <Sector:code id="32261">Coal</Sector:code>
  <Sector:code id="32262">Oil and gas</Sector:code>
  <Sector:code id="32263">Ferrous metals</Sector:code>
  <Sector:code id="32264">Nonferrous metals</Sector:code>
  <Sector:code id="32265">Precious metals/materials</Sector:code>
  <Sector:code id="32266">Industrial minerals</Sector:code>
  <Sector:code id="32267">Fertilizer minerals</Sector:code>
  <Sector:code id="32268">Offshore minerals</Sector:code>
  <Sector:code id="32310">Construction policy and administrative management</Sector:code>
  <Sector:code id="33110">Trade policy and administrative management</Sector:code>
  <Sector:code id="33120">Trade facilitation</Sector:code>
  <Sector:code id="33130">Regional trade agreements (RTAs)</Sector:code>
  <Sector:code id="33140">Multilateral trade negotiations</Sector:code>
  <Sector:code id="33150">Trade-related adjustment</Sector:code>
  <Sector:code id="33181">Trade education/training</Sector:code>
  <Sector:code id="33210">Tourism policy and administrative management</Sector:code>
  <Sector:code id="41010">Environmental policy and administrative management</Sector:code>
  <Sector:code id="41020">Biosphere protection</Sector:code>
  <Sector:code id="41030">Bio-diversity</Sector:code>
  <Sector:code id="41040">Site preservation</Sector:code>
  <Sector:code id="41050">Flood prevention/control</Sector:code>
  <Sector:code id="41081">Environmental education/ training</Sector:code>
  <Sector:code id="41082">Environmental research</Sector:code>
  <Sector:code id="43010">Multisector aid</Sector:code>
  <Sector:code id="43030">Urban development and management</Sector:code>
  <Sector:code id="43040">Rural development</Sector:code>
  <Sector:code id="43050">Non-agricultural alternative development</Sector:code>
  <Sector:code id="43081">Multisector education/training</Sector:code>
  <Sector:code id="43082">Research/scientific institutions</Sector:code>
  <Sector:code id="51010">General budget support</Sector:code>
  <Sector:code id="52010">Food aid/Food security programmes</Sector:code>
  <Sector:code id="53030">Import support (capital goods)</Sector:code>
  <Sector:code id="53040">Import support (commodities)</Sector:code>
  <Sector:code id="60010">Action relating to debt</Sector:code>
  <Sector:code id="60020">Debt forgiveness</Sector:code>
  <Sector:code id="60030">Relief of multilateral debt</Sector:code>
  <Sector:code id="60040">Rescheduling and refinancing</Sector:code>
  <Sector:code id="60061">Debt for development swap</Sector:code>
  <Sector:code id="60062">Other debt swap</Sector:code>
  <Sector:code id="60063">Debt buy-back</Sector:code>
  <Sector:code id="72010">Material relief assistance and services</Sector:code>
  <Sector:code id="72040">Emergency food aid</Sector:code>
  <Sector:code id="72050">Relief co-ordination; protection and support services</Sector:code>
  <Sector:code id="73010">Reconstruction relief and rehabilitation</Sector:code>
  <Sector:code id="74010">Disaster prevention and preparedness</Sector:code>
  <Sector:code id="91010">Administrative costs</Sector:code>
  <Sector:code id="92010">Support to national NGOs</Sector:code>
  <Sector:code id="92020">Support to international NGOs</Sector:code>
  <Sector:code id="92030">Support to local and regional NGOs</Sector:code>
  <Sector:code id="93010">Refugees in donor countries</Sector:code>
  <Sector:code id="99810">Sectors not specified</Sector:code>
  <Sector:code id="99820">Promotion of development awareness</Sector:code>
</Sector:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:TiedStatus="http://dev.yipl.com.np/iati-aims/public/api/codelists/TiedStatus" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//TiedStatus:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="TiedStatus:codes">
  <xsl:param name="code"/><xsl:value-of select="TiedStatus:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<TiedStatus:codes>
  <TiedStatus:code id="3">Partially tied</TiedStatus:code>
  <TiedStatus:code id="4">Tied</TiedStatus:code>
  <TiedStatus:code id="5">Untied</TiedStatus:code>
</TiedStatus:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:TransactionType="http://dev.yipl.com.np/iati-aims/public/api/codelists/TransactionType" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//TransactionType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="TransactionType:codes">
  <xsl:param name="code"/><xsl:value-of select="TransactionType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<TransactionType:codes>
  <TransactionType:code id="C">Commitment</TransactionType:code>
  <TransactionType:code id="D">Disbursement</TransactionType:code>
  <TransactionType:code id="E">Expenditure</TransactionType:code>
  <TransactionType:code id="IR">Interest Repayment</TransactionType:code>
  <TransactionType:code id="LR">Loan Repayment</TransactionType:code>
  <TransactionType:code id="R">Reimbursement</TransactionType:code>
</TransactionType:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:VerificationStatus="http://dev.yipl.com.np/iati-aims/public/api/codelists/VerificationStatus" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//VerificationStatus:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="VerificationStatus:codes">
  <xsl:param name="code"/><xsl:value-of select="VerificationStatus:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<VerificationStatus:codes>
  <VerificationStatus:code id="0">Not verified</VerificationStatus:code>
  <VerificationStatus:code id="1">Verified</VerificationStatus:code>
</VerificationStatus:codes>


<!-- Namespace - add this to the xsl:stylesheet element 
 xmlns:Vocabulary="http://dev.yipl.com.np/iati-aims/public/api/codelists/Vocabulary" 
 -->

<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//Vocabulary:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="Vocabulary:codes">
  <xsl:param name="code"/><xsl:value-of select="Vocabulary:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<Vocabulary:codes>
  <Vocabulary:code id="ADT">AidData</Vocabulary:code>
  <Vocabulary:code id="COFOG">Classification of the Functions of Government</Vocabulary:code>
  <Vocabulary:code id="ISO">International Organization for Standardization</Vocabulary:code>
  <Vocabulary:code id="DAC">OECD Development Assistance Committee</Vocabulary:code>
  <Vocabulary:code id="WB">World Bank</Vocabulary:code>
</Vocabulary:codes>
