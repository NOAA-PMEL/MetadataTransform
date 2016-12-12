<?xml version="1.0" encoding="UTF-8"?>
<!-- Eugene F Burger -->
<!-- PMEL, 2016 -->
<!-- This is a transform from the CDIAC XML metadata format to the NCEI OADS metadata xml format  -->


<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:java="http://xml.apache.org/xalan/java"
	xmlns:xalan="http://xml.apache.org/xslt">



	<xsl:output method="xml" version="1.0" encoding="UTF-8"
		indent="yes" xalan:indent-amount="3" />
<!-- 	<xsl:preserve-space elements="metadata" /> -->

	<xsl:template match="x_tags">
    <metadata>

   <submissiondate></submissiondate>

   <related>
          <name></name>
          <link></link>
   </related>
	<xsl:for-each select="User">
   	<person>
	<name><xsl:value-of select="Name" /></name>
	<organization><xsl:value-of select="Organization" /></organization>
	<deliverypoint1><xsl:value-of select="Address" /></deliverypoint1>
	<deliverypoint2></deliverypoint2>
	<city></city>
	<administrativeArea></administrativeArea>
	<zip></zip>
	<country></country>
	<phone><xsl:value-of select="Phone" />
	</phone>
	<email><xsl:value-of select="Email" />
	</email>
	<ID></ID>
	<IDtype></IDtype>
	</person>
   </xsl:for-each>

	 <datasubmitter>
      <name><xsl:value-of select="User/Name" /></name>
      <organization><xsl:value-of select="User/Organization" /></organization>
      <deliverypoint1><xsl:value-of select="User/Address" /></deliverypoint1>
      <deliverypoint2></deliverypoint2>
      <city></city>
      <administrativeArea></administrativeArea>
      <zip></zip>
      <country></country>
      <phone><xsl:value-of select="User/Phone" /></phone>
      <email><xsl:value-of select="User/Email" /></email>
      <ID></ID>
      <IDtype></IDtype>
   </datasubmitter>
   
   <startdate><xsl:value-of select="Cruise_Info/Experiment/Cruise/Temporal_Coverage/Start_Date"></xsl:value-of></startdate>
   <enddate><xsl:value-of select="Cruise_Info/Experiment/Cruise/Temporal_Coverage/End_Date"></xsl:value-of></enddate>

   <westbd><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Bounds/Westernmost_Longitude"></xsl:value-of></westbd>
   <eastbd><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Bounds/Easternmost_Longitude"></xsl:value-of></eastbd>
   <northbd><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Bounds/Northernmost_Latitude"></xsl:value-of></northbd>
   <southbd><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Bounds/Southernmost_Latitude"></xsl:value-of></southbd>

   <spatialReference><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Geographical_Region"></xsl:value-of></spatialReference>

   <geographicName><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Geographical_Region"></xsl:value-of></geographicName>
  
   <fundingAgency>
      <agency><xsl:value-of select="Dataset_Info/Funding_Info"></xsl:value-of></agency>
      <title><xsl:value-of select="Dataset_Info/Funding_Info"></xsl:value-of></title>
      <ID>MISSING</ID>
   </fundingAgency>

	<researchProject>MISSING</researchProject>
	
   <Platform>
      <PlatformName><xsl:value-of select="Cruise_Info/Vessel/Vessel_Name" /></PlatformName>
      <PlatformID><xsl:value-of select="Cruise_Info/Vessel/Vessel_ID" /></PlatformID>
      <PlatformType><xsl:value-of select="Cruise_Info/PlatformType" /></PlatformType>
      <PlatformOwner><xsl:value-of select="Cruise_Info/Vessel/Vessel_Owner" /></PlatformOwner>
      <PlatformCountry><xsl:value-of select="Cruise_Info/Vessel/Country" /></PlatformCountry>
   </Platform>

