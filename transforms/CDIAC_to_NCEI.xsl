<?xml version="1.0" encoding="UTF-8"?>
<!-- Eugene F Burger -->
<!-- PMEL, 2016 -->
<!-- This is a transform from the CDIAC XML metadata format to the NCEI OADS metadata xml format  -->


<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:java="http://xml.apache.org/xalan/java"
	exclude-result-prefixes="java"
	xmlns:xalan="http://xml.apache.org/xslt">



	<xsl:output method="xml" version="1.0" encoding="UTF-8"
		indent="yes" xalan:indent-amount="3" />
<!-- 	<xsl:preserve-space elements="metadata" /> -->

	<xsl:template match="x_tags">
   <metadata>

   <submissiondate></submissiondate>

   <related>
          <name>MISSING</name>
          <link>MISSING</link>
   </related>
	<xsl:for-each select="User">
   	<person>
	<name><xsl:value-of select="Name" /></name>
	<organization><xsl:value-of select="Organization" /></organization>
	<deliverypoint1><xsl:value-of select="Address" /></deliverypoint1>
	<deliverypoint2>MISSING</deliverypoint2>
	<city>MISSING</city>
	<administrativeArea>MISSING</administrativeArea>
	<zip>MISSING</zip>
	<country>MISSING</country>
	<phone><xsl:value-of select="Phone" />
	</phone>
	<email><xsl:value-of select="Email" />
	</email>
	<ID>MISSING</ID>
	<IDtype>MISSING</IDtype>
	</person>
   </xsl:for-each>

	 <datasubmitter>
      <name><xsl:value-of select="User/Name" /></name>
      <organization><xsl:value-of select="User/Organization" /></organization>
      <deliverypoint1><xsl:value-of select="User/Address" /></deliverypoint1>
      <deliverypoint2>MISSING</deliverypoint2>
      <city>MISSING</city>
      <administrativeArea>MISSING</administrativeArea>
      <zip>MISSING</zip>
      <country>MISSING</country>
      <phone><xsl:value-of select="User/Phone" /></phone>
      <email><xsl:value-of select="User/Email" /></email>
      <ID>MISSING</ID>
      <IDtype>MISSING</IDtype>
   </datasubmitter>
   
   <startdate><xsl:value-of select="Cruise_Info/Experiment/Cruise/Temporal_Coverage/Start_Date"></xsl:value-of></startdate>
   <enddate><xsl:value-of select="Cruise_Info/Experiment/Cruise/Temporal_Coverage/End_Date"></xsl:value-of></enddate>

   <westbd><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Bounds/Westernmost_Longitude"></xsl:value-of></westbd>
   <eastbd><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Bounds/Easternmost_Longitude"></xsl:value-of></eastbd>
   <northbd><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Bounds/Northernmost_Latitude"></xsl:value-of></northbd>
   <southbd><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Bounds/Southernmost_Latitude"></xsl:value-of></southbd>

   <spatialReference><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Geographical_Region"></xsl:value-of></spatialReference>

   <geographicName><xsl:value-of select="Cruise_Info/Experiment/Cruise/Geographical_Coverage/Geographical_Region"></xsl:value-of></geographicName>
  
   <locationOrganism>MISSING</locationOrganism>
  
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
   
   <expocode><xsl:value-of select="Cruise_Info/Experiment/Cruise/Expocode"/></expocode>
   <cruiseID><xsl:value-of select="Cruise_Info/Experiment/Cruise/Cruise_ID"/></cruiseID>
   <section>MISSING</section>
   
   <citation><xsl:value-of select="Citation"/></citation>
   <reference><xsl:value-of select="Data_set_References"/></reference>
   <suppleInfo>MISSING</suppleInfo>
   
   <link_landing>MISSING</link_landing>
   <link_download>MISSING</link_download>
   <xsl:variable name="experiment_type" select="Cruise_Info/Experiment/Experiment_Type"/>
   <xsl:value-of select="$experiment_type"/><xsl:text>*******************************************</xsl:text>
   <xsl:variable name="obs_type">
   <xsl:choose>
   	<xsl:when test="contains($experiment_type, 'cruise')">autonomous</xsl:when>
   	<xsl:when test="contains($experiment_type, 'ship')">autonomous</xsl:when>
    <xsl:when test="contains($experiment_type, 'underway')">autonomous</xsl:when>
    <xsl:when test="contains($experiment_type, 'moored buoy')">autonomous</xsl:when>
    <xsl:when test="contains($experiment_type, 'Moored Buoy')">autonomous</xsl:when>
    <xsl:otherwise></xsl:otherwise>
   </xsl:choose>
 </xsl:variable>
 
   <xsl:variable name="method_description" select="Method_Description"/>
      
   <xsl:for-each select="Variables_Info/Variable">

   <xsl:variable name="var"><xsl:value-of select="Variable_Name"/></xsl:variable>
   
