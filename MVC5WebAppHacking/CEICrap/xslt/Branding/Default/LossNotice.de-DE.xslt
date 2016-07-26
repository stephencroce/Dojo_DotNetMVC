<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:decimal-format name="european" decimal-separator="," grouping-separator="."/>
	<xsl:template match="/">
		<HTML>
			<HEAD>
				<title>KFZ SCHADENANZEIGE</title>
				<style type="text/css">
          TD, TR
          {
            background-color: White;
            color: Black;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 8pt;
            padding-left: 5px; 
          }
          
          TFOOT, THEAD, TH
          {
            font-size: 8pt;
            font-weight: bold;
            background-color: #aa2b4a;
            color: white;
            word-spacing: normal;
            letter-spacing: normal;
            text-transform: none;
            font-family: Arial, Helvetica, sans-serif;
            padding-left: 5px;
            border-bottom: #000000 1px solid;
          }
          
          TABLE.main
          { 
            border: #000000 1px solid;  
          }
          
          
          TABLE TR TD.innerleft
          {
            border-bottom: #000000 1px solid; 
            width: 300px;
            vertical-align:text-top;
            border-right: #000000 1px solid;  
          }
          
          TABLE TR TD.innerright
          {
            border-bottom: #000000 1px solid; 
            width: 300px;
            vertical-align:text-top;  
          }
          
          TABLE TR TD.lable
          {
            vertical-align:text-top;
            font-weight: bold;
            width:150px;            
          }
          TABLE TR TD.nodata
          {
            font-weight: bold;
            border-bottom: #000000 1px solid; 
          }
      </style>
				<script language="JavaScript"><![CDATA[     
      function window::onload()
      {             
        var pgCnt 
        var pgHeight
        var collP
        
        pgHeight = 1000;
        pgCnt = 1;
        
        collP = document.body.getElementsByTagName("TH");
    
        for (var p=0; p<collP.length-1; p++)
          {//alert(document.body.getElementsByTagName("TH")[p].offsetTop + ' ' + ((collP[p].offsetTop / (pgCnt * pgHeight))) + ' ' + ((collP[p+1].offsetTop / (pgCnt * pgHeight))));
            if (((collP[p].offsetTop / (pgCnt * pgHeight)) < 1) && ((collP[p+1].offsetTop / (pgCnt * pgHeight)) >= 1))
            {
              collP[p].style.pageBreakBefore = "always";            
              collP[p].style.borderTopWidth = "1px";            
              collP[p].style.borderTopColor = "#000000";    
              collP[p].style.borderTopStyle = "solid";          
              pgCnt ++;
            }
        }
      }
      
      ]]></script>
			</HEAD>
			<body>
				<xsl:apply-templates select="NewDataSet"/>
			</body>
		</HTML>
	</xsl:template>
	<xsl:template match="NewDataSet">
		<table cellpadding="0" cellspacing="0" width="600" border="0" class="main">
			<tr>
				<th colspan="4" align="left">KFZ SCHADENANZEIGE</th>
			</tr>
			<xsl:apply-templates select="C"/>
			<xsl:apply-templates select="OI"/>
			<xsl:if test="count(OI)=0">
				<tr>
					<td class="nodata" width="150">Versicherung:</td>
					<td colspan="1" width="450" class="nodata">n/a</td>
					<td colspan="2" width="450" class="nodata" align="right" style="color:white;">.</td>
				</tr>
			</xsl:if>
			<tr>
				<th colspan="4" align="left">ANGESTELLTE PERSON</th>
			</tr>
			<xsl:apply-templates select="EDC" mode="Employee"/>
			<tr>
				<th colspan="4" align="left">FAHRER</th>
			</tr>
			<xsl:apply-templates select="EDC" mode="Driver"/>
			<tr>
				<th colspan="4" align="left">FAHRZEUGDATEN VERSICHERUNGSNEHMER</th>
			</tr>
			<xsl:apply-templates select="CV"/>
			<tr>
				<th colspan="4" align="left">FAHRZEUGDATEN ANSPRUCHSTELLER</th>
			</tr>
			<xsl:apply-templates select="TP"/>
			<xsl:if test="count(TP)=0">
				<tr>
					<td colspan="4" class="nodata">n/a</td>
				</tr>
			</xsl:if>
			<tr>
				<th colspan="4" align="left">UNFALL DATEN</th>
			</tr>
			<xsl:apply-templates select="AD"/>
			<tr>
				<th colspan="4" align="left">VERLETZUNGEN</th>
			</tr>
			<xsl:apply-templates select="I"/>
			<xsl:if test="count(I)=0">
				<tr>
					<td colspan="4" class="nodata">n/a</td>
				</tr>
			</xsl:if>
			<tr>
				<th colspan="4" align="left">INSASSEN</th>
			</tr>
			<xsl:apply-templates select="P"/>
			<xsl:if test="count(P)=0">
				<tr>
					<td colspan="4" class="nodata">n/a</td>
				</tr>
			</xsl:if>
			<tr>
				<th colspan="4" align="left">ZEUGEN / FUßGÄNGER</th>
			</tr>
			<xsl:if test="count(W)=0">
				<tr>
					<td colspan="4" class="nodata">n/a</td>
				</tr>
			</xsl:if>
			<xsl:apply-templates select="W"/>
			<tr>
				<th colspan="4" align="left">ZUSÄTZLICHE INFORMATION</th>
			</tr>
			<xsl:apply-templates select="CD"/>
			<xsl:if test="count(CD)=0">
				<tr>
					<td colspan="4" style="border-bottom: #000000 1px solid;">
						<b>n/a</b>
					</td>
				</tr>
			</xsl:if>
		</table>
		<div style="page-break-before: always;"/>
		<table cellpadding="0" cellspacing="0" width="600" border="0" class="main">
			<tr>
				<th colspan="4" align="left" width="600">Erklärung Mitarbeiter</th>
			</tr>
			<tr valign="top">
				<td colspan="4">
					<table width="600" cellpadding="1" cellspacing="1" border="0">
						<tr>
							<td width="300">
              Der Fahrzeugschaden trat bei einer Dienstfahrt von Dienstfahrtziel:
              </td>
							<td width="300">
								<table>
									<tr>
										<td width="150">nach</td>
										<td width="150">ein</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="left" width="600" style="border-top: #000000 1px solid;">Vorstehende Fragen habe ich wahrheitsgemäß und nach bestem Wissen beantwortet.