<!--   </xsl:template> -->
<!-- 		<x_tags> -->
<!-- 			<User> -->
<!-- 				<xsl:for-each select="datasubmitter"> -->
<!-- 					<Name> -->
<!-- 						<xsl:value-of select="name" /> -->
<!-- 					</Name> -->
<!-- 					<Email> -->
<!-- 						<xsl:value-of select="email" /> -->
<!-- 					</Email> -->
<!-- 				</xsl:for-each> -->
<!-- 			</User> -->
<!-- 			<xsl:for-each select="person"> -->
<!-- 				<Investigator> -->
<!-- 					<Name> -->
<!-- 						<xsl:value-of select="name" /> -->
<!-- 					</Name> -->
<!-- 					<Organization> -->
<!-- 						<xsl:value-of select="organization" /> -->
<!-- 					</Organization> -->
<!-- 					<Address> -->
<!-- 						<xsl:value-of select="deliverypoint1" /> -->
<!-- 						<xsl:text> </xsl:text> -->
<!-- 						<xsl:value-of select="deliverypoint2" /> -->
<!-- 						<xsl:text> </xsl:text> -->
<!-- 						<xsl:value-of select="city" /> -->
<!-- 						<xsl:text> </xsl:text> -->
<!-- 						<xsl:value-of select="administrativeArea" /> -->
<!-- 						<xsl:text>, </xsl:text> -->
<!-- 						<xsl:value-of select="zip" /> -->
<!-- 						<xsl:text> </xsl:text> -->
<!-- 						<xsl:value-of select="country" /> -->
<!-- 					</Address> -->
<!-- 					<Phone> -->
<!-- 						<xsl:value-of select="phone" /> -->
<!-- 					</Phone> -->
<!-- 					<Email> -->
<!-- 						<xsl:value-of select="email" /> -->
<!-- 					</Email> -->
<!-- 				</Investigator> -->
<!-- 			</xsl:for-each> -->

