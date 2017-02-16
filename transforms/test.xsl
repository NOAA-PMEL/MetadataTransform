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
		
<!-- 	<xsl:template match="x_tags"> -->
	
	 <xsl:template match="Investigator">
      	<xsl:copy-of select="@*|node()"></xsl:copy-of>
      </xsl:template>
	
<!-- 	</xsl:template> -->
	</xsl:stylesheet>