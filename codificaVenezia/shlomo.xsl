<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
	<xsl:template match="/" >
        <html>
            <head>
                <!--titolo della pagina-->
                <title><xsl:value-of select="//tei:title"/></title>
                <!--documento css-->
                <link rel="stylesheet" href="shlomo.css"/>
            </head>
            <body>
				<header>
					<!-- titolo -->
					<h1 id="desc">
						<xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title"/>
					</h1>
				</header>
                <div class="metadatiAudio">
					<h3>Descrizione della fonte audio</h3>
					<p>Testimonianza audio del deportato Shlomo Venezia</p>
					<p>Responsabile registrazione: <xsl:value-of select="//tei:fileDesc/tei:sourceDesc/tei:recordingStmt/tei:recording/tei:respStmt/tei:name"/></p>
					<p>Anno registrazione: <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:recordingStmt/tei:recording/tei:date"/></p>
					<p>Registrato tramite:<xsl:value-of select="//tei:equipment"/></p>
					<p>Lingua:<xsl:value-of select="//tei:language"/></p>
					<p>Codifica a cura di:<xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name"/></p>
					<p>Edizione:<xsl:value-of select="//tei:fileDesc/tei:editionStmt/tei:edition"/></p>
				</div>
                <br/>
                <!--applico il template alle utterance-->
                <div id="trascrizioneAudio" class="testi">
					<h2>Trascrizione file audio, edizione diplomatico-interpretativa</h2>
					<xsl:apply-templates select="//tei:text/tei:body/tei:div/tei:u"/>
				</div>
                <footer>
				<xsl:value-of select="//tei:editionStmt/tei:edition"/>
				<xsl:value-of select="//tei:titleStmt/tei:respStmt/tei:resp"/>
				<xsl:value-of select="//tei:titleStmt/tei:respStmt/tei:name"/>
			    </footer>
		    </body>
	    </html>
    </xsl:template>
    <!-- template per output in riga-->
    <xsl:template match="//tei:text/tei:body/tei:div/tei:u">
    	<br/>
    </xsl:template>
    <!--template che prende i gap nella registrazione e le mette nella relativa classe-->
    <xsl:template match="//tei:gap">
	    <span class="gapRegistrazione"></span>
		<p>[...]</p>
    </xsl:template>
    <!--template che prende le interruzioni del discorso nella registrazione e le mette nella relativa classe-->
    <xsl:template match="//tei:del">
	    <span class="interruzioni"></span>
		<p>-<xsl:value-of select="//tei:text/tei:body/tei:div/tei:u/tei:del"/>-</p>
    </xsl:template>
    <!--template che prende i fenomeni vocali del discorso nella registrazione e le mette nella relativa classe-->
    <xsl:template match="//tei:vocal">
	    <span class="fenomenoVocale"></span>
		<p>*<xsl:value-of select="//tei:text/tei:body/tei:div/tei:u/tei:vocal/tei:desc"/>*</p>
    </xsl:template>
    <!--template che prende i movimenti del parlante nel discorso nella registrazione e le mette nella relativa classe-->
    <xsl:template match="//tei:kinesic">
    	<span class="movimenti"></span>
		<p>*<xsl:value-of select="//tei:text/tei:body/tei:div/tei:u/tei:kinesic/tei:desc"/>*</p>
    </xsl:template>
    <!--template che prende i riferimenti a luoghi/persone nel discorso nella registrazione e le mette nella relativa classe-->
    <xsl:template match="//tei:rs">
    	<span class="riferimento"></span>
    </xsl:template>
</xsl:stylesheet>
