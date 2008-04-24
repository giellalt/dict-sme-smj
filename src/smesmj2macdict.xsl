<?xml version="1.0"?>
<!--+
    | Transforms termcenter.xml files into tab-separated entries of sme-nob.
    | Usage: xsltproc termc2txt.xsl termcenter.xml
    | 
    +-->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng"
  xmlns="http://www.w3.org/1999/xhtml"
  version="1.0">

<xsl:output method="xml"
            encoding="UTF-8"/>

<xsl:template match="dictionary">
<d:dictionary
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
    <xsl:apply-templates >
    </xsl:apply-templates>
</d:dictionary>
</xsl:template>

<!-- EXAMPLE ENTRIES:
<d:entry id="ldap" d:title="LDAP">
	<d:index d:value="LDAP"/>
	<h1>LDAP</h1>
	<p>Lightweight Directory Access Protocol</p>
</d:entry>

<d:entry id="make_1" d:title="make">
	<d:index d:value="make"/>
	<d:index d:value="makes"/>
	<d:index d:value="made" d:title="made (make)"/>
	<d:index d:value="making"/>
	<d:index d:value="make it" d:parental-control="1" d:anchor="xpointer(//*[@id='make_it'])"/>
	<div d:priority="2"><h1>make</h1></div><span class="syntax"><span d:pr="US">| māk |</span></span>
	<div>
		<ol>
			<li>
				Form by putting parts together or combining substances; construct; create; produce 
				<span d:priority="2"> : <i>Mother made her a beautiful dress</i>
				</span>
				.
			</li>
			<li>
				Cause to be or become
				<span d:priority="2"> : <i>The news made me happy</i>
				</span>
				.
			</li>
		</ol>
	</div>
	<div d:parental-control="1" d:priority="2">
		<h3>PHRASES</h3>
		<div id="make_it"><b>make it</b> : succeed in something; survive.</div>
		<h4><a href="x-dictionary:r:make_up_ones_mind"><b>make up one's mind</b></a></h4>
	</div>
</d:entry>
END OF EXAMPLE! -->

<xsl:template match="entry">
 <d:entry d:title="{lemma}">
            <xsl:attribute name="id">
              <xsl:value-of select="concat(lemma,
                                   '_',
                                    lemma/@POS
                                    )"/>
            </xsl:attribute>
   <d:index d:value="{lemma}"/>
   <h1><xsl:value-of select="lemma"/></h1>
   <p><xsl:value-of select="mgr/trgr/trans[1]"/></p>
 </d:entry>
</xsl:template>

<!-- OLD CODE NOT USED YET:

<xsl:template match="l">
 <b>
  <xsl:apply-templates/>
 </b>
</xsl:template>

<xsl:template match="l/@pos">
 <sup>
  <xsl:apply-templates/>
 </sup>
</xsl:template>

<xsl:template match="lc">
 <i>
  <xsl:apply-templates/>
 </i>
</xsl:template>

<xsl:template match="pos">
 <sup>
  <xsl:apply-templates/>
 </sup>
</xsl:template>

<xsl:template match="mg">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tg">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="t">

  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="t pos">
 <sup>
  <xsl:apply-templates/>
 </sup>
</xsl:template>

<xsl:template match="xg">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="x">
  <i><b><small>
   <xsl:apply-templates/>
 </small></b></i>
</xsl:template>

<xsl:template match="xt">
  <xsl:apply-templates/>
</xsl:template>
-->

</xsl:stylesheet>
