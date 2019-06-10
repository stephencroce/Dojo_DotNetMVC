<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" indent="no"/>
  <xsl:template match="NewDataSet">
    <table width="100%">
      <tr>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td width="33%">Car Qualifier:<xsl:text> </xsl:text><xsl:value-of select="Employee"/></td>
        <td width="33%" align="center">CEI FILE #:<xsl:text> </xsl:text><xsl:value-of select="ClaimId"/></td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>