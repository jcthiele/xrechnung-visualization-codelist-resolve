<?xml version="1.0" encoding="UTF-8"?>
<!--
    Creates a xsl-template definition for a genericode file.
	Tailored for inclusion in XRechnung Visualization stylesheet 
	ubl-invoice-xr.xsl, ubl-creditnote-xr.xsl and cii-xr.xsl.
	
	Run it with:

		REM genericode xml
		set input=1153.xml 
		
		REM output file
		set output=testout.xml
	
		java -jar lib\saxon9he.jar -s:%input% -xsl:genericode2xsltemplate.xsl -o:%output%

	currently, results need some postprocessings.
	Run:
	

	Work based on: Crane-genericode2html.xsl,v 1.4 2006/12/09 19:00:09 G. Ken Holman Exp $

	Copyright (C) - Crane Softwrights Ltd.
			   - http://www.CraneSoftwrights.com/links/res-dev.htm

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

	- Redistributions of source code must retain the above copyright notice,
	this list of conditions and the following disclaimer.
	- Redistributions in binary form must reproduce the above copyright notice,
	this list of conditions and the following disclaimer in the documentation
	and/or other materials provided with the distribution.
	- The name of the author may not be used to endorse or promote products
	derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
	IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
	OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
	NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
	TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
	PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
	LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
	NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
	EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

	Note: for your reference, the above is the "Modified BSD license", this text
	 was obtained 2003-07-26 at http://www.xfree86.org/3.3.6/COPYRIGHT2.html#5
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/"
                xmlns="http://www.w3.org/TR/REC-html40"
                version="1.0">


<!-- command line variables for Column names -->
<xsl:param name="code"/>
<xsl:param name="name"/>

<!-- output as plain text -->
<xsl:output method="text" omit-xml-declaration="yes" indent="yes"/>


<xsl:template match="/">
      <xsl:choose>
	    <!-- is it a genericode list? -->
        <xsl:when test="gc:CodeList">
		
          <!-- initial template construction text -->
		  <xsl:text>&lt;?xml version="1.0"?&gt;</xsl:text>
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&lt;xsl:stylesheet version="2.0"</xsl:text>
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&#x9;xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;</xsl:text>
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&#x9;&lt;xsl:template name="code.</xsl:text><xsl:value-of select="*/Identification/ShortName"/><xsl:text>"&gt;</xsl:text>
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&#x9;&#x9;&lt;xsl:param name="myparam"/&gt;</xsl:text>
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&#x9;&#x9;&lt;xsl:variable name="myparam.upper" select="upper-case($myparam)"/&gt;</xsl:text>
		  <xsl:text>&#xA;</xsl:text>		 
		  <xsl:text>&#x9;&#x9;&lt;xsl:choose&gt;</xsl:text>

		  <xsl:apply-templates/>
		  
		  <!-- final template construction text -->
		  <xsl:text>&#x9;&#x9;&#x9;&lt;xsl:otherwise&gt;&lt;xsl:value-of select="$myparam"/&gt;&lt;/xsl:otherwise&gt;</xsl:text>		  
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&#x9;&#x9;&lt;/xsl:choose&gt;</xsl:text>
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&#x9;&lt;/xsl:template&gt;</xsl:text>
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&#xA;</xsl:text>
		  <xsl:text>&lt;/xsl:stylesheet&gt;</xsl:text>

        </xsl:when>
		
		<!-- if not a genericode list than output an error -->
        <xsl:otherwise>
          Unexpected XML document for stylesheet
        </xsl:otherwise>
		
      </xsl:choose>
</xsl:template>

<xsl:template match="/*">
  <p>
 Unexpected XML document for <samp>Crane-genericode2html.xsl</samp> stylesheet.
  </p>
  <p>
    The document element is expected to be named 
    <samp>CodeList</samp> in the
    <samp><xsl:value-of select="document('')/*/namespace::gc"/></samp>
    namespace, otherwise this message is displayed.
  </p>
  <p>
    What was found in this document is the document element named
    <samp><xsl:value-of select="name(.)"/></samp> in the
    <samp><xsl:value-of select="namespace-uri(.)"/></samp> namespace.
  </p>
</xsl:template>



<xsl:template match="/gc:CodeList" priority="2">
    <xsl:apply-templates select="SimpleCodeList"/>
</xsl:template>



<!--========================================================================-->

<!-- row segmentation and code:name extraction -->
<xsl:template match="Row">
	<xsl:variable name="thisRow" select="."/>
		
    <xsl:for-each select="../../ColumnSet/Column/@Id">		
		<xsl:variable name="columnRefX" select="current()"/>
		<!-- find and write code -->
		<xsl:if test="$columnRefX=$code">
			<xsl:text>&#x9;&#x9;&lt;xsl:when test="$myparam.upper=</xsl:text>'<xsl:value-of select="upper-case(normalize-space($thisRow/Value[@ColumnRef=current()]))"/><xsl:text>'"&gt;</xsl:text>
		</xsl:if>
		<!-- find and write corresponding name -->
		<xsl:if test="$columnRefX=$name">
			<xsl:text>&lt;xsl:value-of select="$myparam"/&gt; (</xsl:text>
			<xsl:value-of select="normalize-space($thisRow/Value[@ColumnRef=current()])"/>			
			<xsl:text>)&lt;/xsl:when&gt;</xsl:text>			
		</xsl:if>
    </xsl:for-each>
</xsl:template>


</xsl:stylesheet>