<!-- 			<Dataset_Info> -->
<!-- 				<Dataset_ID>TBD</Dataset_ID> -->
<!-- 				<Funding_Info> -->
<!-- 					<xsl:value-of select="fundingAgency/agency" /> -->
<!-- 				</Funding_Info> -->
<!-- 				<Submission_Dates> -->
<!-- 					<Initial_Submission> -->
<!-- 						<xsl:value-of select="submissionDate" /> -->
<!-- 					</Initial_Submission> -->
<!-- 					<Revised_Submission></Revised_Submission> -->
<!-- 				</Submission_Dates> -->
<!-- 			</Dataset_Info> -->
<!-- 			<Cruise_Info> -->
<!-- 				<Experiment> -->
<!-- 					<Experiment_Name> -->
<!-- 						<xsl:value-of select="cruiseID" /> -->
<!-- 						<xsl:text>(</xsl:text> -->
<!-- 						<xsl:value-of select="expocode" /> -->
<!-- 						<xsl:text>)</xsl:text> -->
<!-- 					</Experiment_Name> -->
<!-- 					<Experiment_Type> -->
<!-- 						<xsl:value-of select="type" /> -->
<!-- 					</Experiment_Type> -->
<!-- 					<Platform_Type> -->
<!-- 						<xsl:value-of select="Platform/PlatformType" /> -->
<!-- 					</Platform_Type> -->
<!-- 					<Co2_Instrument_type> -->
<!-- 						<xsl:value-of select="variable/gasDetector/manufacturer" /> -->
<!-- 					</Co2_Instrument_type> -->
<!-- 					<Cruise> -->
<!-- 						<Cruise_ID> -->
<!-- 							<xsl:value-of select="cruiseID" /> -->
<!-- 						</Cruise_ID> -->
<!-- 						<Cruise_Info> -->
<!-- 							<xsl:value-of select="fundingAgency/title" /> -->
<!-- 						</Cruise_Info> -->
<!-- 						<Geographical_Coverage> -->
<!-- 							<Geographical_Region> -->
<!-- 								<xsl:for-each select="geographicName"> -->
<!-- 									<xsl:value-of select="." /> -->
<!-- 									<xsl:text>, </xsl:text> -->
<!-- 								</xsl:for-each> -->
<!-- 							</Geographical_Region> -->
<!-- 							<Bounds> -->
<!-- 								<Westernmost_Longitude> -->
<!-- 									<xsl:value-of select="westbd" /> -->
<!-- 								</Westernmost_Longitude> -->
<!-- 								<Easternmost_Longitude> -->
<!-- 									<xsl:value-of select="eastbd" /> -->
<!-- 								</Easternmost_Longitude> -->
<!-- 								<Northernmost_Latitude> -->
<!-- 									<xsl:value-of select="northbd" /> -->
<!-- 								</Northernmost_Latitude> -->
<!-- 								<Southernmost_Latitude> -->
<!-- 									<xsl:value-of select="southbd" /> -->
<!-- 								</Southernmost_Latitude> -->
<!-- 							</Bounds> -->
<!-- 						</Geographical_Coverage> -->
<!-- 						<Temporal_Coverage> -->
<!-- 							<Start_Date> -->
<!-- 								<xsl:value-of select="startdate" /> -->
<!-- 							</Start_Date> -->
<!-- 							<End_Date> -->
<!-- 								<xsl:value-of select="enddate" /> -->
<!-- 							</End_Date> -->
<!-- 						</Temporal_Coverage> -->
<!-- 					</Cruise> -->
<!-- 				</Experiment> -->
<!-- 				<Vessel> -->
<!-- 					<Vessel_Name> -->
<!-- 						<xsl:value-of select="Platform/PlatformName" /> -->
<!-- 					</Vessel_Name> -->
<!-- 					<Vessel_ID> -->
<!-- 						<xsl:value-of select="Platform/PlatformID" /> -->
<!-- 					</Vessel_ID> -->
<!-- 					<Vessel_Owner> -->
<!-- 						<xsl:value-of select="Platform/PlatformOwner" /> -->
<!-- 					</Vessel_Owner> -->
<!-- 				</Vessel> -->
<!-- 			</Cruise_Info> -->
<!-- 			<Variables_Info> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>XCO2_WAT</Variable_Name> -->
<!-- 					<Description_of_Variable>PPM</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>XCO2_AIR</Variable_Name> -->
<!-- 					<Description_of_Variable>PPM</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>XCO2_AIR_INTERP</Variable_Name> -->
<!-- 					<Description_of_Variable>PPM</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>EQ_PRE</Variable_Name> -->
<!-- 					<Description_of_Variable>HPA</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>ATM_PRE</Variable_Name> -->
<!-- 					<Description_of_Variable>HPA</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>EQ_TMP</Variable_Name> -->
<!-- 					<Description_of_Variable>DEG_C</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>SST</Variable_Name> -->
<!-- 					<Description_of_Variable>DEG_C</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>SSS</Variable_Name> -->
<!-- 					<Description_of_Variable>Sea surface salinity</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>FCO2_WAT_SST</Variable_Name> -->
<!-- 					<Description_of_Variable>UATM</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>FCO2_AIR</Variable_Name> -->
<!-- 					<Description_of_Variable>UATM</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>DEL_FCO2</Variable_Name> -->
<!-- 					<Description_of_Variable>UATM</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>PCO2_WAT_SST</Variable_Name> -->
<!-- 					<Description_of_Variable>UATM</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>PCO2_AIR</Variable_Name> -->
<!-- 					<Description_of_Variable>UATM</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 				<Variable> -->
<!-- 					<Variable_Name>DEL_PCO2</Variable_Name> -->
<!-- 					<Description_of_Variable>UATM</Description_of_Variable> -->
<!-- 				</Variable> -->
<!-- 			</Variables_Info> -->
<!-- 			<Method_Description> -->
<!-- 				<xsl:for-each select="variable"> -->
<!-- 					<xsl:if test="equilibrator"> -->
<!-- 						<Equilibrator_Design> -->
<!-- 							<System_Manufacturer_Description> -->
<!-- 								<xsl:value-of select="analyzingInstrument" /> -->
<!-- 							</System_Manufacturer_Description> -->
<!-- 							<Location_of_Sea_Water_Intake> -->
<!-- 								<xsl:value-of select="locationSeawaterIntake" /> -->
<!-- 							</Location_of_Sea_Water_Intake> -->
<!-- 							<Equilibrator_Type> -->
<!-- 								<xsl:value-of select="equilibrator/type" /> -->
<!-- 							</Equilibrator_Type> -->
<!-- 							<Equilibrator_Volume> -->
<!-- 								<xsl:value-of select="equilibrator/volume" /> -->
<!-- 							</Equilibrator_Volume> -->
<!-- 							<Water_Flow_Rate> -->
<!-- 								<xsl:value-of select="equilibrator/waterFlowRate" /> -->
<!-- 							</Water_Flow_Rate> -->
<!-- 							<Headspace_Gas_Flow_Rate> -->
<!-- 								<xsl:value-of select="equilibrator/gasFlowRate" /> -->
<!-- 							</Headspace_Gas_Flow_Rate> -->
<!-- 							<Vented> -->
<!-- 								<xsl:value-of select="equilibrator/vented" /> -->
<!-- 							</Vented> -->
<!-- 							<Drying_Method_for_CO2_in_water> -->
<!-- 								<xsl:value-of select="equilibrator/dryMethod" /> -->
<!-- 							</Drying_Method_for_CO2_in_water> -->
<!-- 						</Equilibrator_Design> -->
<!-- 					</xsl:if> -->
<!-- 					<xsl:if test="gasDetector"> -->
<!-- 						<CO2_Sensors> -->
<!-- 							<CO2_Sensor> -->
<!-- 								<Measurement_Method>_no_match_</Measurement_Method> -->
<!-- 								<Manufacturer> -->
<!-- 									<xsl:value-of select="gasDetector/manufacturer" /> -->
<!-- 								</Manufacturer> -->
<!-- 								<Model> -->
<!-- 									<xsl:value-of select="gasDetector/model" /> -->
<!-- 								</Model> -->
<!-- 								<Frequency>_no_match_</Frequency> -->
<!-- 								<Resolution_Water> -->
<!-- 									<xsl:value-of select="gasDetector/resolution" /> -->
<!-- 								</Resolution_Water> -->
<!-- 								<Uncertainty_Water> -->
<!-- 									<xsl:value-of select="gasDetector/uncertainty" /> -->
<!-- 								</Uncertainty_Water> -->
<!-- 								<Resolution_Air> -->
<!-- 									<xsl:value-of select="gasDetector/resolution" /> -->
<!-- 								</Resolution_Air> -->
<!-- 								<Uncertainty_Air> -->
<!-- 									<xsl:value-of select="gasDetector/uncertainty" /> -->
<!-- 								</Uncertainty_Air> -->
<!-- 								<xsl:if test="standardization"> -->
<!-- 									<Manufacturer_of_Calibration_Gas> -->
<!-- 										<xsl:value-of select="standardization/standardgas/manufacturer" /> -->
<!-- 										<xsl:text> </xsl:text> -->
<!-- 										<xsl:value-of select="standardization/standardgas/concentration" /> -->
<!-- 									</Manufacturer_of_Calibration_Gas> -->
<!-- 									<Method_References>_no_match_</Method_References> -->
<!-- 									<Measured_Co2_Params>_no_match_</Measured_Co2_Params> -->
<!-- 								</xsl:if> -->
<!-- 							</CO2_Sensor> -->
<!-- 						</CO2_Sensors> -->
<!-- 					</xsl:if> -->

