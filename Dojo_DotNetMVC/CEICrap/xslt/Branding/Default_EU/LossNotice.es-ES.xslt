<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<HTML>
			<HEAD>
				<title>Loss Notice Report</title>
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
            background-color: #f7f7f7;
            color: black;
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
				<th colspan="4" align="left">MOTOR ACCIDENT/THEFT REPORT</th>
			</tr>
			<xsl:apply-templates select="C"/>
			<xsl:apply-templates select="OI"/>
			<xsl:if test="count(OI)=0">
				<tr>
					<td class="nodata" width="150">Insurer Details:</td>
					<td colspan="1" width="450" class="nodata">None</td>
					<td colspan="2" width="450" class="nodata" align="right" style="color:white;">.</td>
				</tr>
			</xsl:if>
			<tr>
				<th colspan="4" align="left">EMPLOYEE</th>
			</tr>
			<xsl:apply-templates select="EDC" mode="Employee"/>
			<tr>
				<th colspan="4" align="left">DRIVER</th>
			</tr>
			<xsl:apply-templates select="EDC" mode="Driver"/>
			<tr>
				<th colspan="4" align="left">INSURED VEHICLE</th>
			</tr>
			<xsl:apply-templates select="CV"/>
			<tr>
				<th colspan="4" align="left">THIRD PARTIES</th>
			</tr>
			<xsl:apply-templates select="TP"/>
			<xsl:if test="count(TP)=0">
				<tr>
					<td colspan="4" class="nodata">None</td>
				</tr>
			</xsl:if>
			<tr>
				<th colspan="4" align="left">INCIDENT DETAILS</th>
			</tr>
			<xsl:apply-templates select="AD"/>
			<tr>
				<th colspan="4" align="left">INJURIES</th>
			</tr>
			<xsl:apply-templates select="I"/>
			<xsl:if test="count(I)=0">
				<tr>
					<td colspan="4" class="nodata">None</td>
				</tr>
			</xsl:if>
			<tr>
				<th colspan="4" align="left">PASSENGERS</th>
			</tr>
			<xsl:apply-templates select="P"/>
			<xsl:if test="count(P)=0">
				<tr>
					<td colspan="4" class="nodata">None</td>
				</tr>
			</xsl:if>
			<tr>
				<th colspan="4" align="left">WITNESSES</th>
			</tr>
			<xsl:if test="count(W)=0">
				<tr>
					<td colspan="4" class="nodata">None</td>
				</tr>
			</xsl:if>
			<xsl:apply-templates select="W"/>
			<tr>
				<th colspan="4" align="left">SUPPLEMENTAL INFORMATION</th>
			</tr>
			<xsl:apply-templates select="CD"/>
			<xsl:if test="count(CD)=0">
				<tr>
					<td colspan="4" style="border-bottom: #000000 1px solid;">
						<b>None</b>
					</td>
				</tr>
			</xsl:if>
		</table>
		<div style="page-break-before: always;"/>
		<table cellpadding="0" cellspacing="0" width="600" border="0" class="main">
			<tr>
				<th colspan="4" align="left" width="600">SKETCH</th>
			</tr>
			<tr valign="top">
				<td colspan="4">
					<table width="600" cellpadding="1" cellspacing="1">
						<tr>
							<td colspan="2" width="600">
              Show your position of vehicles, persons or obstacles. Mark names and width of roads, brake marks, road signs or anything having a bearing upon the accident. If you wish you may use a separate sheet of paper.<br/>
							</td>
						</tr>
						<tr>
							<td colspan="2"/>
						</tr>
						<tr>
							<td align="center" width="300" style="border-bottom: #000000 1px solid;border-top: #000000 1px solid;">Before</td>
							<td align="center" width="300" style="border-bottom: #000000 1px solid;border-top: #000000 1px solid">After</td>
						</tr>
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
								<br/>
							</td>
						</tr>
						<tr>
							<td>Declaration</td>
						</tr>
						<tr>
							<td colspan="2">I/We declare that, to the best of my/our knowledge, these statements are true.<br/>
								<br/>
								<br/>
							</td>
						</tr>
						<tr>
							<td colspan="2">Date _____/_____/_______  Driver's Signature ___________________________________</td>
						</tr>
						<tr>
							<td>Please return signed and completed form to:</td>
							<td>
								<br/>
                CEI Europe<br/>
                PO Box 3198<br/>
                Slough<br/>              
                SL2 4WY<br/>              
                UNITED KINGDOM 
              </td>
							<tr>
								<td colspan="2">or by fax at 0 800 073 0204</td>
							</tr>
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
						<td class="lable">Report Generated By:</td>
						<td width="150">CEI Europe<br/>PO Box 3198<br/>Slough<br/>SL2 4WY<br/>UNITED KINGDOM</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Report Date:
            </td>
						<td width="150">
							<xsl:value-of select="ReportDate"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Date/Time of Incident:
            </td>
						<td>							
							<xsl:value-of select="DateOfLoss"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Employee Name:
            </td>
						<td>
							<xsl:value-of select="../EDC/EFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/ELastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">CEI Claim Number:
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
						<td class="lable">Client:</td>
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
							<xsl:if test="string-length(OrgCity)!=0">
								<xsl:value-of select="OrgCity"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(OrgStateProvince)!=0">
								<xsl:value-of select="OrgStateProvince"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(OrgZipPostalCode)!=0">
								<xsl:value-of select="OrgZipPostalCode"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(OrgCountry)!=0">
								<xsl:if test="OrgCountry!=''">
									<xsl:value-of select="OrgCountry"/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Branch/Division:</td>
						<td>
							<xsl:value-of select="Division"/>
						</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Contact:
            </td>
						<td width="150">
							<xsl:value-of select="../EDC/CFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/CLastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Telephone No:
            </td>
						<td>
							<xsl:value-of select="../EDC/CPhoneWork"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/CPhoneWorkExt"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Facsimile No:
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
						<td class="lable">VAT Reg:
            </td>
						<td>
							<xsl:value-of select="VatRegNo"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Client Claim Number:
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
						<td class="lable">Insurer Details:
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
							<xsl:if test="string-length(City)!=0">
								<xsl:if test="City!=''">
									<xsl:value-of select="City"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(StateProvince)!=0">
								<xsl:if test="StateProvince!=''">
									<xsl:value-of select="StateProvince"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(ZipPostalCode)!=0">
								<xsl:if test="ZipPostalCode!=''">
									<xsl:value-of select="ZipPostalCode"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(Country)!=0">
								<xsl:if test="Country!=''">
									<xsl:value-of select="Country"/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
				</table>
			</td>
			<td class="innerright">
				<table cellpadding="1" cellspacing="1" width="300">
					<tr>
						<td class="lable">Policy/Certificate No:
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
							<td class="lable">Telephone No:</td>
							<td>
								<xsl:if test="EPhoneWork">
									<xsl:if test="EPhoneWork!=''">
                Phone Work:<xsl:text> </xsl:text>
										<xsl:value-of select="EPhoneWork"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="EPhoneWorkExt"/>
										<br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="ECellPhoneWork">
									<xsl:if test="ECellPhoneWork!=''">
                Mobile Work:<xsl:text> </xsl:text>
										<xsl:value-of select="ECellPhoneWork"/>
										<br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="EPhoneHome">
									<xsl:if test="EPhoneHome!=''">
                Phone Home:<xsl:text> </xsl:text>
										<xsl:value-of select="EPhoneHome"/>
										<br/>
									</xsl:if>
								</xsl:if>
								<xsl:if test="ECellPhoneHome">
									<xsl:if test="ECellPhoneHome!=''">
                Mobile Home:<xsl:text> </xsl:text>
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
							<td class="lable">Staff Number:</td>
							<td>
								<xsl:value-of select="EClientEmployeeNo"/>
							</td>
						</tr>
						<tr>
							<td class="lable">Date of Birth:</td>
							<td>
								<xsl:if test="EDOB">
									<xsl:value-of select="substring(EDOB, 9, 2)"/>/<xsl:value-of select="substring(EDOB, 6, 2)"/>/<xsl:value-of select="substring(EDOB, 1, 4)"/>
								</xsl:if>
								<xsl:text> </xsl:text>
							</td>
						</tr>
						<tr>
							<td class="lable">Use of Vehicle:</td>
							<td>
								<xsl:if test="../AD/PersonalTime=0">Work Time</xsl:if>
								<xsl:if test="../AD/PersonalTime=1">Personal</xsl:if>
							</td>
						</tr>
					</table>
				</td>
				<td class="innerright">
					<table width="300" cellpadding="1" cellspacing="1">
						<tr>
							<td class="lable">Address:</td>
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
								<xsl:if test="string-length(ECity)!=0">
									<xsl:value-of select="ECity"/>
									<br/>
								</xsl:if>
								<xsl:if test="string-length(EStateProvince)!=0">
									<xsl:value-of select="EStateProvince"/>
									<br/>
								</xsl:if>
								<xsl:if test="string-length(EZipPostalCode)!=0">
									<xsl:value-of select="EZipPostalCode"/>
									<br/>
								</xsl:if>
								<xsl:if test="string-length(ECountry)!=0">
									<xsl:if test="ECountry!=''">
										<xsl:value-of select="ECountry"/>
									</xsl:if>
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
						<td class="lable">Telephone No:</td>
						<td>
							<xsl:if test="DPhoneWork">
								<xsl:if test="DPhoneWork!=''">
                Phone Work:<xsl:text> </xsl:text>
									<xsl:value-of select="DPhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="DPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DCellPhoneWork">
								<xsl:if test="DCellPhoneWork!=''">
                Mobile Work:<xsl:text> </xsl:text>
									<xsl:value-of select="DCellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DPhoneHome">
								<xsl:if test="DPhoneHome!=''">
                Phone Home:<xsl:text> </xsl:text>
									<xsl:value-of select="DPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DCellPhoneHome">
								<xsl:if test="DCellPhoneHome!=''">
                Mobile Home:<xsl:text> </xsl:text>
									<xsl:value-of select="DCellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Date of Birth:</td>
						<td>
							<xsl:if test="DDOB">
								<xsl:value-of select="substring(DDOB, 9, 2)"/>/<xsl:value-of select="substring(DDOB, 6, 2)"/>/<xsl:value-of select="substring(DDOB, 1, 4)"/>
							</xsl:if>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Relationship to Employee:</td>
						<td>
							<xsl:value-of select="DRelationship"/>
						</td>
					</tr>
					<tr>
						<td class="lable">License Number:</td>
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
						<td class="lable">Address:</td>
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
							<xsl:if test="string-length(DCity)!=0">
								<xsl:value-of select="DCity"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(DStateProvince)!=0">
								<xsl:value-of select="DStateProvince"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(DZipPostalCode)!=0">
								<xsl:value-of select="DZipPostalCode"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(DCountry)!=0">
								<xsl:if test="DCountry!=''">
									<xsl:value-of select="DCountry"/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Seat Belt Worn:</td>
						<td>
							<xsl:value-of select="../AD/WearingSeatbelt"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Mobile Phone In Use:</td>
						<td>
							<xsl:value-of select="../AD/CellPhoneInUse"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Airbag Deployed:</td>
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
						<td class="lable">Make:</td>
						<td width="150">
							<xsl:value-of select="Make"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Model:</td>
						<td>
							<xsl:value-of select="Model"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Colour:</td>
						<td>
							<xsl:value-of select="Color"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Year:</td>
						<td>
							<xsl:value-of select="VehYear"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Registration Plate:</td>
						<td>
							<xsl:value-of select="PlateNo"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Mileage:</td>
						<td>
							<xsl:value-of select="format-number(Mileage,'#,##0')"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Body Type:</td>
						<td>
							<xsl:value-of select="VehicleStyle"/>
						</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Primary Impact:</td>
						<td width="150">
							<xsl:value-of select="../AD/PrimaryDamageArea"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Additional Impact:</td>
						<td>
							<xsl:value-of select="../AD/AdditionalDamageArea"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Other Items Damaged or Stolen:</td>
						<td>
							<xsl:apply-templates select="../DI"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Approximate Value:</td>
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
						<td class="lable">Vehicle Make:</td>
						<td width="150">
							<xsl:value-of select="OtherVehicleMake"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Vehicle Model:</td>
						<td>
							<xsl:value-of select="OtherVehicleModel"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Colour:</td>
						<td>
							<xsl:value-of select="OtherVehicleColor"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Registration Plate:</td>
						<td>
							<xsl:value-of select="OtherVehiclePlateNo"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Insurer Name:</td>
						<td>
							<xsl:value-of select="InsuranceCompany"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Insurer Policy No:</td>
						<td>
							<xsl:value-of select="InsurancePolicyNo"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Insurer Claim Num:</td>
						<td>
							<xsl:value-of select="InsuranceClaimNum"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Insurer Tel No:</td>
						<td>
							<xsl:value-of select="InsurancePhoneWork"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Primary Damage:</td>
						<td>
							<xsl:value-of select="OtherVehicleImpactArea"/>
							<xsl:text> </xsl:text>
						</td>
					</tr>
					<tr>
						<td class="lable">Additional Damage:</td>
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
						<td class="lable">Driver Name:</td>
						<td width="150">
							<xsl:value-of select="DriverFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="DriverLastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Driver Address:</td>
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
							<xsl:if test="string-length(DriverCity)!=0">
								<xsl:value-of select="DriverCity"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(DriverStateProvince)!=0">
								<xsl:value-of select="DriverStateProvince"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(DriverZipPostalCode)!=0">
								<xsl:value-of select="DriverZipPostalCode"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(DriverCountry)!=0">
								<xsl:if test="DriverCountry!=''">
									<xsl:value-of select="DriverCountry"/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Driver Telephone No:</td>
						<td>
							<xsl:if test="DriverPhoneWork">
								<xsl:if test="DriverPhoneWork!=''">
                Phone Work:<xsl:text> </xsl:text>
									<xsl:value-of select="DriverPhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="DriverPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverCellPhoneWork">
								<xsl:if test="DriverCellPhoneWork!=''">
                Mobile Work:<xsl:text> </xsl:text>
									<xsl:value-of select="DriverCellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverPhoneHome">
								<xsl:if test="DriverPhoneHome!=''">
                Phone Home:<xsl:text> </xsl:text>
									<xsl:value-of select="DriverPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverCellPhoneHome">
								<xsl:if test="DriverCellPhoneHome!=''">
                Mobile Home:<xsl:text> </xsl:text>
									<xsl:value-of select="DriverCellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverFaxWork">
								<xsl:if test="DriverFaxWork!=''">
                Fax Work:<xsl:text> </xsl:text>
									<xsl:value-of select="DriverFaxWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverFaxHome">
								<xsl:if test="DriverFaxHome!=''">
                Fax Home:<xsl:text> </xsl:text>
									<xsl:value-of select="DriverFaxHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Owner Name:</td>
						<td>
							<xsl:value-of select="OwnerFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="OwnerLastName"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Owner Address:</td>
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
							<xsl:if test="string-length(OwnerCity)!=0">
								<xsl:value-of select="OwnerCity"/>
								<br/>
							</xsl:if>
							<xsl:if test="OwnerStateProvince">
								<xsl:value-of select="OwnerStateProvince"/>
								<br/>
							</xsl:if>
							<xsl:if test="OwnerZipPostalCode">
								<xsl:value-of select="OwnerZipPostalCode"/>
								<br/>
							</xsl:if>
							<xsl:if test="OwnerCountry">
								<xsl:if test="OwnerCountry!=''">
									<xsl:value-of select="OwnerCountry"/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Owner Telephone No:</td>
						<td>
							<xsl:if test="OwnerPhoneWork">
								<xsl:if test="OwnerPhoneWork!=''">
                Phone Work:<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerPhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerCellPhoneWork">
								<xsl:if test="OwnerCellPhoneWork!=''">
                Mobile Work:<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerCellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerPhoneHome">
								<xsl:if test="OwnerPhoneHome!=''">
                Phone Home:<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerCellPhoneHome">
								<xsl:if test="OwnerCellPhoneHome!=''">
                Mobile Home:<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerCellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerFaxWork">
								<xsl:if test="OwnerFaxWork!=''">
                Fax Work:<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerFaxWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerFaxHome">
								<xsl:if test="OwnerFaxHome!=''">
                Fax Home:<xsl:text> </xsl:text>
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
						<td class="lable">Incident Code:</td>
						<td width="150">
							<xsl:value-of select="AccidentCode"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Incident Type:</td>
						<td width="150">
							<xsl:value-of select="AccidentType"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Weather:</td>
						<td>
							<xsl:value-of select="Weather"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Road Conditions:</td>
						<td>
							<xsl:value-of select="RoadCondition"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Traffic Controls:</td>
						<td>
							<xsl:value-of select="TrafficControl"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Road/Street:</td>
						<td>
							<xsl:value-of select="StreetHighway"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Town/City:</td>
						<td>
							<xsl:value-of select="City"/>
						</td>
					</tr>
					<tr>
						<td class="lable">County:</td>
						<td>
							<xsl:value-of select="StateProvince"/>
						</td>
					</tr>
				</table>
			</td>
			<td colspan="2" class="innerright">
				<table width="300" cellpadding="1" cellspacing="1">
					<tr>
						<td class="lable">Speed Limit:</td>
						<td width="150">
							<xsl:value-of select="SpeedLimit"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Speed Client Vehicle:</td>
						<td>
							<xsl:value-of select="TravelingSpeed"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Police Attended:</td>
						<td>
							<xsl:value-of select="PolicePresent"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Police Station:</td>
						<td>
							<xsl:value-of select="../C/PoliceDept"/>
						</td>
					</tr>
					<tr>
						<td class="lable">PC's Name/No:</td>
						<td>
							<xsl:value-of select="../C/BadgeNo"/>
						</td>
					</tr>
					<tr>
						<td class="lable">Crime/Ref No:</td>
						<td>
							<xsl:value-of select="PoliceReportNo"/>
						</td>
					</tr>
					<xsl:if test="count(../PR[ClaimVehicleID])>0">
						<tr>
							<td class="lable">Endorsements Issued (Our Vehicle):</td>
							<td valign="top">
								<xsl:apply-templates select="../PR[ClaimVehicleID]"/>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="count(../PR[OtherVehID])>0">
						<tr>
							<td class="lable">Endorsements Issued (Other Vehicle):</td>
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
						<td class="lable">Full Description of Incident:</td>
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
						<td class="lable">Telephone No:</td>
						<td>
							<xsl:if test="PhoneWork">
								<xsl:if test="PhoneWork!=''">
                Phone Work:<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneWork">
								<xsl:if test="CellPhoneWork!=''">
                Mobile Work:<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PhoneHome">
								<xsl:if test="PhoneHome!=''">
                Phone Home:<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneHome">
								<xsl:if test="CellPhoneHome!=''">
                Mobile Home:<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Age:</td>
						<td>
							<xsl:value-of select="Age"/>
						</td>
					</tr>
					<tr>
						<td class="lable">In Vehicle:</td>
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
						<td class="lable">Address:</td>
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
							<xsl:if test="string-length(City)!=0">
								<xsl:value-of select="City"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(StateProvince)!=0">
								<xsl:value-of select="StateProvince"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(ZipPostalCode)!=0">
								<xsl:value-of select="ZipPostalCode"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(Country)!=0">
								<xsl:if test="Country!=''">
									<xsl:value-of select="Country"/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">Extent of Injury:</td>
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
						<td class="lable">Telephone No:</td>
						<td>
							<xsl:if test="PhoneWork">
								<xsl:if test="PhoneWork!=''">
                Phone Work:<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneWork">
								<xsl:if test="CellPhoneWork!=''">
                Mobile Work:<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PhoneHome">
								<xsl:if test="PhoneHome!=''">
                Phone Home:<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneHome">
								<xsl:if test="CellPhoneHome!=''">
                Mobile Home:<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td class="lable">In Vehicle:</td>
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
						<td class="lable">Address:</td>
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
							<xsl:if test="string-length(City)!=0">
								<xsl:value-of select="City"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(StateProvince)!=0">
								<xsl:value-of select="StateProvince"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(ZipPostalCode)!=0">
								<xsl:value-of select="ZipPostalCode"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(Country)!=0">
								<xsl:if test="Country!=''">
									<xsl:value-of select="Country"/>
								</xsl:if>
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
						<td class="lable">Telephone No:</td>
						<td>
							<xsl:if test="PhoneWork">
								<xsl:if test="PhoneWork!=''">
                Phone Work:<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWork"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneWork">
								<xsl:if test="CellPhoneWork!=''">
                Mobile Work:<xsl:text> </xsl:text>
									<xsl:value-of select="CellPhoneWork"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="PhoneHome">
								<xsl:if test="PhoneHome!=''">
                Phone Home:<xsl:text> </xsl:text>
									<xsl:value-of select="PhoneHome"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="CellPhoneHome">
								<xsl:if test="CellPhoneHome!=''">
                Mobile Home:<xsl:text> </xsl:text>
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
						<td class="lable">Address:</td>
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
							<xsl:if test="string-length(City)!=0">
								<xsl:value-of select="City"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(StateProvince)!=0">
								<xsl:value-of select="StateProvince"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(ZipPostalCode)!=0">
								<xsl:value-of select="ZipPostalCode"/>
								<br/>
							</xsl:if>
							<xsl:if test="string-length(Country)!=0">
								<xsl:if test="Country!=''">
									<xsl:value-of select="Country"/>
								</xsl:if>
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
