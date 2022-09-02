<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" encoding="utf-16" indent="yes"/>

	<xsl:template match="/">
		Esimene inimene:
		<xsl:value-of select="/inimesed/inimene[1]/eesnimi"/>
		<br/>
		Viimane inimene:
		<xsl:value-of select="/inimesed/inimene[last()]/eesnimi"/>
		<br/>
		Esitäht:
		<xsl:value-of select="substring(/inimesed/inimene[last()]/eesnimi,1,1)"/>
		<br/>
		Oma initsialid
		<xsl:value-of select="concat(substring(/inimesed/inimene[1]/eesnimi,1,1),'.',substring(/inimesed/inimene[1]/perekonanimi,1,1),'.')"/>
		<br/>
		Oma ees ja perenimi pikkus on:
		<xsl:value-of select="string-length(/inimesed/inimene[1]/eesnimi)+string-length(/inimesed/inimene[1]/perekonanimi)"/>
		<br/>
		Minu inimest on xml fallis:
		<xsl:value-of select="count(/inimesed/inimene)"/>
		<br/>
		Mitu inimest sündnud 2002 aastal:
		<xsl:value-of select="count(/inimesed/inimene[synd=2002])"/>
		<br/>
		Mitu inimest sündnud  pärast 2002 aasta:
		<xsl:value-of select="count(/inimesed/inimene[synd &gt;2002])"/>
		<br/>
		Kordused -näitamine kõik perekonnanimed ja sünniaastad
		<ul>
			<xsl:for-each select="/inimesed/inimene">
			<li>
				<xsl:value-of select="concat(perekonanimi,',',synd)"/>
			</li>
			</xsl:for-each>
		</ul>
		<br/>
		1 Näidata kõik nimed mis algavad M tähenda
		<xsl:for-each select="/inimesed/inimene[substring(eesnimi,1,1)='M']">
			<li>
				<xsl:value-of select="eesnimi"/>
			</li>
		</xsl:for-each>
		<br/>
		2 Näita kõik viimased perenimi tähed
		<xsl:for-each select="/inimesed/inimene">
			<xsl:value-of select="concat(substring(perekonanimi,string-length(perekonanimi),1),' ',',')"/>
		</xsl:for-each>
		<br/>
		3 Näita kõik inimene kui sündi aasta on 2004
		<xsl:for-each select="/inimesed/inimene[synd=2004]">
		<li>
			<xsl:value-of select="concat(eesnimi,' ',synd)"/>
		</li>
	</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