<!-- 					<xsl:choose> -->
<!-- 						<xsl:when test="fullname='Sea Surface Temperature'"> -->
<!-- 							<Sea_Surface_Temperature> -->
<!-- 								<Manufacturer> -->
<!-- 									<xsl:value-of select="samplingInstrument" /> -->
<!-- 								</Manufacturer> -->
<!-- 								<Accuracy> -->
<!-- 									<xsl:value-of select="uncertainty" /> -->
<!-- 								</Accuracy> -->
<!-- 							</Sea_Surface_Temperature> -->
<!-- 						</xsl:when> -->
<!-- 						<xsl:when test="fullname='Salinity'"> -->
<!-- 							<Sea_Surface_Salinity> -->
<!-- 								<Manufacturer> -->
<!-- 									<xsl:value-of select="samplingInstrument" /> -->
<!-- 								</Manufacturer> -->
<!-- 								<Accuracy> -->
<!-- 									<xsl:value-of select="uncertainty" /> -->
<!-- 								</Accuracy> -->
<!-- 							</Sea_Surface_Salinity> -->
<!-- 						</xsl:when> -->
<!-- 					</xsl:choose> -->
<!-- 				</xsl:for-each> -->
<!-- 				<Equilibrator_Pressure> -->
<!-- 					<Normalized>_no_match_</Normalized> -->
<!-- 				</Equilibrator_Pressure> -->
<!-- 			</Method_Description> -->
<!-- 			<Data_set_References> -->
<!-- 				<xsl:for-each select="reference"> -->
<!-- 					<xsl:value-of select="." /> -->
<!-- 				</xsl:for-each> -->
<!-- 			</Data_set_References> -->
<!-- 			<Citation> -->
<!-- 				<xsl:value-of select="citation" /> -->
<!-- 			</Citation> -->
<!-- 			<Preliminary_Quality_control>_no_match_</Preliminary_Quality_control> -->
<!-- 			<Data_Set_Link> -->
<!-- 				<URL>_no_match_</URL> -->
<!-- 				<Label>_no_match_</Label> -->
<!-- 			</Data_Set_Link> -->
<!-- 			<status>_no_match_</status> -->
<!-- 			<form_type> -->
<!-- 				<xsl:value-of select="type" /> -->
<!-- 			</form_type> -->
<!-- 			<record_id>_no_match_</record_id> -->
<!-- 		</x_tags> -->
</metadata>
	</xsl:template>
	
</xsl:stylesheet>


