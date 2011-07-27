<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:iati="http://tools.aidinfolabs.org/linked-iati/def/iati-1.01#"
	xmlns:owl="http://www.w3.org/2002/07/owl#">
	<xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>	
	
	<xsl:template match="/">
		<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://purl.org/dc/elements/1.1/">
			
		<xsl:for-each select="//iati-activity">
			<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/activity/{iati-identifier}">	
				<dc:title><xsl:value-of select="title"/></dc:title>
				<iati:defaultCurrency rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/Currency/{./@default-currency}"/>
				<iati:hierarchicalPosition><xsl:value-of select="./@hierarchy"/></iati:hierarchicalPosition>
				<iati:lastUpdatedDatetime><xsl:value-of select="./@last-updated-datetime"/></iati:lastUpdatedDatetime>
				<dc:description><xsl:value-of select="description"/></dc:description>
				<iati:activityStatusCode rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/Currency/{activity-status/@code}"/>
				<iati:activityDateIsoDate><xsl:value-of select="activity-date/@iso-date"/></iati:activityDateIsoDate>
				<iati:activityDateTextDate><xsl:value-of select="activity-date/text()"/></iati:activityDateTextDate>
				
				<iati:reportingOrgIdentifier>
						<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/org/{reporting-org/@ref}">
							<iati:reportingOrgName><xsl:value-of select="reporting-org/text()"/></iati:reportingOrgName>
							<iati:reportingOrgType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/OrganisationType/{reporting-org/@type}"/>
						</rdf:Description>
				</iati:reportingOrgIdentifier>
				
				<xsl:for-each select="contact-info">
					<iati:contactInfoOrganisation>
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/contacts/{translate(organisation,' ','')}">
									<dc:title><xsl:value-of select="organisation/text()"/></dc:title>
									<iati:contactInfoPerson><xsl:value-of select="person-name"/></iati:contactInfoPerson>
									<iati:contactInfoPhone><xsl:value-of select="telephone"/></iati:contactInfoPhone>
									<iati:contactInfoEmail><xsl:value-of select="email"/></iati:contactInfoEmail>
									<iati:contactInfoAddress><xsl:value-of select="mailing-address"/></iati:contactInfoAddress>
							</rdf:Description>
					</iati:contactInfoOrganisation>
				</xsl:for-each>
				
				<xsl:for-each select="participating-org">
					<iati:participatingOrg>
						<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/activity/{../iati-identifier}/orgs/{./@ref}">
							<owl:sameAs rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/org/{./@ref}"/>
							<dc:title><xsl:value-of select="."/></dc:title>
							<iati:participatingOrgType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/OrganisationType/{./@type}"/>
							<iati:participatingOrgRole><xsl:value-of select="@role"/></iati:participatingOrgRole>
						</rdf:Description>
					</iati:participatingOrg>
				</xsl:for-each>
				
				<xsl:for-each select="recipient-country">
					<iati:recipientCountry>
						<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/Country/{./@code}">
							<dc:title><xsl:value-of select="."/></dc:title>
							<iati:recipientCountryPercentage><xsl:value-of select="@percentage"/></iati:recipientCountryPercentage>
						</rdf:Description>
					</iati:recipientCountry>
				</xsl:for-each>
				
				<xsl:for-each select="recipient-region">
					<iati:recipientRegion>
						<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/Region/{./@code}">
							<dc:title><xsl:value-of select="."/></dc:title>
							<iati:recipientRegionPercentage><xsl:value-of select="@percentage"/></iati:recipientRegionPercentage>
						</rdf:Description>
					</iati:recipientRegion>
				</xsl:for-each>
				
					<xsl:for-each select="location">
						<iati:location rdf:parseType="Resource">
							<iati:locationPercentage><xsl:value-of select="@percentage"/></iati:locationPercentage>
							<iati:locationType><xsl:value-of select="location-type"/></iati:locationType>

							<iati:locationTypeCode rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/LocationType/{location-type/@code}"/>

							<iati:locationName><xsl:value-of select="name"/></iati:locationName>
							<iati:locationDescription><xsl:value-of select="description"/></iati:locationDescription>
							<iati:locationDescription><xsl:value-of select="description/text()"/></iati:locationDescription>
							<iati:locationLanguage><xsl:value-of select="description/@xml:lang"/></iati:locationLanguage>
							<iati:locationAdministrative><xsl:value-of select="administrative"/></iati:locationAdministrative>
							<iati:locationCountry><xsl:value-of select="administrative/@country"/></iati:locationCountry>
							<iati:locationAdm1><xsl:value-of select="administrative/@adm1"/></iati:locationAdm1>
							<iati:locationAdm2><xsl:value-of select="administrative/@adm2"/></iati:locationAdm2>
							<iati:locationAdministrativeDescription><xsl:value-of select="administrative/text()"/></iati:locationAdministrativeDescription>
							<iati:locationCoordinates><xsl:value-of select="coordinates"/></iati:locationCoordinates>
							<iati:locationLatitude><xsl:value-of select="coordinates/@latitude"/></iati:locationLatitude>
							<iati:locationLongitude><xsl:value-of select="coordinates/@longitude"/></iati:locationLongitude>
							<iati:locationPrecision><xsl:value-of select="coordinates/@precision"/></iati:locationPrecision>

							<xsl:for-each select="gazetteer-entry">
								<iati:locationGazetteerEntry rdf:parseType="Resource">
									<iati:locationGazetteerAgency><xsl:value-of select="@gazetteer-ref"/></iati:locationGazetteerAgency>
									<iati:locationGazetteerIdentifier><xsl:value-of select="."/></iati:locationGazetteerIdentifier>	
								</iati:locationGazetteerEntry>
							</xsl:for-each>
						</iati:location>
					</xsl:for-each>
				
					<xsl:for-each select="sector">
						<iati:sector rdf:parseType="Resource">
							<iati:sectorVocabulary><xsl:value-of select="@vocabulary"/></iati:sectorVocabulary>
							<iati:sectorCode>
								<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/Sector/{./@code}">
								<dc:title><xsl:value-of select="."/></dc:title>
								</rdf:Description>
							</iati:sectorCode>
							<iati:sectorPercentage><xsl:value-of select="@percentage"/></iati:sectorPercentage>
						</iati:sector>
					</xsl:for-each>
					
					<xsl:for-each select="policy-marker">
						<iati:policyMarker rdf:parseType="Resource">
							<iati:policyMarkerVocabulary><xsl:value-of select="@vocabulary"/></iati:policyMarkerVocabulary>
							<iati:policyMarkerCode>
								<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/Sector/{./@code}">
								<dc:title><xsl:value-of select="."/></dc:title>
								</rdf:Description>
							</iati:policyMarkerCode>
							<iati:policyMarkerScore><xsl:value-of select="@significance"/></iati:policyMarkerScore>
						</iati:policyMarker>
					</xsl:for-each>
						
					<iati:collaborationType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/CollaborationType/{collaboration-type/@code}"/>

					<iati:defaultFlowType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/FlowType/{default-flow-type/@code}"/>

					<iati:defaultFinanceType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/FinanceType/{default-finance-type/@code}"/>

					<iati:defaultAidType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/AidType/{default-aid-type/@code}"/>

					<iati:defaultTiedStatusName rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/TiedStatus/{default-tied-status/text()"/>

					<xsl:for-each select="budget">
						<iati:budget>
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/activity/{../iati-identifier}/budget/{period-start}">
								<iati:budgetType><xsl:value-of select="@type"/></iati:budgetType>
								
								<iati:budgetPeriodStart><xsl:value-of select="period-start"/></iati:budgetPeriodStart>

								<iati:budgetPeriodStartDate><xsl:value-of select="period-start/@iso-date"/></iati:budgetPeriodStartDate>

								<iati:budgetPeriodEnd><xsl:value-of select="period-end"/></iati:budgetPeriodEnd>

								<iati:budgetPeriodEndDate><xsl:value-of select="period-end/@iso-date"/></iati:budgetPeriodEndDate>

								<iati:budgetValue><xsl:value-of select="value"/></iati:budgetValue>

								<iati:budgetValueDate><xsl:value-of select="value/@value-date"/></iati:budgetValueDate>

								<iati:budgetCurrency><xsl:value-of select="value/@currency"/></iati:budgetCurrency>

							</rdf:Description>
						</iati:budget>
					</xsl:for-each>
					
					<xsl:for-each select="planned-disbursement">
						<!--ToDo-->
					</xsl:for-each>
					
					<xsl:for-each select="transaction">
						<iati:transaction>
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/activity/{../iati-identifier}/transaction/{@ref}-{transaction-type/@code}-{value/@value-date}">
							<iati:transactionTransactionReference><xsl:value-of select="@ref"/></iati:transactionTransactionReference>
							<iati:transactionType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/TransactionType/{transaction-type/@code}"/>
							
								<iati:providerOrg>
										<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/org/{provider-org/@ref}">
										<dc:title><xsl:value-of select="provider-org"/></dc:title>
										<iati:orgType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/OrganisationType/{provider-org/@type}"/>
										</rdf:Description>
								</iati:providerOrg>
								
								<iati:recieverOrg>
										<rdf:Description rdf:about="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/org/{reciever-org/@ref}">
										<dc:title><xsl:value-of select="reciever-org"/></dc:title>
										<iati:orgType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/OrganisationType/{provider-org/@type}"/>
										</rdf:Description>
								</iati:recieverOrg>
	
								<iati:receiverOrgReceiverActivityId><xsl:value-of select="receiver-org/@receiver-activity-id"/></iati:receiverOrgReceiverActivityId>								
						
							<iati:value><xsl:value-of select="value"/></iati:value>

							<iati:valueCurrency><xsl:value-of select="value/@currency"/></iati:valueCurrency>

							<iati:valueDate><xsl:value-of select="value/@value-date"/></iati:valueDate>

							<dc:description><xsl:value-of select="description"/></dc:description>

							<iati:transactionIsoDate><xsl:value-of select="transaction-date/@iso-date"/></iati:transactionIsoDate>

							<iati:transactionDate><xsl:value-of select="transaction-date"/></iati:transactionDate>

							<iati:flowType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/FlowType/{flow-type/@code}"/>

							<iati:financeType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/FinanceType/{finance-type/@code}"/>

							<iati:aidType rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/AidType/{aid-type/@code}"/>

							<iati:disbursementChannelCode rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/DisbursementChannel/{disbursement-channel/@code}"/>
					
						<iati:tiedStatus rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/TiedStatus/{tied-status/@code}"/>
						</rdf:Description>
						</iati:transaction>
					</xsl:for-each>
					
					<xsl:for-each select="document-link">
						<iati:document-links>
							<rdf:Description rdf:about="{@url}">
								
								<iati:documentFormat rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/FileFormat/{@format}"/>
								
								<iati:documentLanguage><xsl:value-of select="language"/></iati:documentLanguage>

								<iati:documentCategory><xsl:value-of select="category"/></iati:documentCategory>

								<iati:documentCategoryCode rdf:resource="http://data.kasabi.com/dataset/international-aid-transparency-initiative-aid-activities/codelists/Document/{category/@code}"/>

								
								<dc:title><xsl:value-of select="document-link/title"/></dc:title>

							</rdf:Description>
						</iati:document-links>

					</xsl:for-each>

					<iati:activityWebsiteUrl><xsl:value-of select="activity-website/text()"/></iati:activityWebsiteUrl>						
					
					<xsl:for-each select="related-activity">
						<iati:relatedActivity rdf:parseType="Resource">
							<iati:relatedActivityType><xsl:value-of select="@type"/></iati:relatedActivityType>
							<iati:relatedActivityIdentifier><xsl:value-of select="@ref"/></iati:relatedActivityIdentifier>
							<iati:relatedActivityTitle><xsl:value-of select="."/></iati:relatedActivityTitle>
						</iati:relatedActivity>
					</xsl:for-each>

					<!--To Do: Conditions and results-->			
			</rdf:Description>
		
		</xsl:for-each>
		
		</rdf:RDF>
	</xsl:template>
	

</xsl:stylesheet>