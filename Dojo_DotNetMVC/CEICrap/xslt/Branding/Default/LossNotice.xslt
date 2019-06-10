<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxml="urn:schemas-microsoft-com:xslt" xmlns:cei="urn:schemas-ceinetwork-com">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<HTML>
			<HEAD>
				<title>Loss Notice Report</title>
				<style type="text/css">						
				
          TD, TR
          {            
            color: Black;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 10pt;
            padding-left: 5px; 
          }
          
          TFOOT, THEAD, TH
          {
            font-size: 12pt;
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
                                     
          TABLE TR TD.label
          {
            vertical-align:text-top;
            font-weight: bold;            
          }
          
          TABLE TR TD.nodata
          {
            font-weight: bold;
            border-bottom: #000000 1px solid; 
          }
          
          TABLE TR TD.noborder
          {                       
            border-left: none;
            border-right: none;
            border-top: none; 
            border-bottom: none; 
          }
          
          TABLE TR TD.borderleftbottom
          {           
            border-bottom: #000000 1px solid; 
            border-left: #000000 1px solid; 
          }
          
          TR TD.borderleftrightbottom
          {           
            border-left: #000000 1px solid; 
            border-right: #000000 1px solid; 
            border-bottom: #000000 1px solid; 
          }
          
          TABLE TR TD.borderleftrighttopbottom
          {           
            border-left: #000000 1px solid; 
            border-right: #000000 1px solid; 
            border-bottom: #000000 1px solid;
            border-top: #000000 1px solid;
          }
          
          TABLE TR TD.borderrightbottom
          {           
            border-bottom: #000000 1px solid; 
            border-right: #000000 1px solid; 
          }
          
          TABLE TR TD.borderbottom
          {           
            border-bottom: #000000 1px solid; 
          }
          
          TABLE TR TD.borderleft
          {           
            border-left: #000000 1px solid; 
          }
          
          TABLE TR TD.borderright
          {           
            border-right: #000000 1px solid; 
          }
          
          TABLE TR TD.borderleftright
          {           
            border-left: #000000 1px solid; 
            border-right: #000000 1px solid; 
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
          {
			//alert(document.body.getElementsByTagName("TH")[p].offsetTop + ' ' + ((collP[p].offsetTop / (pgCnt * pgHeight))) + ' ' + ((collP[p+1].offsetTop / (pgCnt * pgHeight))));
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
			<body style="margin-left:40px;margin-right:40px">				
				<xsl:apply-templates select="NewDataSet"/>
			</body>
		</HTML>
	</xsl:template>
	<xsl:template match="NewDataSet">
		<table cellpadding="0" cellspacing="0" width="100%" border="0" bordercolor="orange">
     			<tr>
			        <td colspan="4"><img src="spacer.gif" height="1px" width="800px" /></td>
     			</tr>	
			<tr>
				<td width="25%"><br/></td>
				<td width="25%"></td>
				<td width="25%"></td>
				<td width="25%"></td>
			</tr>
			<tr>
				<td colspan="4">
					<table id="tblAutomobileLossNotice" border="0" bordercolor="darkred" width="100%" cellpadding="0" cellspacing="0">
						<xsl:apply-templates select="C"/>									
					</table>
				</td>			
			</tr>			
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>
						
			<tr>
				<td colspan="4">
					<table id="tblLossNotice" border="0" bordercolor="blue" width="100%" cellpadding="0" cellspacing="0">						
						<xsl:apply-templates select="AD"/>						
					</table>
				</td>
			</tr>									
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>
												
			<tr>
				<td colspan="4">
					<table id="tblClaimVehicle" border="0" bordercolor="blue" width="100%" cellpadding="0" cellspacing="0">						
						<xsl:apply-templates select="CV"/>						
					</table>
				</td>							
			</tr>			
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>
						
			<tr>
				<td colspan="4">
					<table id="tblDamagedItems" border="0" bordercolor="blue" width="100%" cellpadding="0" cellspacing="0">
						<tr>							
							<th colspan="4" align="center">OTHER ITEMS DAMAGED OR STOLEN</th>							
						</tr>
						<tr>
							<td class="borderleft"><b><u>Damaged Item(s)</u></b></td>
							<td colspan="3" class="borderright"><b><u>Damaged Amount(s)</u></b></td>			
						</tr>
						
						<xsl:choose>
							<xsl:when test="count(DI)=0">
								<tr>
									<td colspan="4" class="borderleftright">NONE</td>
								</tr>
							</xsl:when>	
							<xsl:otherwise><xsl:apply-templates select="DI"/></xsl:otherwise>
						</xsl:choose>
						<tr>
							<td width="25%" class="borderleftbottom"><br/></td>
							<td width="25%" class="borderbottom"><br/></td>
							<td width="25%" class="borderbottom"><br/></td>
							<td width="25%" class="borderrightbottom"><br/></td>
						</tr>
					</table>
				</td>														
			</tr>																		
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>
																		
			<tr>
				<td colspan="4">
					<table id="tblOtherVehicles" border="0" bordercolor="blue" width="100%" cellpadding="0" cellspacing="0">
						<tr>					
							<th colspan="4" align="center">PROPERTY DAMAGED/OTHER VEHICLES</th>								
						</tr>
						<xsl:choose>
							<xsl:when test="count(TP)=0">
								<tr>
									<td colspan="4" class="borderleftright">NONE</td>
								</tr>
								<tr>
									<td width="25%" class="borderleftbottom"><br/></td>
									<td width="25%" class="borderbottom"><br/></td>
									<td width="25%" class="borderbottom"><br/></td>
									<td width="25%" class="borderrightbottom"><br/></td>
								</tr>		
							</xsl:when>	
							<xsl:otherwise><xsl:apply-templates select="TP"/></xsl:otherwise>
						</xsl:choose>						
					</table>
				</td>								
			</tr>
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>
			
			<tr>
				<td colspan="4">					
					<table id="tblThirdPartyProp" border="0" bordercolor="blue" width="100%" cellpadding="0" cellspacing="0">
						<tr>						
							<th colspan="4" align="center">THIRD PARTY PROPERTY</th>
						</tr>						
						<tr>
							<td colspan="4" class="borderleftrightbottom">
								<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="orange">
									<tr>
										<td valign="bottom" width="20%"><b><u>NAME &amp; ADDRESS</u></b></td>
										<td valign="bottom" width="20%"><b><u>PHONE</u></b></td>
										<td valign="bottom" width="25%"><b><u>OWNER ORGANIZATION</u></b></td>
										<td valign="bottom" width="35%"><b><u>DESCRIPTION</u></b></td>
									</tr>
									<xsl:choose>
                    <xsl:when test="count(TPP)=0">
											<tr>
												<td colspan="7">NONE</td>
											</tr>
										</xsl:when>	
										<xsl:otherwise>													
                      <xsl:apply-templates select="TPP"/> 
										</xsl:otherwise>
									</xsl:choose>																									
								</table>								
							</td>
						</tr>						
					</table>					
				</td>										
			</tr>						
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>
			<tr>
				<td colspan="4">					
					<table id="tblInjuries" border="0" bordercolor="blue" width="100%" cellpadding="0" cellspacing="0">
						<tr>						
							<th colspan="4" align="center">INJURIES</th>
						</tr>						
						<tr>
							<td colspan="4" class="borderleftrightbottom">
								<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="orange">
									<tr>							
										<td valign="bottom" width="23%"><b><u>NAME &amp; ADDRESS</u></b></td>
										<td valign="bottom" width="18%"><b><u>PHONE</u></b></td>
										<td valign="bottom" width="10%"><b><u>PED/VEH</u></b></td>
										<td valign="bottom" width="10%"><b><u>VEHICLE OWNER</u></b></td>
										<td valign="bottom" width="6%"><b><u>AGE</u></b></td>
										<td valign="bottom" width="10%"><b><u>INJURY</u></b></td>
										<td valign="bottom" width="10%"><b><u>AMBULANCE</u></b></td>
										<td valign="bottom" width="23%"><b><u>EXTENT OF INJURY</u></b></td>
									</tr>
									<xsl:choose>
										<xsl:when test="count(I)=0">
											<tr>
												<td colspan="7">NONE</td>
											</tr>
										</xsl:when>	
										<xsl:otherwise>													
											<xsl:apply-templates select="I"/>	
										</xsl:otherwise>
									</xsl:choose>																									
								</table>								
							</td>
						</tr>						
					</table>					
				</td>										
			</tr>						
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>
				
			<tr>
				<td colspan="4">
					<table id="tblWitnesses" border="0" bordercolor="blue" width="100%" cellpadding="0" cellspacing="0">
						<tr>							
							<th colspan="4" align="center">WITNESSES</th>							
						</tr>
						<tr>
							<td colspan="4" class="borderleftrightbottom">
								<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="orange">
									<tr>
										<td width="50%"><b><u>NAME &amp; ADDRESS</u></b></td>
										<td width="*"><b><u>PHONE</u></b></td>	
									</tr>
									<xsl:choose>
										<xsl:when test="count(W)=0">
											<tr>
												<td colspan="2">NONE</td>
											</tr>
										</xsl:when>	
										<xsl:otherwise>													
											<xsl:apply-templates select="W"/>	
										</xsl:otherwise>
									</xsl:choose>												
								</table>
							</td>							
						</tr>												
					</table>
				</td>
			</tr>
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>
																		
			<tr>
				<td colspan="4">
					<table id="tblPassengers" border="0" bordercolor="blue" width="100%" cellpadding="0" cellspacing="0">
						<tr>							
							<th colspan="4" align="center">PASSENGERS</th>							
						</tr>
						<tr>
							<td colspan="4" class="borderleftrightbottom">
								<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="orange">
									<tr>						
										<td class="label"><u>NAME &amp; ADDRESS</u></td>
										<td class="label"><u>PHONE</u></td>
										<td class="label"><u>INS VEH/OTHER VEH</u></td>
										<td class="label"><u>VEHICLE OWNER</u></td>
									</tr>
									<xsl:choose>
										<xsl:when test="count(P)=0">
											<tr>
												<td colspan="4">NONE</td>
											</tr>
										</xsl:when>	
										<xsl:otherwise>													
											<xsl:apply-templates select="P"/>	
										</xsl:otherwise>
									</xsl:choose>																					
								</table>
							</td>
						</tr>
					</table>			
				</td>
			</tr>									
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>																	
			
			<tr>
				<td colspan="4">
					<table id="tblSupplementalInfo" border="0" bordercolor="blue" width="100%" cellpadding="0" cellspacing="0">
						<tr>							
							<th colspan="4" align="center">SUPPLEMENTAL INFORMATION</th>							
						</tr>
						<tr>
							<td colspan="4" class="borderleftrightbottom">
								<table width="100%" cellpadding="0" cellspacing="0" border="0" bordercolor="orange">
									<xsl:choose>
										<xsl:when test="count(CD)=0">
											<tr>
												<td>NONE</td>
											</tr>
										</xsl:when>	
										<xsl:otherwise>
											<tr>
												<td>
													<table width="100%" border="0" bordercolor="red" cellpadding="1" cellspacing="1">
														<tr>
															<td width="2%"></td>			
															<td width="53%" class="label"><u>Client Requested Data</u></td>
															<td width="2%"></td>
															<td width="43%" class="label"><u>Driver Response</u></td>
														</tr>	
														<xsl:apply-templates select="CD"/>			
													</table>
												</td>											
											</tr>																																													
										</xsl:otherwise>
									</xsl:choose>
								</table>
							</td>
						</tr>
					</table>
				</td>				
			</tr>			
			<tr><td colspan="4"><br/></td></tr>
			<tr><td colspan="4"><br/></td></tr>
			
			<tr>
				<td colspan="4" align="left">
					<i>
						This is the extent of the information available at this time. For further information,
						please contact the driver/custodian of the insured vehicle.
					</i>
				</td>
			</tr>				
		</table>				
	</xsl:template>						
	
	<!-- Automobile Loss Notice -->
	<xsl:template match="C">
		<tr>			
			<th colspan="4" align="center">AUTOMOBILE LOSS NOTICE</th>			
		</tr>
		<tr>
			<td colspan="4" class="borderleftrightbottom">
				<Table width="100%" border="0" bordercolor="red" cellpadding="0" cellspacing="0">					
					<tr>
						<td width="15%" rowspan="4" valign="top"><b>PRODUCER:</b></td>
						<Td width="35%">The CEI Group</Td>
						<td width="20%" class="borderleftbottom"><b>REPORT DATE:</b></td>
						<td width="30%" class="borderbottom">
							<xsl:value-of select="ReportDate"/>
						</td>
					</tr>					
					<tr>
						<td>Bucks County Technology Park</td>
						<td class="borderleftbottom"><b>DATE/TIME OF LOSS:</b></td>
						<td class="borderbottom">
							<xsl:value-of select="DateOfLoss"/>
						</td>
					</tr>
					<tr>
						<Td>4850 Street Road Tower 1 Building</Td>
						<td class="borderleftbottom"><b>WEEKDAY OF LOSS:</b></td>
						<td class="borderbottom"><xsl:value-of select="WeekDayOfLoss"/></td>
					</tr>
					<tr>			
						<td>Trevose, Pa 19053</td>
            <td class="borderleftbottom"><b>EMPLOYEE:</b></td>
						<td class="borderbottom">
							<xsl:value-of select="../EDC/EFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/ELastName"/>							
						</td>
					</tr>
					<tr>
						<td class="borderbottom"><br/></td>		
						<td class="borderbottom">USA</td>
						<td class="borderleftbottom"><b>DRIVER:</b></td>
						<td class="borderbottom">
							<xsl:choose>
								<xsl:when test="../EDC/DClaimVehicleId=0">							
									<i><xsl:text>Driver was not in the vehicle.</xsl:text></i>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="../EDC/DFirstName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="../EDC/DLastName"/>																		
									<xsl:text> (</xsl:text>
									<xsl:value-of select="../EDC/DRelationship"/>
									<xsl:text>)</xsl:text>
								</xsl:otherwise>
							</xsl:choose>																												
						</td>
					</tr>
					<tr><td colspan="4"><br/></td></tr>
					<tr>
						<td class="label" rowspan="3">CLIENT:</td>
						<Td><xsl:value-of select="ClientOrgName"/></Td>
						<td class="label">CLAIM CONTACT:</td>
						<td>
							<xsl:choose>
								<xsl:when test="../EDC/ClaimContactId=0">
									<xsl:value-of select="../EDC/EFirstName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="../EDC/ELastName"/>
									<xsl:text> (Employee)</xsl:text>									
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="../EDC/CFirstName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="../EDC/CLastName"/>
									<xsl:text> (</xsl:text>
									<xsl:value-of select="../EDC/CRelationship"/>
									<xsl:text>)</xsl:text>
								</xsl:otherwise>
							</xsl:choose>																				
						</td>
					</tr>
					<tr>
						<td>
							<xsl:if test="string-length(OrgAddress1)!=0">
								<xsl:if test="OrgAddress1!=''">
									<xsl:value-of select="OrgAddress1"/>						
								</xsl:if>
							</xsl:if>
						</td>
						<td class="label" valign="top">PHONE:</td>
						<td>
              <xsl:value-of select="cei:formatphonenumber(../EDC/CPhoneWork)"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/CPhoneWorkExt"/>
						</td>
					</tr>
					<Tr>
						<td>
							<xsl:value-of select="OrgCity"/>
							<xsl:if test="string-length(OrgStateProvince)!=0">
								<xsl:if test="OrgStateProvince!=''">
									<xsl:text>, </xsl:text>
									<xsl:value-of select="OrgStateProvince"/>	
								</xsl:if>
							</xsl:if>																					
							<xsl:text> </xsl:text>
							<xsl:value-of select="OrgZipPostalCode"/>
						</td>
						<td class="label">CLIENT CLAIM #:</td>
						<td>
							<xsl:value-of select="ClientClaimNum"/>
						</td>
					</Tr>
					<tr>
						<td colspan="2"><br/></td>
						<td class="label">COST CENTER:</td>
						<td>
							<xsl:value-of select="CostCenter"/>
						</td>
					</tr>										
					<tr>			
						<td class="label">Branch:</td>
						<td><xsl:value-of select="Division"/></td>
						<td></td>
						<td></td>
					</tr>
					<tr><td colspan="4"><br/></td></tr>			
					<xsl:if test="(../CV/VehicleDetail1!='') or (../CV/VehicleDetail4!='')">
						<tr>			
							<td class="label">LEVEL 1:</td>
							<td><xsl:value-of select="../CV/VehicleDetail1"/></td>
							<td class="label">LEVEL 4:</td>
							<td><xsl:value-of select="../CV/VehicleDetail4"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="(../CV/VehicleDetail2!='') or (../CV/VehicleDetail5!='')">
						<tr>			
							<td class="label">LEVEL 2:</td>
							<td><xsl:value-of select="../CV/VehicleDetail2"/></td>
							<td class="label">LEVEL 5:</td>
							<td><xsl:value-of select="../CV/VehicleDetail5"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="(../CV/VehicleDetail3!='') or (../CV/VehicleDetail6!='')">
						<tr>			
							<td class="label">LEVEL 3:</td>
							<td><xsl:value-of select="../CV/VehicleDetail3"/></td>
							<td class="label">LEVEL 6:</td>
							<td><xsl:value-of select="../CV/VehicleDetail6"/></td>
						</tr>
					</xsl:if>									
					<xsl:apply-templates select="../OI"/>			
				</Table>
			</td>		
		</tr>		
	</xsl:template>
															
	<!-- ORGINSURANCE -->
	<xsl:template match="OI">
		<tr><td colspan="4"><br/></td></tr>
		<tr><td colspan="4"><br/></td></tr>
		<tr>
			<td colspan="4">
				<table cellpadding="1" cellspacing="0" width="100%" border="0" bordercolor="blue">
					<tr>
						<td class="label" width="70%"><u>CLIENT'S INSURANCE</u></td>
						<td class="label" width="30%"><u>CLIENT'S BROKER</u></td>
					</tr>
					<tr>
						<td valign="top">
							<table cellpadding="1" cellspacing="0" width="100%">
								<tr>
									<td colspan="3"><xsl:value-of select="CarrierName"/></td>
								</tr>	
								<tr>
									<td width="16%">
										<xsl:if test="CarrierName!=''">
											Policy #'s:	
										</xsl:if>
									</td>
									<td width="42%"><xsl:value-of select="PolicyA"/></td>
									<td width="42%"><xsl:value-of select="PolicyB"/></td>
								</tr>
								<tr>
									<td></td>
									<td><xsl:value-of select="PolicyC"/></td>
									<td><xsl:value-of select="PolicyD"/></td>
								</tr>
								<tr>
									<td></td>
									<td><xsl:value-of select="PolicyE"/></td>
									<td><xsl:value-of select="PolicyF"/></td>
								</tr>
								<tr>
									<td></td>
									<td><xsl:value-of select="PolicyG"/></td>
									<td><xsl:value-of select="PolicyH"/></td>
								</tr>
								<tr>
									<td></td>
									<td><xsl:value-of select="PolicyI"/></td>
									<td><xsl:value-of select="PolicyJ"/></td>
								</tr>
							</table>
						</td>	
						<td valign="top">
							<xsl:value-of select="BrokerFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="BrokerLastName"/>
							<br/>
							<xsl:if test="string-length(BrokerAddress1)!=0">
								<xsl:if test="BrokerAddress1!=''">
									<xsl:value-of select="BrokerAddress1"/>
									<br/>
								</xsl:if>
							</xsl:if>							
							<xsl:if test="string-length(BrokerCity)!=0">
								<xsl:if test="BrokerCity!=''">
									<xsl:value-of select="BrokerCity"/>									
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(BrokerState)!=0">
								<xsl:if test="BrokerState!=''">
									<xsl:text>, </xsl:text>
									<xsl:value-of select="BrokerState"/>									
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(BrokerZip)!=0">
								<xsl:if test="BrokerZip!=''">
									<xsl:text> </xsl:text>
									<xsl:value-of select="BrokerZip"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<br/>
							<xsl:value-of select="BrokerPhone"/>
						</td>				
					</tr>
				</table>
			</td>
		</tr>			
	</xsl:template>	
	
	<!-- ACCIDENT DESCRIPTION -->
	<xsl:template match="AD">
		<tr>			
			<th colspan="4" align="center">LOSS NOTICE INFORMATION</th>			
		</tr>
		<tr valign="top">
			<td colspan="2" class="borderleftbottom">
				<table width="100%" border="0" bordercolor="red" cellpadding="1" cellspacing="0">					
					<tr>
						<td colspan="2"><b><u>LOCATION OF ACCIDENT</u></b></td>						
					</tr>
					<tr>
						<td class="label">STREET:</td>
						<td><xsl:value-of select="StreetHighway"/></td>
					</tr>
					<tr>
						<td class="label">INTERSECTION:</td>
						<td><xsl:value-of select="MajorIntersection"/></td>
					</tr>
					<tr>
						<td class="label">CITY, STATE/PROVINCE:</td>
						<td>
							<xsl:value-of select="City"/>
							<xsl:if test="string-length(City)!=0">
								<xsl:if test="City!=''">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:if>
							<xsl:value-of select="StateProvince"/>
							<xsl:value-of select="ZipPostalCode"/>
						</td>
					</tr>
					<tr>
						<td class="label">COUNTY:</td>
						<td><xsl:value-of select="County"/></td>								
					</tr>					
				</table>
			</td>
			<td colspan="2" class="borderleftrightbottom">
				<table width="100%" cellpadding="1" cellspacing="0" border="0" bordercolor="green">
					<tr>
						<td width="50%" valign="top"><b>AUTH. CONTACTED:</b></td>
						<td width="*"><xsl:value-of select="../C/PoliceDept"/></td>
					</tr>
					<tr>
						<td><b>POLICE PHONE #:</b></td>
            <td><xsl:value-of select="cei:formatphonenumber(../C/Phone)"/></td>
					</tr>
					<tr>
						<td><b>REPORT #:</b></td>
						<td><xsl:value-of select="../C/PoliceReportNo"/></td>
					</tr>
					<tr>
						<td><b>OFFICER'S NAME:</b></td>
						<td>
							
							<xsl:value-of select="../C/OfficerFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../C/OfficerLastName"/>
						</td>
					</tr>					
				</table>
			</td>
		</tr>		
		<tr>
			<td width="25%" class="borderleft"><br/></td>
			<td width="25%"></td>
			<td width="25%"></td>
			<td width="25%" class="borderright"><br/></td>
		</tr>		
		<tr>
			<td colspan="4" class="borderleftrightbottom">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td class="label" align="center"><u>WEATHER</u></td>
						<td class="label" align="center"><u>ROAD CONDITIONS</u></td>
						<td class="label" align="center"><u>TRAFFIC CONTROLS</u></td>
						<td class="label" align="center"><u>SPEED LIMIT</u></td>
						<td class="label" align="center"><u>TRAVELING SPEED</u></td>
						<td class="label" align="center"><u>DIRECTION OF TRAVEL</u></td>
					</tr>
					<tr>
						<td align="center"><xsl:value-of select="Weather"/></td>
						<td align="center"><xsl:value-of select="RoadCondition"/></td>
						<td align="center"><xsl:value-of select="TrafficControl"/></td>
						<td align="center"><xsl:value-of select="SpeedLimit"/></td>
						<td align="center"><xsl:value-of select="TravelingSpeed"/></td>
						<td align="center"><xsl:value-of select="PrimaryVehicleDir"/></td>
					</tr>
					<tr><td colspan="6"><br/></td></tr>					
				</table>
			</td>
		</tr>		
		<tr>		
			<td colspan="4" class="borderleftright"><br/></td>			
		</tr>		
		<tr>
			<td colspan="4" class="borderleftright"><b><u>DESCRIPTION OF ACCIDENT</u></b></td>										
		</tr>		
		<tr>
			<td colspan="4" class="borderleftright"><xsl:value-of select="AccidentDesc"/></td>							
		</tr>		
		<tr>		
			<td colspan="4" class="borderleftrightbottom"><br/></td>			
		</tr>
		<tr>		
			<td colspan="4" class="borderleftright"><br/></td>			
		</tr>		
		<tr>
			<td colspan="4" class="borderleftrightbottom">    
				<table width="100%" cellspacing="0" cellpadding="0" style="padding-bottom:22px;">
					<Tr>
						<td width="40%">
              <b><u>VIOLATIONS/CITATIONS ISSUED</u></b>
            </td>  
            <td width="20%"><b><u>DUI</u></b></td>      
						<td width="25%"><b><u>INS VEH/OTHER VEH</u></b></td>
						<td width="*"><b><u>VEHICLE DRIVER</u></b></td>
					</Tr>
					<xsl:apply-templates select="../PR"/>
				</table>			
			</td>					
		</tr>																		
		<tr>		
			<td colspan="4" class="borderleftright"><br/></td>			
		</tr>						
		<tr>
			<td colspan="2" class="borderleft"><b><u>ACCIDENT CODE</u></b></td>			
			<td colspan="2" class="borderright"><b><u>ACCIDENT TYPE</u></b></td>					
		</tr>
		<tr>			
			<td colspan="2" class="borderleft"><xsl:value-of select="AccidentCode"/></td>			
			<td colspan="2" class="borderright"><xsl:value-of select="AccidentType"/><br/></td>			
		</tr>		
		<tr>		
			<td colspan="4" class="borderleftrightbottom"><br/></td>			
		</tr>
	</xsl:template>	
	
	<!-- POLICE CITATIONS -->
	<xsl:template match="PR">
		<tr>
			<td><xsl:value-of select="CitationIssued"/></td>
      <td>
        <xsl:choose>
          <xsl:when test="../PR/PoliceReportID !='' and ../PR/DUI=1">Yes</xsl:when>
          <xsl:when test="../PR/PoliceReportID !='' and ../PR/DUI=0">No</xsl:when>
          <xsl:otherwise>
            &#160;      
          </xsl:otherwise>
        </xsl:choose>
      </td>
			<td>
				<xsl:if test="ClaimVehicleID !=''">
					Insured Vehicle									
				</xsl:if>
				<xsl:if test="OtherVehID !=''">
					Other Vehicle					
				</xsl:if>
			</td>
			<td>
				<xsl:if test="OtherVehID !=''">
					<xsl:value-of select="FirstName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="LastName"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	
	<!-- CLAIM VEHICLE -->
	<xsl:template match="CV">
		<tr>			
			<th colspan="4" align="center">INSURED VEHICLE</th>
		</tr>
		<tr valign="top">
			<td colspan="4" class="borderleftrightbottom">
				<table width="100%" style="BORDER-COLLAPSE: collapse" cellpadding="0" cellspacing="0" border="0" bordercolor="orange">
					<tr>														
						<td class="borderright" align="center"><b><u>VEH#</u></b></td>					
						<td class="borderright" align="center"><b><u>YEAR</u></b></td>
						<td class="borderbottom"><b>MAKE:</b></td>
						<td class="borderbottom"><xsl:value-of select="Make"/></td>
						<td class="borderleftbottom"><b>BODY TYPE:</b></td>
						<td class="borderrightbottom"><xsl:value-of select="VehicleStyle"/></td>
						<td class="borderbottom"><b>PLATE:</b></td>
						<td class="borderbottom"><xsl:value-of select="PlateNo"/></td>
					</tr>	
					<tr>
						<td rowspan="2" valign="top" align="center">1</td>
						<td rowspan="2" align="center" valign="top" class="borderright"><xsl:value-of select="VehYear"/></td>
						<td class="borderbottom"><b>MODEL:</b></td>
						<td class="borderbottom"><xsl:value-of select="Model"/></td>									
						<td class="borderleftbottom"><b>VIN:</b></td>
						<td class="borderrightbottom"><xsl:value-of select="VIN"/></td>
						<td class="borderbottom"><b>STATE/PROVINCE:</b></td>
						<td class="borderbottom"><xsl:value-of select="StateProvince"/></td>
					</tr>
					<tr>
						<td><b>COLOR:</b></td>
						<td><xsl:value-of select="Color"/></td>
						<td class="borderleft"><b>MILEAGE/KM:</b></td>
						<td class="borderright"><xsl:value-of select="format-number(Mileage,'#,##0')"/></td>						
						<td><b>UNIT #:</b></td>
						<td><xsl:value-of select="ClientVehNo"/></td>
					</tr>																							
				</table>
			</td>		
		</tr>
		<tr>
			<td width="25%" class="borderleft"><br/></td>
			<td width="25%"></td>
			<td width="25%"></td>
			<td width="25%" class="borderright"><br/></td>
		</tr>				
		<tr>
			<td colspan="4" class="borderleftrightbottom">
				<table width="100%" border="0" bordercolor="blue" cellpadding="0" cellspacing="0">
					<tr>
						<td width="25%"><b><u>EMPLOYEE</u></b></td>
						<td width="25%"><b><u>PHONE</u></b></td>						
						<td width="35%"><b>DRIVER'S LICENSE #:</b></td>
						<td width="15%">xxxxxxxx</td>
					</tr>
					<tr>
						<td rowspan="3" valign="top">
							<xsl:value-of select="../EDC/EFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/ELastName"/>
							<br/>
							<xsl:if test="string-length(../EDC/EAddress1)!=0">
								<xsl:if test="../EDC/EAddress1!=''">
									<xsl:value-of select="../EDC/EAddress1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(../EDC/EAddress2)!=0">
								<xsl:if test="../EDC/EAddress2!=''">
									<xsl:value-of select="../EDC/EAddress2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(../EDC/EAddress3)!=0">
								<xsl:if test="../EDC/EAddress3!=''">
									<xsl:value-of select="../EDC/EAddress3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(../EDC/ECity)!=0">
								<xsl:value-of select="../EDC/ECity"/>
								<xsl:text>, </xsl:text>							
							</xsl:if>
							<xsl:if test="string-length(../EDC/EStateProvince)!=0">
								<xsl:value-of select="../EDC/EStateProvince"/>								
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:if test="string-length(../EDC/EZipPostalCode)!=0">
								<xsl:value-of select="../EDC/EZipPostalCode"/>
								<br/>
							</xsl:if>				
						</td>				
						<td valign="top" rowspan="3">
							<xsl:if test="../EDC/EPhoneWork">
								<xsl:if test="../EDC/EPhoneWork!=''">
									(W):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(../EDC/EPhoneWork)"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="../EDC/EPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="../EDC/ECellPhoneWork">
								<xsl:if test="../EDC/ECellPhoneWork!=''">
									(W-Cell):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(../EDC/ECellPhoneWork)"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="../EDC/EPhoneHome">
								<xsl:if test="../EDC/EPhoneHome!=''">
									(H):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(../EDC/EPhoneHome)"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="../EDC/ECellPhoneHome">
								<xsl:if test="../EDC/ECellPhoneHome!=''">
									(H-Cell):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(../EDC/ECellPhoneHome)"/>
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
						<td valign="top"><b>DRIVER'S LICENSE STATE/PROVINCE:</b></td>
						<td valign="top">XX</td>
					</tr>
					<tr>
						<td valign="top"><b>DATE OF BIRTH:</b></td>
						<td valign="top">xx/xx/xxxx</td>
					</tr>
					<tr>
						<td valign="top"><b>HIRE DATE:</b></td>
						<td valign="top">xx/xx/xxxx</td>
					</tr>
				</table>
			</td>								
		</tr>
		<tr>
			<td class="borderleft"><br/></td>
			<td></td>
			<td></td>
			<td class="borderright"><br/></td>
		</tr>
		<tr>
			<td colspan="4" class="borderleftrightbottom">
				<table width="100%" border="0" bordercolor="orange" cellpadding="0" cellspacing="0">
					<tr>
						<td width="25%"><b><u>DRIVER</u></b></td>
						<td width="25%"><b><u>PHONE</u></b></td>
						<td width="35%"><b>RELATIONSHIP:</b></td>
						<Td width="15%"><xsl:value-of select="../EDC/DRelationship"/></Td>
					</tr>
					<tr>
						<td valign="top" rowspan="7">
							<xsl:value-of select="../EDC/DFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="../EDC/DLastName"/>
							<br/>
							<xsl:if test="string-length(../EDC/DAddress1)!=0">
								<xsl:if test="../EDC/DAddress1!=''">
									<xsl:value-of select="../EDC/DAddress1"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(../EDC/DAddress2)!=0">
								<xsl:if test="../EDC/DAddress2!=''">
									<xsl:value-of select="../EDC/DAddress2"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(../EDC/DAddress3)!=0">
								<xsl:if test="../EDC/DAddress3!=''">
									<xsl:value-of select="../EDC/DAddress3"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="string-length(../EDC/DCity)!=0">
								<xsl:value-of select="../EDC/DCity"/>								
							</xsl:if>
							<xsl:if test="string-length(../EDC/DStateProvince)!=0">
								<xsl:text>, </xsl:text>
								<xsl:value-of select="../EDC/DStateProvince"/>																
							</xsl:if>
							<xsl:if test="string-length(../EDC/DZipPostalCode)!=0">
								<xsl:text> </xsl:text>
								<xsl:value-of select="../EDC/DZipPostalCode"/>								
							</xsl:if>		
						</td>
						<td valign="top" rowspan="7">
							<xsl:if test="../EDC/DPhoneWork">
								<xsl:if test="../EDC/DPhoneWork!=''">
									(W):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(../EDC/DPhoneWork)"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="../EDC/DPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="../EDC/DCellPhoneWork">
								<xsl:if test="../EDC/DCellPhoneWork!=''">
									(W-Cell):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(../EDC/DCellPhoneWork)"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="../EDC/DPhoneHome">
								<xsl:if test="../EDC/DPhoneHome!=''">
									(H):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(../EDC/DPhoneHome)"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="../EDC/DCellPhoneHome">
								<xsl:if test="../EDC/DCellPhoneHome!=''">
									(H-Cell):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(../EDC/DCellPhoneHome)"/>
									<br/>
								</xsl:if>
							</xsl:if>		
						</td>						
					</tr>
					<tr>												
						<td><b>DRIVER'S LICENSE #:</b></td>
						<td>xxxxxxxx</td>
					</tr>
					<tr>												
						<td><b>DRIVER'S LICENSE STATE/PROVINCE:</b></td>
						<td>XX</td>
					</tr>
					<tr>												
						<td><b>WEARING SEATBELT?</b></td>
						<td><xsl:value-of select="../AD/WearingSeatbelt"/></td>
					</tr>
					<tr>												
						<td><b>USING CELL PHONE?</b></td>
						<td><xsl:value-of select="../AD/CellPhoneInUse"/></td>
					</tr>
					<tr>												
						<td><b>DID AIRBAG DEPLOY?</b></td>
						<td><xsl:value-of select="../AD/AirbagDeployed"/></td>
					</tr>
					<tr>												
						<td><b>PURPOSE OF USE:</b></td>
						<td>
							<xsl:if test="../AD/PersonalTime=0">
								Company
							</xsl:if>
							<xsl:if test="../AD/PersonalTime=1">
								Personal
							</xsl:if>
						</td>		
					</tr>
				</table>
			</td>
		</tr>				
		<tr>
			<Td class="borderleft"><b>PRIMARY IMPACT:</b></Td>
			<td><xsl:value-of select="../AD/PrimaryDamageArea"/></td>
			<Td><b>SUBROGATION:</b></Td>
			<td class="borderright"><xsl:value-of select="../AD/Subrogation"/></td>
		</tr>
		<tr>
			<Td class="borderleft"><b>ADDITIONAL DAMAGE:</b></Td>
			<td><xsl:value-of select="../AD/AdditionalDamageArea"/></td>			
			<td class="borderright" colspan="2"><br/></td>
		</tr>
		<Tr>
			<td colspan="4" class="borderleftrightbottom"><br/></td>
		</Tr>		
	</xsl:template>

	<!-- OTHER ITEMS DAMAGED OR STOLEN -->
	<xsl:template match="DI">						
		<tr>
			<td class="borderleft"><xsl:value-of select="ItemDamaged"/></td>
			<td colspan="3" class="borderright"><xsl:value-of select="format-number(DamagedAmt,'$#,##0.00')"/></td>
		</tr>						
	</xsl:template>
	
	<!-- THIRD PARTY VEHICLES -->
	<xsl:template match="TP">
		<xsl:variable name="vehCounter" select="position()+1"></xsl:variable>
		<tr valign="top">							
			<td colspan="4" class="borderleftrighttopbottom">
				<table width="100%" border="0" bordercolor="darkpink" cellpadding="0" cellspacing="0">
					<tr>
						<td width="15%" align="center"><b><u>OTHER VEH#:</u></b></td>
						<td width="10%" align="center" class="borderleft"><b><u>YEAR</u></b></td>
						<td width="10%" class="borderleftbottom"><b>MAKE:</b></td>
						<td width="*" class="borderbottom"><xsl:value-of select="OtherVehicleMake"/></td>
						
						<td width="25%" class="borderleft"><b>INSURED:</b></td>
						<td width="25%"><xsl:value-of select="OtherVehicleHasInsCo"/></td>
					</tr>
					
					<tr>
						<td rowspan="4" valign="top" align="center">
							<xsl:value-of select="$vehCounter"></xsl:value-of>
						</td>
						<td rowspan="4" valign="top" align="center" class="borderleft"><xsl:value-of select="OtherVehicleYear"/></td>
						<td class="borderleftbottom"><b>MODEL:</b></td>
						<td class="borderbottom"><xsl:value-of select="OtherVehicleModel"/></td>
						<td class="borderleft"><b>INSURANCE COMPANY:</b></td>
						<td><xsl:value-of select="InsuranceCompany"/></td>
					</tr>					
					<tr>						
						<td rowspan="3" valign="top" class="borderleft"><b>PLATE:</b></td>
						<td rowspan="3" valign="top"><xsl:value-of select="OtherVehiclePlateNo"/></td>
						<td class="borderleft"><b>INSURANCE AGENT:</b></td>
						<td>
							<xsl:value-of select="InsuranceContactFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="InsuranceContactLastName"/>
						</td>
					</tr>					
					<tr>
						<td class="borderleft"><b>INSURANCE PHONE:</b></td>
            <td><xsl:value-of select="cei:formatphonenumber(InsurancePhoneWork)"/></td>
					</tr>
					<tr>
						<td class="borderleft"><b>POLICY #:</b></td>
						<td><xsl:value-of select="InsurancePolicyNo"/></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="25%" class="borderleft"><br/></td>
			<td width="25%"></td>
			<td width="25%"></td>
			<td width="25%" class="borderright"><br/></td>
		</tr>
		<tr>
			<td colspan="4" class="borderleftrightbottom">
				<table width="100%" border="0" bordercolor="orange" cellpadding="0" cellspacing="0">
					<tr>
						<td width="25%"><b><u>OWNER</u></b></td>
						<td width="25%"><b><u>PHONE</u></b></td>
						<td width="25%"><b><u>OTHER DRIVER</u></b></td>
						<Td width="25%"><b><u>PHONE</u></b></Td>
					</tr>
					<tr>
						<td valign="top">
							<xsl:value-of select="OwnerFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="OwnerLastName"/>
							<br/>
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
							</xsl:if>
							<xsl:if test="OwnerStateProvince">
								<xsl:text>, </xsl:text>
								<xsl:value-of select="OwnerStateProvince"/>								
							</xsl:if>
							<xsl:if test="OwnerZipPostalCode">
								<xsl:text> </xsl:text>
								<xsl:value-of select="OwnerZipPostalCode"/>
								<br/>
							</xsl:if>
						</td>
						<td valign="top">
							<xsl:if test="OwnerPhoneWork">
								<xsl:if test="OwnerPhoneWork!=''">
									(W):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(OwnerPhoneWork)"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="OwnerPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerCellPhoneWork">
								<xsl:if test="OwnerCellPhoneWork!=''">
									(W-Cell):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(OwnerCellPhoneWork)"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerPhoneHome">
								<xsl:if test="OwnerPhoneHome!=''">
									(H):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(OwnerPhoneHome)"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="OwnerCellPhoneHome">
								<xsl:if test="OwnerCellPhoneHome!=''">
									(H-Cell):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(OwnerCellPhoneHome)"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
						<td valign="top">
							<xsl:value-of select="DriverFirstName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="DriverLastName"/>
							<br/>
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
							</xsl:if>
							<xsl:if test="string-length(DriverStateProvince)!=0">
								<xsl:text>, </xsl:text>
								<xsl:value-of select="DriverStateProvince"/>								
							</xsl:if>
							<xsl:if test="string-length(DriverZipPostalCode)!=0">
								<xsl:text> </xsl:text>
								<xsl:value-of select="DriverZipPostalCode"/>
								<br/>
							</xsl:if>	
						</td>
						<td valign="top">
							<xsl:if test="DriverPhoneWork">
								<xsl:if test="DriverPhoneWork!=''">
									(W):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(DriverPhoneWork)"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="DriverPhoneWorkExt"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverCellPhoneWork">
								<xsl:if test="DriverCellPhoneWork!=''">
									(W-Cell):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(DriverCellPhoneWork)"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverPhoneHome">
								<xsl:if test="DriverPhoneHome!=''">
									(H):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(DriverPhoneHome)"/>
									<br/>
								</xsl:if>
							</xsl:if>
							<xsl:if test="DriverCellPhoneHome">
								<xsl:if test="DriverCellPhoneHome!=''">
									(H-Cell):<xsl:text> </xsl:text>
									<xsl:value-of select="cei:formatphonenumber(DriverCellPhoneHome)"/>
									<br/>
								</xsl:if>
							</xsl:if>
						</td>
					</tr>
					<tr><td colspan="4"><br/></td></tr>
				</table>
			</td>
		</tr>		
		<tr>
			<td colspan="4" class="borderleftrightbottom">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td width="25%"><b>PRIMARY IMPACT:</b></td>
						<Td width="25%"><xsl:value-of select="OtherVehicleImpactArea"/></Td>
						<td width="25%"><b>DIRECTION OF TRAVEL:</b></td>
						<Td width="25%"><xsl:value-of select="OtherVehicleTravDir"/></Td>		
					</tr>
					<tr>
						<td><b>ADDITIONAL DAMAGE:</b></td>
						<Td colspan="3"><xsl:value-of select="OtherVehicleDamageArea"/></Td>			
					</tr>
				</table>
			</td>							
		</tr>
		<tr><td class="noborder" colspan="4"><br/></td></tr>	
	</xsl:template>		
	
	<!-- ThirdPartyProperty -->
  <xsl:template match="TPP">
		<tr>
			<td>
        <xsl:value-of select="TPPFirstName"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="TPPLastName"/>
				<br/>
				<xsl:if test="string-length(TPPAddress1)!=0">
					<xsl:if test="TPPAddress1!=''">
						<xsl:value-of select="TPPAddress1"/>
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length(TPPAddress2)!=0">
					<xsl:if test="TPPAddress2!=''">
						<xsl:value-of select="TPPAddress2"/>
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="string-length(TPPCity)!=0">
					<xsl:value-of select="TPPCity"/>
				</xsl:if>
				<xsl:if test="string-length(TPPStateProvince)!=0">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="TPPStateProvince"/>
				</xsl:if>
				<xsl:if test="string-length(TPPZipPostalCode)!=0">
					<xsl:text> </xsl:text>
					<xsl:value-of select="TPPZipPostalCode"/>
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="TPPPhoneWork">
					<xsl:if test="TPPPhoneWork!=''">
						(W):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(TPPPhoneWork)"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="TPPPhoneWorkExt"/>
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="TPPCellPhoneWork">
					<xsl:if test="TPPCellPhoneWork!=''">
						(W-Cell):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(TPPCellPhoneWork)"/>
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="TPPPhoneHome">
					<xsl:if test="TPPPhoneHome!=''">
						(H):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(TPPPhoneHome)"/>
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="TPPCellPnoneHome">
					<xsl:if test="TPPCellPnoneHome!=''">
						(H-Cell):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(TPPCellPnoneHome)"/>
						<br/>
					</xsl:if>
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="string-length(TPPPropertyOwnerOrganization)!=0">
						<xsl:value-of select="TPPPropertyOwnerOrganization"/>
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="string-length(TPPDescription)!=0">
						<xsl:value-of select="TPPDescription"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<hr/>
			</td>
		</tr>
	</xsl:template>
			
	<!-- INJURIES -->
	<xsl:template match="I">		
			<tr>	
				<td>
					<xsl:value-of select="FirstName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="LastName"/>
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
						<xsl:value-of select="City"/>						
					</xsl:if>
					<xsl:if test="string-length(StateProvince)!=0">
						<xsl:text>, </xsl:text>
						<xsl:value-of select="StateProvince"/>						
					</xsl:if>
					<xsl:if test="string-length(ZipPostalCode)!=0">
						<xsl:text> </xsl:text>
						<xsl:value-of select="ZipPostalCode"/>						
					</xsl:if>		
				</td>
				<td valign="top">
					<xsl:if test="PhoneWork">
						<xsl:if test="PhoneWork!=''">
							(W):<xsl:text> </xsl:text>
							<xsl:value-of select="cei:formatphonenumber(PhoneWork)"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="PhoneWorkExt"/>
							<br/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="CellPhoneWork">
						<xsl:if test="CellPhoneWork!=''">
							(W-Cell):<xsl:text> </xsl:text>
							<xsl:value-of select="cei:formatphonenumber(CellPhoneWork)"/>
							<br/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="PhoneHome">
						<xsl:if test="PhoneHome!=''">
							(H):<xsl:text> </xsl:text>
							<xsl:value-of select="cei:formatphonenumber(PhoneHome)"/>
							<br/>
						</xsl:if>
					</xsl:if>
					<xsl:if test="CellPhoneHome">
						<xsl:if test="CellPhoneHome!=''">
							(H-Cell):<xsl:text> </xsl:text>
							<xsl:value-of select="cei:formatphonenumber(CellPhoneHome)"/>
							<br/>
						</xsl:if>
					</xsl:if>
				</td>
				<td valign="top">
					<xsl:if test="PedestrianId!=0">
						Pedestrian			
					</xsl:if>
					<xsl:if test="ClaimVehicleId!=0">
						Insured Vehicle
					</xsl:if>
					<xsl:if test="OtherVehId!=0">
						Other Vehicle
					</xsl:if>
				</td>
				<td valign="top">					
					<xsl:value-of select="OVOLastName"/>
				</td>
				<td valign="top"><xsl:value-of select="Age"/></td>
				<td valign="top"><xsl:value-of select="InjuryArea"/></td>
				<td valign="top">
					<xsl:choose>
						<xsl:when test="Ambulance=0">No</xsl:when>
						<xsl:otherwise>Yes</xsl:otherwise>
					</xsl:choose>										
				</td>
				<td valign="top"><xsl:value-of select="InjuryDesc"/></td>
			</tr>
			<tr>				
				<td colspan="7"><hr/></td>				
			</tr>	
	</xsl:template>	
	
	<!-- WITNESSES -->
	<xsl:template match="W">
		<tr>
			<td valign="top">
				<xsl:value-of select="FirstName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="LastName"/>
				<br/>
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
				</xsl:if>
				<xsl:if test="string-length(StateProvince)!=0">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="StateProvince"/>					
				</xsl:if>
				<xsl:if test="string-length(ZipPostalCode)!=0">
					<xsl:text> </xsl:text>
					<xsl:value-of select="ZipPostalCode"/>					
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="PhoneWork">
					<xsl:if test="PhoneWork!=''">
						(W):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(PhoneWork)"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="PhoneWorkExt"/>
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="CellPhoneWork">
					<xsl:if test="CellPhoneWork!=''">
						(W-Cell):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(CellPhoneWork)"/>
						<br/>
					</xsl:if>
				</xsl:if>														
				<xsl:if test="PhoneHome">
					<xsl:if test="PhoneHome!=''">
						(H):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(PhoneHome)"/>
						<br/>
					</xsl:if>
				</xsl:if>														
				<xsl:if test="CellPhoneHome">
					<xsl:if test="CellPhoneHome!=''">
						(H-Cell):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(CellPhoneHome)"/>
						<br/>
					</xsl:if>
				</xsl:if>
			</td>
		</tr>
		<tr><td colspan="4"><br/></td></tr>		
	</xsl:template>
	
	<!-- PASSENGERS -->
	<xsl:template match="P">
		<tr>
			<td valign="top">
				<xsl:value-of select="FirstName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="LastName"/>
				<br/>
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
				</xsl:if>
				<xsl:if test="string-length(StateProvince)!=0">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="StateProvince"/>					
				</xsl:if>
				<xsl:if test="string-length(ZipPostalCode)!=0">
					<xsl:text> </xsl:text>
					<xsl:value-of select="ZipPostalCode"/>					
				</xsl:if>	
			</td>
			<td valign="top">
				<xsl:if test="PhoneWork">
					<xsl:if test="PhoneWork!=''">
						(W):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(PhoneWork)"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="PhoneWorkExt"/>
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="CellPhoneWork">
					<xsl:if test="CellPhoneWork!=''">
						(W-Cell):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(CellPhoneWork)"/>
						<br/>
					</xsl:if>
				</xsl:if>														
				<xsl:if test="PhoneHome">
					<xsl:if test="PhoneHome!=''">
						(H):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(PhoneHome)"/>
						<br/>
					</xsl:if>
				</xsl:if>														
				<xsl:if test="CellPhoneHome">
					<xsl:if test="CellPhoneHome!=''">
						(H-Cell):<xsl:text> </xsl:text>
						<xsl:value-of select="cei:formatphonenumber(CellPhoneHome)"/>
						<br/>
					</xsl:if>
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="ClaimVehicleID !=''">
					Insured Vehicle
				</xsl:if>
				<xsl:if test="OtherVehID !=''">
					Other Vehicle					
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="OtherVehID !=''">
					<xsl:value-of select="OVOLastName"/>
				</xsl:if>
			</td>
		</tr>	
		<tr>
			<td colspan="4"><hr/></td>
		</tr>
	</xsl:template>	
	
	<!-- CUSTOM DATA -->
	<xsl:template match="CD">
		<xsl:variable name="customDataCounter" select="position()"></xsl:variable>		
		<tr>
			<td valign="top">
				<xsl:value-of select="$customDataCounter"></xsl:value-of><xsl:text>.</xsl:text>
			</td>
			<td valign="top"><xsl:value-of select="Name"/></td>
			<td></td>
			<td valign="top"> 
			
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
		<tr>
			<td colspan="2"><br/></td>						
		</tr>		
	</xsl:template>
	
	<msxml:script language="VB" implements-prefix="cei">
	
			Function formatphonenumber(sPhone As String)										
				Select Case sPhone.Length					
					Case 10							
						tmpPhone = "(" &amp;  mid(sPhone,1,3) &amp; ") " &amp;  mid(sPhone,4,3) &amp; " - " &amp;  mid(sPhone,7,4)
					Case 7													
						tmpPhone =  mid(sPhone,1,3) &amp; " - " &amp; Mid(sPhone,4,3)
					Case Else													
						tmpPhone = sPhone
				End Select
							
				formatphonenumber = tmpPhone
			End Function
					
		</msxml:script>	
</xsl:stylesheet>