<!--    <xsl:if test="contains($var, 'CO2')"> -->
<!--    	"*********************** WE Found CO2 **********************************************" -->
<!--    </xsl:if> -->
   <xsl:choose>
    <xsl:when test="contains($var, 'DIC') or contains($var, 'Dissolved Inorganic Carbon')">
   	<variable>
      <fullname>MISSING</fullname>
      <abbrev><xsl:value-of select="$var"/></abbrev>
      <observationType>MISSING</observationType>
      <insitu>MISSING</insitu>
      <manipulationMethod>MISSING</manipulationMethod>
      <unit><xsl:value-of select="Unit_of_Variable"/></unit>
      <measured>MISSING</measured>
      <calcMethod>MISSING</calcMethod>
      <samplingInstrument>MISSING</samplingInstrument>
      <analyzingInstrument>MISSING</analyzingInstrument>
      <detailedInfo><xsl:value-of select="Description_of_Variable"/></detailedInfo>
      <replicate>MISSING</replicate>
      <standard>
         <description>MISSING</description>
         <frequency>MISSING</frequency>
         <crm>
            <manufacturer>MISSING</manufacturer>
            <batch>MISSING</batch>
         </crm>
      </standard>
      <poison>
         <poisonName>MISSING</poisonName>
         <volume>MISSING</volume>
         <correction>MISSING</correction>
      </poison>
      <uncertainty>MISSING</uncertainty>
      <flag>MISSING</flag>
      <methodReference>MISSING</methodReference>
      <researcherName>MISSING</researcherName>
      <researcherInstitution>MISSING</researcherInstitution>
      <internal>1</internal>
   </variable>
   </xsl:when>
 
   <xsl:when test="contains($var, 'TA') or contains($var, 'Total alkalinity')">
   <variable>
      <fullname>MISSING</fullname>
    <abbrev><xsl:value-of select="$var"/></abbrev>
      <observationType>MISSING</observationType>
      <insitu>MISSING</insitu>
      <manipulationMethod>MISSING</manipulationMethod>
      <unit><xsl:value-of select="Unit_of_Variable"/></unit>
      <measured>MISSING</measured>
      <calcMethod>MISSING</calcMethod>
      <samplingInstrument>MISSING</samplingInstrument>
      <analyzingInstrument>MISSING</analyzingInstrument>
      <titrationType>MISSING</titrationType>
      <cellType>MISSING</cellType>
      <curveFitting>MISSING</curveFitting>
      <detailedInfo><xsl:value-of select="Description_of_Variable"/></detailedInfo>
      <replicate>MISSING</replicate>
      <standard>
         <description>MISSING</description>
         <frequency>MISSING</frequency>
         <crm>
            <manufacturer>MISSING</manufacturer>
            <batch>MISSING</batch>
         </crm>
      </standard>
      <poison>
         <poisonName>MISSING</poisonName>
         <volume>MISSING</volume>
         <correction>MISSING</correction>
      </poison>
      <blank></blank>
      <uncertainty>MISSING</uncertainty>
      <flag>MISSING</flag>
      <methodReference>MISSING</methodReference>
      <researcherName>MISSING</researcherName>
      <researcherInstitution>MISSING</researcherInstitution>
      <internal>2</internal>
   </variable>
   </xsl:when>
   
   
   <xsl:when test="contains($var, 'pH') or contains($var, 'PH')">
      <variable>
      <fullname>MISSING</fullname>
      <abbrev><xsl:value-of select="$var"/></abbrev>
      <observationType>MISSING</observationType>
      <insitu>MISSING</insitu>
      <manipulationMethod>MISSING</manipulationMethod>
      <measured>MISSING</measured>
      <calcMethod>MISSING</calcMethod>
      <samplingInstrument>MISSING</samplingInstrument>
      <analyzingInstrument>MISSING</analyzingInstrument>
      <phscale>MISSING</phscale>
      <temperatureMeasure>MISSING</temperatureMeasure>
      <detailedInfo><xsl:value-of select="Description_of_Variable"/></detailedInfo>      
      <replicate>MISSING</replicate>
      <standard>
         <description>MISSING</description>
         <frequency>MISSING</frequency>
         <standardphvalues>MISSING</standardphvalues>
         <temperatureStandardization>MISSING</temperatureStandardization>
      </standard>
      <temperatureCorrectionMethod>MISSING</temperatureCorrectionMethod>
      <phReportTemperature>MISSING</phReportTemperature>
      <uncertainty>MISSING</uncertainty>
      <flag>MISSING</flag>
      <methodReference>MISSING</methodReference>
      <researcherName>MISSING</researcherName>
      <researcherInstitution>MISSING</researcherInstitution>
      <internal>3</internal>
   </variable>
   </xsl:when>
   
