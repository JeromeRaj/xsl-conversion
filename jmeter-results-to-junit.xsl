<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
	<xsl:template match="/testResults">
		<testsuites>
			<testsuite>
				<xsl:for-each select = "*">

						<xsl:if test="@tn != //*[contains(@tn,'TS-')]//@tn and @lb !='Debug Sampler' ">
							<testcase>
								<xsl:attribute name="classname"><xsl:value-of select="substring(//*[contains(@lb,'TS-')]//@lb,4)"/></xsl:attribute>
								<xsl:attribute name="name"><xsl:value-of select="@lb"/></xsl:attribute>
								<xsl:attribute name="time"><xsl:value-of select="@t div 1000"/></xsl:attribute>
									
									<xsl:if test="assertionResult/failureMessage">
										<failure><xsl:value-of select="assertionResult/failureMessage"/></failure>
									</xsl:if>
									<xsl:if test="@s = 'false'">

												<error>"Error"</error>

									</xsl:if>	
							
							</testcase>
						</xsl:if>
				</xsl:for-each>
			</testsuite>
		</testsuites>
	</xsl:template>
</xsl:stylesheet>

