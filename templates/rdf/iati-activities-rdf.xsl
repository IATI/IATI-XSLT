<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:iati="http://tools.aidinfolabs.org/linked-iati/def/iati-1.01#"
	xmlns:owl="http://www.w3.org/2002/07/owl#">
	<!--
	NOTES
	1)	/ in identifiers are converted to _
	2)  The mapping avoids blank nodes, so sometimes we have to construct some fairly arbitrary URIs for things based on concatenating lots of values together (as some of these could be empty)		
	-->
	<xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>	
	
	<xsl:template match="/">
		<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://purl.org/dc/elements/1.1/">
			
		<xsl:for-each select="//iati-activity">
			<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(iati-identifier,'/','_')}">	
				<dc:title><xsl:value-of select="title"/></dc:title>
				<iati:defaultCurrency rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/Currency/{./@default-currency}"/>
				<iati:hierarchicalPosition><xsl:value-of select="./@hierarchy"/></iati:hierarchicalPosition>
				<iati:lastUpdatedDatetime><xsl:value-of select="./@last-updated-datetime"/></iati:lastUpdatedDatetime>
				<dc:description><xsl:value-of select="description"/></dc:description>
				<iati:activityStatusCode rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/Currency/{activity-status/@code}"/>
				<iati:activityDateIsoDate><xsl:value-of select="activity-date/@iso-date"/></iati:activityDateIsoDate>
				<iati:activityDateTextDate><xsl:value-of select="activity-date/text()"/></iati:activityDateTextDate>
				
				<iati:reportingOrgIdentifier>
						<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/org/{reporting-org/@ref}">
							<iati:reportingOrgName><xsl:value-of select="reporting-org/text()"/></iati:reportingOrgName>
							<iati:reportingOrgType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/OrganisationType/{reporting-org/@type}"/>
						</rdf:Description>
				</iati:reportingOrgIdentifier>
				
				<xsl:for-each select="contact-info">
					<iati:contactInfoOrganisation>
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/contacts/{translate(organisation,' ','')}">
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
						<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(../iati-identifier,'/','_')}/orgs/{./@ref}">
							<rdfs:seeAlso>
								<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/org/{./@ref}">
									<dc:title><xsl:value-of select="."/></dc:title>
									<iati:orgType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/OrganisationType/{./@type}"/>
								</rdf:Description>
							</rdfs:seeAlso> 							
							<iati:participatingOrgRole><xsl:value-of select="@role"/></iati:participatingOrgRole>
						</rdf:Description>
					</iati:participatingOrg>
				</xsl:for-each>
				
				<xsl:for-each select="recipient-country">
					<iati:recipientCountry>
						<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(iati-identifier,'/','_')}/recipientCountry/{./@code}">
							<iati:country> 
								<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/codelists/IATI/Country/{./@code}">
									<dc:title><xsl:value-of select="."/></dc:title>
								</rdf:Description>
							</iati:country>
							<iati:recipientCountryPercentage><xsl:value-of select="@percentage"/></iati:recipientCountryPercentage>
						</rdf:Description>
					</iati:recipientCountry>
				</xsl:for-each>
				
				<xsl:for-each select="recipient-region">
					<iati:recipientRegion>
						<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(iati-identifier,'/','_')}/recipientRegion/{./@code}">
							<iati:region>
								<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/codelists/IATI/Region/{./@code}">
									<dc:title><xsl:value-of select="."/></dc:title>
								</rdf:Description>
							</iati:region>
							<iati:recipientRegionPercentage><xsl:value-of select="@percentage"/></iati:recipientRegionPercentage>
						</rdf:Description>
					</iati:recipientRegion>
				</xsl:for-each>
				
					<xsl:for-each select="location">
						<iati:location>
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(../iati-identifier,'/','_')}/location/{concat(@percentage,@country,administrative/@adm1,administrative/@adm2,@latitude,@longitude)}"><!--I can't come up with any other good way of getting unique URIs for these sections without using blank nodes)-->
							<iati:locationPercentage><xsl:value-of select="@percentage"/></iati:locationPercentage>
							<iati:locationType><xsl:value-of select="location-type"/></iati:locationType>
							<iati:locationTypeCode rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/LocationType/{location-type/@code}"/>
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
								<iati:locationGazetteerEntry>
									<rdf:Description about="http://data.kasabi.com/dataset/iati/activity/{translate(../../iati-identifier,'/','_')}/location/gazeteer/{@gazetteer-ref}/{.}">
										<iati:locationGazetteerAgency><xsl:value-of select="@gazetteer-ref"/></iati:locationGazetteerAgency>
										<iati:locationGazetteerIdentifier><xsl:value-of select="."/></iati:locationGazetteerIdentifier>	
									</rdf:Description>
								</iati:locationGazetteerEntry>
							</xsl:for-each>
							</rdf:Description>
						</iati:location>
					</xsl:for-each>
				
					<xsl:for-each select="sector">
						<iati:sector>
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(../iati-identifier,'/','_')}/sector/{@vocabulary}-{@code}">
								<iati:sectorVocabulary><xsl:value-of select="@vocabulary"/></iati:sectorVocabulary>
								<iati:sectorCode>
									<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/codelists/IATI/Sector/{./@code}">
										<dc:title><xsl:value-of select="."/></dc:title>
									</rdf:Description>
								</iati:sectorCode>
								<iati:sectorPercentage><xsl:value-of select="@percentage"/></iati:sectorPercentage>
							</rdf:Description>
						</iati:sector>
					</xsl:for-each>
					
					<xsl:for-each select="policy-marker">
						<iati:policyMarker>
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(../iati-identifier,'/','_')}/policyMarker/{@vocabulary}-{@code}">
								<iati:policyMarkerVocabulary><xsl:value-of select="@vocabulary"/></iati:policyMarkerVocabulary>
								<iati:policyMarkerCode>
									<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/codelists/IATI/PolicyMarker/{./@code}">
										<dc:title><xsl:value-of select="."/></dc:title>
									</rdf:Description>
								</iati:policyMarkerCode>
								<iati:policyMarkerScore><xsl:value-of select="@significance"/></iati:policyMarkerScore>
							</rdf:Description>
						</iati:policyMarker>
					</xsl:for-each>
						
					<xsl:if test="collaboration-type/@code"><iati:collaborationType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/CollaborationType/{collaboration-type/@code}	"/></xsl:if>
					<xsl:if test="default-flow-type/@code"><iati:defaultFlowType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/FlowType/{default-flow-type/@code}"/></xsl:if>	
					<xsl:if text="default-finance-type/@code"><iati:defaultFinanceType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/FinanceType/{default-finance-type/@code}"/></xsl:if>
					<xsl:if text="default-aid-type/@code"><iati:defaultAidType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/AidType/{default-aid-type/@code}"/></xsl:if>	
					<xsl:if text="default-tied-status/@code"><iati:defaultTiedStatusName rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/TiedStatus/{default-tied-status/@code}"/></xsl:if>

					<xsl:for-each select="budget">
						<iati:budget>
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(../iati-identifier,'/','_')}/budget/{period-start}">
								<iati:budgetType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/BudgetType/{@type}" />
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
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(../iati-identifier,'/','_')}/transaction/{translate(@ref,'/','_')}-{transaction-type/@code}-{value/@value-date}">
							<iati:transactionTransactionReference><xsl:value-of select="@ref"/></iati:transactionTransactionReference>
							<iati:transactionType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/TransactionType/{transaction-type/@code}"/>
							
								<xsl:if test="provider-org">
								<iati:providerOrg>
									<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/org/{translate(provider-org/@ref,'/','_')}">
											<dc:title><xsl:value-of select="provider-org"/></dc:title>
											<xsl:if test="provider-org/@type"><iati:orgType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/OrganisationType/{provider-org/@type}"/></xsl:if>
									</rdf:Description>
								</iati:providerOrg>
								</xsl:if>
								
								<xsl:if test="receiver-org">
								<iati:receiverOrg>
									<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/org/{translate(receiver-org/@ref,'/','_')}">
											<dc:title><xsl:value-of select="receiver-org"/></dc:title>
											<xsl:if test="receiver-org/@type"><iati:orgType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/OrganisationType/{receiver-org/@type}"/></xsl:if>
									</rdf:Description>
								</iati:receiverOrg>
								</xsl:if>
	
								<xsl:if test="receiver-org/@receiver-activity-id">
								<iati:receiverOrgReceiverActivityId rdf:resource="http://data.kasabi.com/dataset/iati/activity/{translate(receiver-org/@receiver-activity-id,'/','_')}" />								
								</xsl:if>
								
							<iati:value><xsl:value-of select="value"/></iati:value>
							<xsl:if test="value/@currency"><iati:valueCurrency><xsl:value-of select="value/@currency"/></iati:valueCurrency></xsl:if>
							<iati:valueDate><xsl:value-of select="value/@value-date"/></iati:valueDate>

							<xsl:if test="description"><dc:description><xsl:value-of select="description"/></dc:description></xsl:if>

							<xsl:if test="transaction-date"><iati:transactionDate><xsl:value-of select="transaction-date"/></iati:transactionDate></xsl:if>
							<xsl:if test="transaction-date/@iso-date"><iati:transactionIsoDate><xsl:value-of select="transaction-date/@iso-date"/></iati:transactionIsoDate></xsl:if>
								
							<xsl:if test="flow-type/@code"><iati:flowType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/FlowType/{flow-type/@code}"/></xsl:if>
							<xsl:if test="finance-type/@code"><iati:financeType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/FinanceType/{finance-type/@code}"/></xsl:if>
							<xsl:if test="aid-type/@code"><iati:aidType rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/AidType/{aid-type/@code}"/></xsl:if>
							<xsl:if test="disbursement-channel/@code"><iati:disbursementChannelCode rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/DisbursementChannel/{disbursement-channel/@code}"/></xsl:if>
							<xsl:if test="tied-stats/@code"><iati:tiedStatus rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/TiedStatus/{tied-status/@code}"/></xsl:if>
						</rdf:Description>
						</iati:transaction>
					</xsl:for-each>
					
					<xsl:for-each select="document-link">
						<iati:document-links>
							<rdf:Description rdf:about="{@url}">
								<iati:documentFormat rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/FileFormat/{@format}"/>
								<iati:documentLanguage><xsl:value-of select="language"/></iati:documentLanguage>
								<iati:documentCategory><xsl:value-of select="category"/></iati:documentCategory>
								<iati:documentCategoryCode rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/Document/{category/@code}"/>
								<dc:title><xsl:value-of select="document-link/title"/></dc:title>
							</rdf:Description>
						</iati:document-links>

					</xsl:for-each>

					<iati:activityWebsiteUrl><xsl:value-of select="activity-website/text()"/></iati:activityWebsiteUrl>						
					
					<!-- This should use a better n-ary relationship pattern-->
					<xsl:for-each select="related-activity">
						<iati:relatedActivity>
							<rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/activity/{translate(../iati-identifier,'/','_')}/related/{@ref}">
								<iati:relatedActivityType><xsl:value-of select="@type"/></iati:relatedActivityType>
								<iati:relatedActivityIdentifier><xsl:value-of select="@ref"/></iati:relatedActivityIdentifier>
								<owl:sameAs rdf:resource="http://data.kasabi.com/dataset/iati/activity/{translate(@ref,'/','_')}"/>
								<iati:relatedActivityTitle><xsl:value-of select="."/></iati:relatedActivityTitle>
							</rdf:Description>
						</iati:relatedActivity>
					</xsl:for-each>

					<!--To Do: Conditions and results-->			
			</rdf:Description>
		
		</xsl:for-each>
		
		</rdf:RDF>
	</xsl:template>
	

</xsl:stylesheet>