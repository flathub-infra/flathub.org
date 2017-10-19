<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" doctype-public="XSLT-compat"
     omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
  <xsl:param name="baseurl" select="''"/>
  <xsl:param name="arch" select="'x86_64'"/>
  <xsl:template match="/components">
    <xsl:text>{ "apps" : [&#10;</xsl:text>
    <xsl:apply-templates select="component[starts-with(bundle, 'app/')]"/>
    <xsl:text>]}&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="component">
    <xsl:text>  {&#10;</xsl:text>
    <xsl:text>    "id": "</xsl:text>
    <xsl:value-of select="substring-before(substring-after(bundle, '/'), '/')"/>
    <xsl:text>",&#10;</xsl:text>
    <xsl:text>    "ref": "</xsl:text>
    <xsl:value-of select="bundle"/>
    <xsl:text>",&#10;</xsl:text>
    <xsl:text>    "name": "</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>",&#10;</xsl:text>
    <xsl:text>    "summary": "</xsl:text>
    <xsl:value-of select="summary"/>
    <xsl:text>",&#10;</xsl:text>
    <xsl:text>    "flatpakref": "</xsl:text>
    <xsl:value-of select="$baseurl"/>
    <xsl:value-of select="substring-before(substring-after(bundle, '/'), '/')"/>
    <xsl:text>.flatpakref",&#10;</xsl:text>
    <xsl:text>    "color": "#888</xsl:text>
    <xsl:text>",&#10;</xsl:text>
    <xsl:text>    "icons": {&#10;</xsl:text>
    <xsl:apply-templates select="icon[@type='cached']"/>
    <xsl:text>    }</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>  }</xsl:text>
    <xsl:if test="following-sibling::component[starts-with(bundle, 'app/')]">
      <xsl:text>,</xsl:text>
    </xsl:if>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="icon">
    <xsl:text>      "</xsl:text>
    <xsl:value-of select="@width"/>
    <xsl:text>": "</xsl:text>
    <xsl:value-of select="$baseurl"/>
    <xsl:value-of select="$arch"/>
    <xsl:text>/icons/</xsl:text>
    <xsl:value-of select="@width"/>
    <xsl:text>x</xsl:text>
    <xsl:value-of select="@height"/>
    <xsl:text>/</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>"</xsl:text>
    <xsl:if test="following-sibling::icon">
      <xsl:text>,</xsl:text>
    </xsl:if>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
</xsl:transform>

