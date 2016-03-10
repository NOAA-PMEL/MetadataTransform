<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:strip-space elements="*"/>
	<xsl:output method="xml" version="4.0" encoding="UTF-8" indent="yes" />

	
	<xsl:template match="/metadata">
<!-- 		<xsl:variable name="actexpocode"> -->
<!-- 			<xsl:value-of select="expocode" /> -->
<!-- 		</xsl:variable> -->
<!-- 		<xsl:variable name="altexpocode"> -->
<!-- 			<xsl:value-of select="cruiseID" /> -->
<!-- 		</xsl:variable> -->
<!-- 		<xsl:variable name="expocode"> -->
<!-- 			<xsl:choose> -->
<!-- 			<xsl:when test="$actexpocode != ''"> -->
<!-- 				<xsl:value-of select="$actexpocode" /> -->
<!-- 			</xsl:when> -->
<!-- 			<xsl:otherwise> -->
<!-- 				<xsl:value-of select="$altexpocode" /> -->
<!-- 			</xsl:otherwise> -->
<!-- 			</xsl:choose> -->
<!-- 		</xsl:variable> -->


<!-- 		<xsl:value-of select="$expocode" />  -->
<x_tags>
<User>
    <Name>Cathy Cosca</Name>
    <Email>cathy.cosca@noaa.gov</Email>
  </User>
	<xsl:for-each select="person">
		<xsl:value-of select="person"/>
  		<Investigator>
  		<xsl:copy>
  			<name>
  				<xsl:value-of select="name"/>
  			</name>
		</xsl:copy>		
		</Investigator>
	</xsl:for-each>
	
	<Cruise_Info>
    <Experiment>
		<xsl:template match="expocode">
			<xsl:copy>
				<xsl:value-of select="expocode"/>
			</xsl:copy>
 		</xsl:template>
	</Experiment>
	</Cruise_Info>
	</x_tags>
	</xsl:template>
</xsl:stylesheet>