Es ist mir bekannt, dass unwahre Angaben zur Versagung der Entschädigung führen.</td>
						</tr>
						<tr>
							<td>
								<br/>
								<br/>
							</td>
						</tr>
						<tr>
							<td colspan="2">Ort, Datum ___________________  Unterschrift ___________________________________</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table cellpadding="0" cellspacing="0" width="600" border="0" class="main">
			<tr>
				<th colspan="4" align="left" width="600">Erklärung</th>
			</tr>
			<tr valign="top">
				<td colspan="4">
					<table width="600" cellpadding="1" cellspacing="1" border="0">
						<tr>
							<td colspan="2" align="left" width="600">Zu belastende Kostenstelle, falls abweichende von Mitarbeiterkostenstelle:<br/>
Es wird bestätigt, dass die Dienstfahrt angeordnet bzw. genehmigt war.
</td>
						</tr>
						<tr>
							<td>
								<br/>
								<br/>
							</td>
						</tr>
						<tr>
							<td colspan="2">Ort, Datum ___________________  Unterschrift ___________________________________</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table cellpadding="0" cellspacing="0" width="600" border="0" class="main">
			<tr>
				<th colspan="4" align="left" width="600">Unfallskizze</th>
			</tr>
			<tr valign="top">
				<td colspan="4">
					<table width="600" cellpadding="1" cellspacing="1" border="0">
						<tr>
							<td>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table cellpadding="0" cellspacing="0" width="600" border="0" class="main">
			<tr valign="top">
				<td colspan="4">
					<table width="600" cellpadding="1" cellspacing="1" border="0">
						<tr>
							<td>          
                Bitte senden Sie diese Schadenanzeige vollständig ausgefüllt und von Ihnen und Ihrem Vorgesetzten unterschrieben an folgende Adresse oder Faxnummer zurück
              <br/>
								<br/>
							</td>
						</tr>
						<tr>
							<td>
              The Innovation Group (SBPO) GmbH<br/>
				Max Eyth Strasse 42<br/>
				71088 Holzgerlingen<br/>
				Deutschland<br/>
								<br/>
				Fax: 07031 – 8170 3100
              </td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="C">
		<tr>
			<td colspan="2" class="innerleft">
				<table width="300">
					<tr>
						<td class="lable">Erstellt durch:</td>
						<td width="150">The Innovation Group (SBPO) GmbH<br/>Max-Eyth-Str.42<br/>71088 Holzgerlingen</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Datum Schadenmeldung:
            </td>
						<td width="150">
							<xsl:value-of select="substring(Create_DT_UTC, 9, 2)"/>.<xsl:value-of select="substring(Create_DT_UTC, 6, 2)"/>.<xsl:value-of select="substring(Create_DT_UTC, 1, 4)"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Schaden Datum/Uhrzeit:
            </td>
						<td>
							<xsl:value-of select="substring(DateOfLoss_UTC, 9, 2)"/>.<xsl:value-of select="substring(DateOfLoss_UTC, 6, 2)"/>.<xsl:value-of select="substring(DateOfLoss_UTC, 1, 4)"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="substring(DateOfLoss_UTC, 12, 5)"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Name des Angestellten:
            </td>
						<td>
							<xsl:value-of select="../EDC/EFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/ELastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">CEI Schadennummer:
            </td>
						<td>
							<xsl:value-of select="ClaimID"/>
						</td>
					</tr>
					<tr>
						<td class="lable">
							<xsl:text> </xsl:text>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="innerleft">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Kunde:</td>
						<td width="150">
							<xsl:value-of select="ClientOrgName"/>
							<br/>
							<xsl:if test="string-length(OrgAddress1)!=0">
								<xsl:if test="OrgAddress1!=''">
									<xsl:value-of select="OrgAddress1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(OrgAddress2)!=0">
								<xsl:if test="OrgAddress2!=''">
									<xsl:value-of select="OrgAddress2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(OrgAddress3)!=0">
								<xsl:if test="OrgAddress3!=''">
									<xsl:value-of select="OrgAddress3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(OrgZipPostalCode)!=0">
								<xsl:value-of select="OrgZipPostalCode"/>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="string-length(OrgCity)!=0">
								<xsl:value-of select="OrgCity"/>
								<br/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Abteilung:</td>
						<td>
							<xsl:value-of select="Division"/>
						</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Ansprechsperson:
            </td>
						<td width="150">
							<xsl:value-of select="../EDC/CFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/CLastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Telefon-Nr.:
            </td>
						<td>
							<xsl:value-of select="../EDC/CPhoneWork"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/CPhoneWorkExt"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Fax:
            </td>
						<td>
							<xsl:value-of select="../EDC/CFaxWork"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">E-Mail:
            </td>
						<td>
							<xsl:value-of select="../EDC/CEmailWork"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Vorsteuerabzugsberechtigt:
            </td>
						<td>
							<xsl:value-of select="VatRegNo"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Kunden Schadennummer:
            </td>
						<td>
							<xsl:value-of select="ClientClaimNum"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="OI">
		<tr>
			<td class="innerleft" colspan="2">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Versicherung:
            </td>
						<td width="150">
							<xsl:value-of select="CarrierName"/>
							<br/>
							<xsl:if test="string-length(Address1)!=0">
								<xsl:if test="Address1!=''">
									<xsl:value-of select="Address1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(Address2)!=0">
								<xsl:if test="Address2!=''">
									<xsl:value-of select="Address2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(Address3)!=0">
								<xsl:if test="Address3!=''">
									<xsl:value-of select="Address3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(ZipPostalCode)!=0">
								<xsl:if test="ZipPostalCode!=''">
									<xsl:value-of select="ZipPostalCode"/>
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(City)!=0">
								<xsl:if test="City!=''">
									<xsl:value-of select="City"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
				</table>
			</td>
			<td class="innerright">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Versicherungsschein-Nr.:
            </td>
						<td width="150">
							<xsl:if test="PolicyA">
								<xsl:if test="PolicyA!=''">
									<xsl:value-of select="PolicyA"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PolicyB">
								<xsl:if test="PolicyB!=''">
									<xsl:value-of select="PolicyB"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PolicyC">
								<xsl:if test="PolicyC!=''">
									<xsl:value-of select="PolicyC"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PolicyD">
								<xsl:if test="PolicyD!=''">
									<xsl:value-of select="PolicyD"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PolicyE">
								<xsl:if test="PolicyE!=''">
									<xsl:value-of select="PolicyE"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PolicyF">
								<xsl:if test="PolicyF!=''">
									<xsl:value-of select="PolicyF"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PolicyG">
								<xsl:if test="PolicyG!=''">
									<xsl:value-of select="PolicyG"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PolicyH">
								<xsl:if test="PolicyH!=''">
									<xsl:value-of select="PolicyH"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PolicyI">
								<xsl:if test="PolicyI!=''">
									<xsl:value-of select="PolicyI"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PolicyJ">
								<xsl:if test="PolicyJ!=''">
									<xsl:value-of select="PolicyJ"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="EDC" mode="Employee">
		<xsl:if test="position()=1">
			<tr>
				<td colspan="2" class="innerleft">
					<table cellpadding="1" cellspacing="1" width="300">
						<tr>
							<td class="lable">Name:</td>
							<td width="150">
								<xsl:value-of select="EFirstName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="ELastName"/>
							</td>
						</tr>
						<tr>
							<td class="lable">Telefon-Nr.:</td>
							<td>
								<xsl:if test="EPhoneWork">
									<xsl:if test="EPhoneWork!=''">
                Telefon (Geschäftlich):<xsl:text> </xsl:text>
										<xsl:value-of select="EPhoneWork"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="EPhoneWorkExt"/>
										<br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="ECellPhoneWork">
									<xsl:if test="ECellPhoneWork!=''">
                Handy (Geschäftlich):<xsl:text> </xsl:text>
										<xsl:value-of select="ECellPhoneWork"/>
										<br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="EPhoneHome">
									<xsl:if test="EPhoneHome!=''">
                Telefon (Privat):<xsl:text> </xsl:text>
										<xsl:value-of select="EPhoneHome"/>
										<br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="ECellPhoneHome">
									<xsl:if test="ECellPhoneHome!=''">
                Handy (Privat):<xsl:text> </xsl:text>
										<xsl:value-of select="ECellPhoneHome"/>
										<br/>
									</xsl:if>
								</xsl:if>
                <xsl:if test="../EDC/EEmailWork">
                  <xsl:if test="../EDC/EEmailWork!=''">
                    (Email):<xsl:text> </xsl:text>
                    <xsl:value-of select="../EDC/EEmailWork"/>
                    <br/>
                  </xsl:if>
                </xsl:if>
              </td>
						</tr>
						<tr>
							<td class="lable">Personalnummer:</td>
							<td>
								<xsl:value-of select="EClientEmployeeNo"/>
							</td>
						</tr>
						<tr>
							<td class="lable">Geburtsdatum:</td>
							<td>
								<xsl:if test="EDOB">
									<xsl:value-of select="substring(EDOB, 9, 2)"/>.<xsl:value-of select="substring(EDOB, 6, 2)"/>.<xsl:value-of select="substring(EDOB, 1, 4)"/>
								</xsl:if>
								<xsl:text> </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="lable">Fahrzeugnutzung:</td>
							<td>
								<xsl:if test="../AD/PersonalTime=0">Dienstzeit</xsl:if>
								<xsl:if test="../AD/PersonalTime=1">Persönlich/Privat</xsl:if>
							</td>
						</tr>
					</table>
				</td>
				<td class="innerright">
					<table width="300" cellpadding="1" cellspacing="1">
						<tr>
							<td class="lable">Adresse:</td>
							<td width="150">
								<xsl:if test="string-length(EAddress1)!=0">
									<xsl:if test="EAddress1!=''">
										<xsl:value-of select="EAddress1"/>
										<br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="string-length(EAddress2)!=0">
									<xsl:if test="EAddress2!=''">
										<xsl:value-of select="EAddress2"/>
										<br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="string-length(EAddress3)!=0">
									<xsl:if test="EAddress3!=''">
										<xsl:value-of select="EAddress2"/>
										<br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="string-length(EZipPostalCode)!=0">
									<xsl:value-of select="EZipPostalCode"/>
									<xsl:text> </xsl:text>
								</xsl:if>
								<xsl:if test="string-length(ECity)!=0">
									<xsl:value-of select="ECity"/>
									<br/>
								</xsl:if>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<xsl:template match="EDC" mode="Driver">
		<tr>
			<td colspan="2" class="innerleft">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Name:</td>
						<td width="150">
							<xsl:value-of select="DFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="DLastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Telefon-Nr.:</td>
						<td>
							<xsl:if test="DPhoneWork">
								<xsl:if test="DPhoneWork!=''">
                Telefon (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="DPhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="DPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DCellPhoneWork">
								<xsl:if test="DCellPhoneWork!=''">
                Handy (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="DCellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DPhoneHome">
								<xsl:if test="DPhoneHome!=''">
                Telefon (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="DPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DCellPhoneHome">
								<xsl:if test="DCellPhoneHome!=''">
                Handy (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="DCellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Geburtsdatum:</td>
						<td>
							<xsl:if test="DDOB">
								<xsl:value-of select="substring(DDOB, 9, 2)"/>.<xsl:value-of select="substring(DDOB, 6, 2)"/>.<xsl:value-of select="substring(DDOB, 1, 4)"/>
							</xsl:if>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Beziehung zum Angestellten:</td>
						<td>
							<xsl:value-of select="DRelationship"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Führerschein Nr.:</td>
						<td>
							<xsl:value-of select="DLicenseNo"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Adresse:</td>
						<td width="150">
							<xsl:if test="string-length(DAddress1)!=0">
								<xsl:if test="DAddress1!=''">
									<xsl:value-of select="DAddress1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(DAddress2)!=0">
								<xsl:if test="DAddress2!=''">
									<xsl:value-of select="DAddress2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(DAddress3)!=0">
								<xsl:if test="DAddress3!=''">
									<xsl:value-of select="DAddress3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(DZipPostalCode)!=0">
								<xsl:value-of select="DZipPostalCode"/>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="string-length(DCity)!=0">
								<xsl:value-of select="DCity"/>
								<br/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Sicherheitsgurt angelegt:</td>
						<td>
							<xsl:value-of select="../AD/WearingSeatbelt"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Handy in Gebrauch:</td>
						<td>
							<xsl:value-of select="../AD/CellPhoneInUse"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Airbag ausgelöst:</td>
						<td>
							<xsl:value-of select="../AD/AirbagDeployed"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="CV">
		<tr>
			<td colspan="2" class="innerleft">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Marke:</td>
						<td width="150">
							<xsl:value-of select="Make"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Typ:</td>
						<td>
							<xsl:value-of select="Model"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Farbe:</td>
						<td>
							<xsl:value-of select="Color"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Baujahr:</td>
						<td>
							<xsl:value-of select="VehYear"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Amtl. Kennzeichen:</td>
						<td>
							<xsl:value-of select="PlateNo"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Kilometerstand:</td>
						<td>
							<xsl:value-of select="format-number(Mileage, '#.##0', 'european')"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Fahrzeugart:</td>
						<td>
							<xsl:value-of select="VehicleStyle"/>
						</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Hauptbeschädigung:</td>
						<td width="150">
							<xsl:value-of select="../AD/PrimaryDamageArea"/>
						</td>
					</tr>
					<tr>
						<td class="lable">zstzl. Beschädigung:</td>
						<td>
							<xsl:value-of select="../AD/AdditionalDamageArea"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Beschädigung/Diebstahl anderes Eigentum:</td>
						<td>
							<xsl:apply-templates select="../DI"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Ungefähre Schadenhöhe:</td>
						<td>
							<xsl:value-of select="../DI/DamagedAmt"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../DI/CurrenceCode"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="DI">
		<xsl:value-of select="ItemDamaged"/>
		<br/>
	</xsl:template>
	<xsl:template match="TP">
		<tr valign="top">
			<td colspan="2" class="innerleft">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Fahrzeugmarke:</td>
						<td width="150">
							<xsl:value-of select="OtherVehicleMake"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Fahrzeugtyp:</td>
						<td>
							<xsl:value-of select="OtherVehicleModel"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Farbe:</td>
						<td>
							<xsl:value-of select="OtherVehicleColor"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Amtl. Kennzeichen:</td>
						<td>
							<xsl:value-of select="OtherVehiclePlateNo"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Versicherung:</td>
						<td>
							<xsl:value-of select="InsuranceCompany"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Versicherungsschein-Nr.:</td>
						<td>
							<xsl:value-of select="InsurancePolicyNo"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Nummer des Versicherungsanspruchs:</td>
						<td>
							<xsl:value-of select="InsuranceClaimNum"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Telefon Nr.:</td>
						<td>
							<xsl:value-of select="InsurancePhoneWork"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Hauptbeschädigung:</td>
						<td>
							<xsl:value-of select="OtherVehicleImpactArea"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">zstzl. Beschädigung:</td>
						<td>
							<xsl:value-of select="OtherVehicleDamageArea"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Name Fahrer:</td>
						<td width="150">
							<xsl:value-of select="DriverFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="DriverLastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Adresse Fahrer:</td>
						<td>
							<xsl:if test="string-length(DriverAddress1)!=0">
								<xsl:if test="DriverAddress1!=''">
									<xsl:value-of select="DriverAddress1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(DriverAddress2)!=0">
								<xsl:if test="DriverAddress2!=''">
									<xsl:value-of select="DriverAddress2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(DriverAddress3)!=0">
								<xsl:if test="DriverAddress3!=''">
									<xsl:value-of select="DriverAddress3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(DriverZipPostalCode)!=0">
								<xsl:value-of select="DriverZipPostalCode"/>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="string-length(DriverCity)!=0">
								<xsl:value-of select="DriverCity"/>
								<br/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Telefon-Nr. Fahrer:</td>
						<td>
							<xsl:if test="DriverPhoneWork">
								<xsl:if test="DriverPhoneWork!=''">
                Telefon (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="DriverPhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="DriverPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverCellPhoneWork">
								<xsl:if test="DriverCellPhoneWork!=''">
                Handy (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="DriverCellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverPhoneHome">
								<xsl:if test="DriverPhoneHome!=''">
               Telefon (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="DriverPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverCellPhoneHome">
								<xsl:if test="DriverCellPhoneHome!=''">
                Handy (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="DriverCellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverFaxWork">
								<xsl:if test="DriverFaxWork!=''">
                Fax (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="DriverFaxWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverFaxHome">
								<xsl:if test="DriverFaxHome!=''">
                Fax  (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="DriverFaxHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Name Eigentümer:</td>
						<td>
							<xsl:value-of select="OwnerFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="OwnerLastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Adresse Eigentümer:</td>
						<td>
							<xsl:if test="OwnerAddress1">
								<xsl:if test="string-length(OwnerAddress1)!=0">
									<xsl:value-of select="OwnerAddress1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerAddress2">
								<xsl:if test="string-length(OwnerAddress2)!=0">
									<xsl:value-of select="OwnerAddress2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerAddress3">
								<xsl:if test="string-length(OwnerAddress3)!=0">
									<xsl:value-of select="OwnerAddress3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerZipPostalCode">
								<xsl:value-of select="OwnerZipPostalCode"/>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="string-length(OwnerCity)!=0">
								<xsl:value-of select="OwnerCity"/>
								<br/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Telefon-Nr. Eigentümer:</td>
						<td>
							<xsl:if test="OwnerPhoneWork">
								<xsl:if test="OwnerPhoneWork!=''">
                Telefon (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerPhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerCellPhoneWork">
								<xsl:if test="OwnerCellPhoneWork!=''">
                Handy (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerCellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerPhoneHome">
								<xsl:if test="OwnerPhoneHome!=''">
                Telefon (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerCellPhoneHome">
								<xsl:if test="OwnerCellPhoneHome!=''">
                Handy (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerCellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerFaxWork">
								<xsl:if test="OwnerFaxWork!=''">
                Fax (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerFaxWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerFaxHome">
								<xsl:if test="OwnerFaxHome!=''">
                Fax (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerFaxHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="AD">
		<tr valign="top">
			<td colspan="2" class="innerleft">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Codebezeichnung für den Unfall:</td>
						<td width="150">
							<xsl:value-of select="AccidentCode"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Unfallart:</td>
						<td width="150">
							<xsl:value-of select="AccidentType"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Wetterbedingungen:</td>
						<td>
							<xsl:value-of select="Weather"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Strassenbedingungen:</td>
						<td>
							<xsl:value-of select="RoadCondition"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Verkehrsregelung:</td>
						<td>
							<xsl:value-of select="TrafficControl"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Strasse:</td>
						<td>
							<xsl:value-of select="StreetHighway"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Ort:</td>
						<td>
							<xsl:value-of select="City"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Bundesland:</td>
						<td>
							<xsl:value-of select="StateProvince"/>
						</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Tempolimit:</td>
						<td width="150">
							<xsl:value-of select="SpeedLimit"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Fahrgeschwindigkeit:</td>
						<td>
							<xsl:value-of select="TravelingSpeed"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Polizei:</td>
						<td>
							<xsl:value-of select="PolicePresent"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Polizeidienststelle:</td>
						<td>
							<xsl:value-of select="../C/PoliceDept"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Name/Nr. Polizeibeamten:</td>
						<td>
							<xsl:value-of select="../C/BadgeNo"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Polizei Aktenzeichen:</td>
						<td>
							<xsl:value-of select="PoliceReportNo"/>
						</td>
					</tr>
					<xsl:if test="count(../PR[ClaimVehicleID])>0">
						<tr>
							<td class="lable">Vermerk ausgestellt (unser Fahrzeug)</td>
							<td valign="top">
								<xsl:apply-templates select="../PR[ClaimVehicleID]"/>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="count(../PR[OtherVehID])>0">
						<tr>
							<td class="lable">Vermerk ausgestellt (anderes Fahrzeug)</td>
							<td valign="top">
								<xsl:apply-templates select="../PR[OtherVehID]"/>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="4" width="600" style="border-bottom: #000000 1px solid;">
				<table width="600">
					<tr>
						<td class="lable">Beschreibung des Unfalls:</td>
						<td width="450">
							<xsl:value-of select="AccidentDesc"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="PR">
		<xsl:value-of select="CitationIssued"/>
		<br/>
	</xsl:template>
	<xsl:template match="I">
		<tr valign="top">
			<td class="innerleft" colspan="2">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Name:</td>
						<td width="150">
							<xsl:value-of select="FirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="LastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Telefon-Nr:</td>
						<td>
							<xsl:if test="PhoneWork">
								<xsl:if test="PhoneWork!=''">
                Telefon (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneWork">
								<xsl:if test="CellPhoneWork!=''">
                Handy (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PhoneHome">
								<xsl:if test="PhoneHome!=''">
                Telefon (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneHome">
								<xsl:if test="CellPhoneHome!=''">
                Handy (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Alter:</td>
						<td>
							<xsl:value-of select="Age"/>
						</td>
					</tr>
					<tr>
						<td class="lable">In Fahrzeug:</td>
						<td>
							<xsl:value-of select="CVPlateNo"/>
							<xsl:value-of select="OVPlateNo"/>
						</td>
					</tr>
				</table>
			</td>
			<td class="innerright" colspan="2">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Adresse:</td>
						<td width="150">
							<xsl:if test="string-length(Address1)!=0">
								<xsl:if test="Address1!=''">
									<xsl:value-of select="Address1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(Address2)!=0">
								<xsl:if test="Address2!=''">
									<xsl:value-of select="Address2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(Address3)!=0">
								<xsl:if test="Address3!=''">
									<xsl:value-of select="Address3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(ZipPostalCode)!=0">
								<xsl:value-of select="ZipPostalCode"/>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="string-length(City)!=0">
								<xsl:value-of select="City"/>
								<br/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Verletzung:</td>
						<td>
							<xsl:value-of select="InjuryDesc"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="P">
		<tr valign="top">
			<td class="innerleft" colspan="2">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Name:</td>
						<td width="150">
							<xsl:value-of select="FirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="LastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Telefon-Nr.:</td>
						<td>
							<xsl:if test="PhoneWork">
								<xsl:if test="PhoneWork!=''">
                Telefon (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneWork">
								<xsl:if test="CellPhoneWork!=''">
                Handy (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PhoneHome">
								<xsl:if test="PhoneHome!=''">
                Telefon (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneHome">
								<xsl:if test="CellPhoneHome!=''">
                Handy (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">In Fahrzeug:</td>
						<td>
							<xsl:value-of select="CVPlateNo"/>
							<xsl:value-of select="OVPlateNo"/>
						</td>
					</tr>
				</table>
			</td>
			<td class="innerright" colspan="2">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Adresse:</td>
						<td width="150">
							<xsl:if test="string-length(Address1)!=0">
								<xsl:if test="Address1!=''">
									<xsl:value-of select="Address1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(Address2)!=0">
								<xsl:if test="Address2!=''">
									<xsl:value-of select="Address2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(Address3)!=0">
								<xsl:if test="Address3!=''">
									<xsl:value-of select="Address3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(ZipPostalCode)!=0">
								<xsl:value-of select="ZipPostalCode"/>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="string-length(City)!=0">
								<xsl:value-of select="City"/>
								<br/>
							</xsl:if>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="W">
		<tr valign="top">
			<td colspan="2" class="innerleft">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Name:</td>
						<td width="150">
							<xsl:value-of select="FirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="LastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Telefon-Nr.:</td>
						<td>
							<xsl:if test="PhoneWork">
								<xsl:if test="PhoneWork!=''">
                Telefon (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneWork">
								<xsl:if test="CellPhoneWork!=''">
                Handy (Geschäftlich):<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PhoneHome">
								<xsl:if test="PhoneHome!=''">
                Telefon (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneHome">
								<xsl:if test="CellPhoneHome!=''">
                Handy (Privat):<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
				</table>
			</td>
			<td class="innerright" colspan="2">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Adresse:</td>
						<td width="150">
							<xsl:if test="Address1">
								<xsl:if test="string-length(Address1)!=0">
									<xsl:value-of select="Address1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(Address2)!=0">
								<xsl:if test="Address2!=''">
									<xsl:value-of select="Address2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(Address3)!=0">
								<xsl:if test="Address3!=''">
									<xsl:value-of select="Address3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(ZipPostalCode)!=0">
								<xsl:value-of select="ZipPostalCode"/>
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="string-length(City)!=0">
								<xsl:value-of select="City"/>
								<br/>
							</xsl:if>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="CD">
		<tr valign="top">
			<td colspan="4" style="border-bottom: #000000 1px solid;">
				<table width="600" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">
							<xsl:value-of select="Name"/>
						</td>
						<td width="450">
						<xsl:if test="XTypeID = 2">
							<xsl:choose>
									<xsl:when test="Value = 0">No</xsl:when>
									<xsl:when test="Value = 1">Yes</xsl:when>
									<xsl:otherwise>N/A</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							<xsl:if test="XTypeID != 2">
										<xsl:value-of select="Value"/>
							</xsl:if>
								
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
