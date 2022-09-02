<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>
	
    <xsl:template match="/" >
	<ul>
		<xsl:for-each select="//inimene">
			<xsl:sort select="@synd"/>
				<li>
					<xsl:value-of select="concat(nimi,' , ',@synd)"/>
				</li>
		</xsl:for-each>
	</ul>
		-----
		<ul>
			<strong>2. Näidata lastele tema vanema</strong>
		
		<xsl:for-each select="//inimene">
			<xsl:sort select="synd"/>
			<li>
				<xsl:value-of select="nimi"/>
				<xsl:if test="../..">
				- lapsevanem 
				<xsl:value-of select="../../nimi"/>
				</xsl:if>
			</li>
		</xsl:for-each>
		</ul>
		-----
		<ul>
			<strong>3. Näitame iga vanemale lapse kogu</strong>
		
		<xsl:for-each select="//inimene[lapsed]">
			<xsl:sort select="lapsed/inimene/synd" order="descending"/>
			<li>
				<xsl:value-of select="concat(nimi,' ')"/>
				<xsl:value-of select="count(lapsed/inimene)"/>
				<xsl:if test="count(lapsed/inimene)=1">
					- laps
				</xsl:if>
				<xsl:if test="not(count(lapsed/inimene)=1)">
					- last
				</xsl:if>
			</li>
		</xsl:for-each>
		</ul>
		--Vanem:Laps1,laps2,...lapsN---
		<ul>
		<xsl:for-each select="//inimene[lapsed]">
			<li>
				<xsl:value-of select="concat(nimi,': ')"/>
				<xsl:for-each select="lapsed/inimene">
					<xsl:value-of select="concat(nimi,', ')"/>
				</xsl:for-each>

			</li>
		</xsl:for-each>
	</ul>
		1. Trüki välja kõikide inimeste sünniaastad
		<ul>
			<xsl:for-each select="//inimene">
				<xsl:sort select="@synd"/>
				<li>
					<xsl:value-of select="@synd"/>
				</li>
			</xsl:for-each>
		</ul>

		<ul>
			<strong>2. Väljastatakse nimed, kel on vähemalt kaks last </strong>

			<xsl:for-each select="//inimene[lapsed]">
				<xsl:sort select="lapsed/inimene/synd" order="descending"/>
				<li>
					<xsl:if test="not(count(lapsed/inimene)=1)">
						<xsl:value-of select="nimi"/>
					</xsl:if>

				</li>
			</xsl:for-each>
		</ul>

		
		<strong>3.  Väljasta sugupuus leiduvad andmed tabelina </strong>

		<ul>
			<strong>4. Kus võimalik, seal väljasta tabelis iga inimese vanema nimi </strong>

			<table style="width:20%; border:1px solid black" >
					<xsl:for-each select="//inimene">
						<xsl:sort select="synd"/>
				<tr style="border:1px solid black">
			
				
				<td style="border:1px solid black">
					<xsl:if test="../..">
						<xsl:value-of select="../../nimi"/>
					</xsl:if>
					</td>
					<td style="border:1px solid black" >
						<xsl:value-of select="nimi"/>
				</td>
			
			</tr>
					</xsl:for-each>
			</table>
		</ul>
		6. Выводить в  таблице возраст каждого ребенка
		<ul>
		<xsl:for-each select="//inimene[lapsed]">
			<xsl:sort select="lapsed/inimene"/>
			<li>
				<xsl:value-of select="concat(nimi,' , ',2022 - @synd )"/>
			</li>
		</xsl:for-each>
		</ul>
		<strong>7.   Väljasta iga inimese juures, mitmendal oma vanema sünniaastal ta sündis. </strong>
		<ul>
			
				
		</ul>
		
	
		<strong>10.Tabelis kõik nimed pikkusega </strong>
		<table>
		<xsl:for-each select="//inimene">
			<tr>
				<xsl:if test="string-length(nimi)&lt;7">
				<td style="background: green">
					<xsl:value-of select="nimi" />
				</td>
				</xsl:if>
				<xsl:if test="string-length(nimi)&gt;7">
					<td>
						<xsl:value-of select="nimi" />
					</td>
				</xsl:if>
			</tr>
		</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