<!--    <xsl:when test="contains($var, 'pCO2') or contains($var, 'x CO2')"> -->
	<xsl:when test="(contains($var, 'pCO2') or contains($var, 'fCO2') or contains($var, 'xCO2')) and contains($obs_type, 'autonomous')">
      <variable>
      <fullname>Partial pressure or fugacity of carbon dioxide in seawater</fullname>
<!--       <abbrev><xsl:value-of select="$var"/></abbrev> -->
      <observationType>Surface Underway or Mooring</observationType>
      <unit><xsl:value-of select="Unit_of_Variable"/>  uatm</unit>
      <samplingInstrument>MISSING Flow-through pump - NB - check with Kevin</samplingInstrument>
      <locationSeawaterIntake><xsl:value-of select="$method_description/Equilibrator_Design/Location_of_Sea_Water_Intake"/></locationSeawaterIntake>
      <DepthSeawaterIntake><xsl:value-of select="$method_description/Equilibrator_Design/Depth_of_Sea_Water_Intake"/></DepthSeawaterIntake>
      <analyzingInstrument>MISSING Map to CO2 sensor model and manufaturer</analyzingInstrument>
      <detailedInfo><xsl:value-of select="Description_of_Variable"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$method_description/Equilibrator_Design/System_Manufacturer_Description"/>
       <xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Location"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Manufacturer"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Model"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Accuracy"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Precision"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Calibration"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Warming"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Other_Comments"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Frequency"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Measurement_Method"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Details_Co2_Sensing"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Analysis_of_Co2_Comparison"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Measured_Co2_Params"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/No_of_Non_Zero_Gas_Stds"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/CO2_Sensor_Calibration"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Sensor_Calibration"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Environmental_Control"/>
      </detailedInfo>
      <equilibrator>
         <type><xsl:value-of select="$method_description/Equilibrator_Design/Equilibrator_Type"/></type>
         <volume><xsl:value-of select="$method_description/Equilibrator_Design/Equilibrator_Volume"/></volume>
         <vented><xsl:value-of select="$method_description/Equilibrator_Design/Vented"/></vented>
         <waterFlowRate><xsl:value-of select="$method_description/Equilibrator_Design/Water_Flow_Rate"/></waterFlowRate>
         <gasFlowRate><xsl:value-of select="$method_description/Equilibrator_Design/Headspace_Gas_Flow_Rate"/></gasFlowRate>
         <temperatureEquilibratorMethod>
        <xsl:value-of select="$method_description/Equilibrator_Design/System_Manufacturer_Description"/>
        <xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Location"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Manufacturer"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Model"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Accuracy"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Precision"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Calibration"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Warming"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Temperature/Other_Comments"/>
   		</temperatureEquilibratorMethod>
         <pressureEquilibratorMethod>
         <xsl:value-of select="$method_description/Equilibrator_Pressure/Location"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Manufacturer"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Model"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Accuracy"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Precision"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Calibration"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Warming"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Other_Comments"/>
   		<xsl:text> </xsl:text>
   		</pressureEquilibratorMethod>
         <dryMethod><xsl:value-of select="$method_description/Equilibrator_Design/Drying_Method_for_CO2_in_water"/></dryMethod>
      </equilibrator>
      <gasDetector>
         <manufacturer><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Manufacturer"/></manufacturer>
         <model><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Model"/></model>
         <resolution><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Resolution_Air"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Resolution_Water"/>
         </resolution>
         <uncertainty><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Uncertainty_Air"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Uncertainty_Water"/>
         </uncertainty>
      </gasDetector>
      <standardization>
         <standardgas>
            <manufacturer><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Manufacturer_of_Calibration_Gas"/></manufacturer>
         </standardgas>
      </standardization>
      <methodReference><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Method_References"/></methodReference>
      <internal>4</internal>
   </variable>
   
   </xsl:when>
   
   <xsl:when test="(contains($var, 'pCO2') or contains($var, 'fCO2') or contains($var, 'xCO2')) and contains($obs_type, 'discrete')">
      <variable>
      <fullname>MISSING</fullname>
      <abbrev><xsl:value-of select="$var"/></abbrev>
      <observationType>MISSING</observationType>
      <insitu>MISSING</insitu>
      <manipulationMethod>MISSING</manipulationMethod>
      <unit><xsl:value-of select="Unit_of_Variable"/></unit>
      <measured>MISSING</measured>
      <calcMethod>MISSING</calcMethod>
      <samplingInstrument>MISSING</samplingInstrument>
      <locationSeawaterIntake><xsl:value-of select="$method_description/Equilibrator_Design/Location_of_Sea_Water_Intake"/></locationSeawaterIntake>
      <DepthSeawaterIntake><xsl:value-of select="$method_description/Equilibrator_Design/Depth_of_Sea_Water_Intake"/></DepthSeawaterIntake>
      <analyzingInstrument>MISSING</analyzingInstrument>
      <detailedInfo><xsl:value-of select="Description_of_Variable"/>
     
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Frequency"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Measurement_Method"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Details_Co2_Sensing"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Analysis_of_Co2_Comparison"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Measured_Co2_Params"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/No_of_Non_Zero_Gas_Stds"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/CO2_Sensor_Calibration"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Sensor_Calibration"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Environmental_Control"/>
      </detailedInfo>
      <equilibrator>
         <type><xsl:value-of select="$method_description/Equilibrator_Design/Equilibrator_Type"/></type>
         <volume><xsl:value-of select="$method_description/Equilibrator_Design/Equilibrator_Volume"/></volume>
         <vented><xsl:value-of select="$method_description/Equilibrator_Design/Vented"/></vented>
         <waterFlowRate><xsl:value-of select="$method_description/Equilibrator_Design/Water_Flow_Rate"/></waterFlowRate>
         <gasFlowRate><xsl:value-of select="$method_description/Equilibrator_Design/Headspace_Gas_Flow_Rate"/></gasFlowRate>
         <temperatureEquilibratorMethod>MISSING</temperatureEquilibratorMethod>
         <pressureEquilibratorMethod>
         <xsl:value-of select="$method_description/Equilibrator_Pressure/Location"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Manufacturer"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Model"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Accuracy"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Precision"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Calibration"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Warming"/>
   		<xsl:text> </xsl:text>
   		<xsl:value-of select="$method_description/Equilibrator_Pressure/Other_Comments"/>
   		<xsl:text> </xsl:text>
   		</pressureEquilibratorMethod>
         <dryMethod><xsl:value-of select="$method_description/Equilibrator_Design/Drying_Method_for_CO2_in_water"/></dryMethod>
      </equilibrator>
      <gasDetector>
         <manufacturer><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Manufacturer"/></manufacturer>
         <model><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Model"/></model>
         <resolution><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Resolution_Air"/></resolution>
         <uncertainty><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Uncertainty_Air"/></uncertainty>
      </gasDetector>
      <standardization>
         <description></description>
         <frequency>MISSING</frequency>
         <standardgas>
            <manufacturer><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Manufacturer_of_Calibration_Gas"/></manufacturer>
            <concentration>MISSING</concentration>
            <uncertainty>MISSING</uncertainty>
         </standardgas>
      </standardization>
      <waterVaporCorrection>MISSING</waterVaporCorrection>
      <temperatureCorrection>MISSING</temperatureCorrection>
      <co2ReportTemperature>MISSING</co2ReportTemperature>
      <uncertainty>MISSING</uncertainty>
      <flag>MISSING</flag>
      <methodReference><xsl:value-of select="$method_description/CO2_Sensors/CO2_Sensor/Method_References"/></methodReference>
      <researcherName>MISSING</researcherName>
      <researcherInstitution>MISSING</researcherInstitution>
      <internal>5</internal>
   </variable>
 
   </xsl:when>
   
   
   <xsl:otherwise>
   <variable>
      <abbrev><xsl:value-of select="$var"/></abbrev>
      <fullname>MISSING</fullname>
      <observationType>MISSING</observationType>
      <insitu>MISSING</insitu>
      <unit><xsl:value-of select="Unit_of_Variable"/></unit>
      <measured>MISSING</measured>
      <calcMethod>MISSING</calcMethod>
      <samplingInstrument>MISSING</samplingInstrument>
      <analyzingInstrument>MISSING</analyzingInstrument>
      <duration></duration>
     <detailedInfo><xsl:value-of select="Description_of_Variable"/></detailedInfo>
      <replicate>MISSING</replicate>
      <uncertainty>MISSING</uncertainty>
      <flag>MISSING</flag>
      <methodReference>MISSING</methodReference>
      <biologicalSubject>MISSING</biologicalSubject>
      <speciesID>MISSING</speciesID>
      <lifeStage>MISSING</lifeStage>
      <researcherName>MISSING</researcherName>
      <researcherInstitution>MISSING</researcherInstitution>
      <internal>0</internal> 
   </variable>
   </xsl:otherwise>
   </xsl:choose>
<!--    	  ****************************The value of variable <xsl:value-of select="$var"/> ****************************************** -->
   </xsl:for-each>
<update><xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('yyyy-MM-dd HH:mm:ss'), java:java.util.Date.new())"/></update>
</metadata>
</xsl:template>
	
</xsl:stylesheet>


