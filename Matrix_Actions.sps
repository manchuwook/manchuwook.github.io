<?xml version="1.0" encoding="UTF-8"?>
<structure version="16" html-doctype="HTML5" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="HeroLabCustomExport.xsd" workingxmlfile="Group_Characters.xml"/>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<mainparts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
		<xpath-functions/>
	</flags>
	<scripts>
		<script language="javascript"> var script = document.createElement(&apos;script&apos;);
 script.type = &apos;text/javascript&apos;;
 script.src = &apos;./dice-roller.js&apos;;
 var head = document.getElementsByTagName(&apos;head&apos;)[0];
 head.appendChild(script);

function openRoller(dice) {
	// Get a reference to the dice tower
	var diceTower = document.querySelector(&apos;#dice-tower&apos;);

	// Get a reference to the base dice
	var diceAmount = diceTower.querySelector(&apos;#dice&apos;);
	diceAmount.innerHTML = dice;

	// Set the tower back to visible
	diceTower.style.display = &apos;block&apos;;
}

function closeTower() {
	// Get a reference to the dice tower
	var diceTower = document.querySelector(&apos;#dice-tower&apos;);

	diceTower.style.display = &apos;hidden&apos;;
}

function rollDice() {
	// Fancy RPG dice roller
	var diceRoller = new DiceRoller();

	// Shadowrun&apos;s dicetype is always d6
	var diceType = &apos;d6&apos;;

	// Fetch the base dice value
	var baseDice = parseFloat(document.querySelector(&quot;#dice&quot;).innerHTML || 0);
	// Fetch the bonus dice value
	var bonus = parseFloat(document.querySelector(&quot;#bonus-dice&quot;).value || 0);

	// Fetch the penalty dice value
	var penalty = parseFloat(document.querySelector(&quot;#penalty-dice&quot;).value || 0);

	// Fetch the bonus dice value
	var preEdge = document.querySelector(&quot;#isPre&quot;).checked || false;

	// If edge was burned, edge dice are added, 6&apos;s append another die, rolling more for each 6
	if (preEdge) {
		bonus += parseFloat(document.querySelector(&quot;#edge-dice&quot;).value || 0);
		diceType += &apos;!&apos;;
	}

	// Roll those dice
	diceRoller.roll((baseDice + bonus - penalty) + diceType);

	// Store it in a temp variable
	var latestRoll = diceRoller.getLog().shift();

	// Get the console window
	var dr = document.querySelector(&quot;#dice-results&quot;);

	// Only one item in the array
	var rolled = latestRoll.rolls[0];

	// Classify the dice as:
	// - explodable (6s)
	var explodable = rolled.reduce((total,x)=&gt;{ return x == 6 ? total + 1 : total }, 0);

	// - hit (5 or 6)
	var hits = rolled.reduce((total,x)=&gt;{ return x &gt;= 5 ? total + 1 : total }, 0);

	// - miss (1-4)
	var misses = rolled.reduce((total,x)=&gt;{ return x &lt; 5 ? total + 1 : total }, 0);

	// - possible glitch (1)
	var glitched = rolled.reduce((total,x)=&gt;{ return x == 1 ? total + 1 : total }, 0);

	// Classify the total results as
	// - some successes (1+ dice &gt;= 5)

	// - confirmed glitch (base dice / 2 in 1s)
	var glitchmsg = &quot;&quot;;
	if (glitched == Math.ceil(baseDice / 2)) { glitchmsg = &quot;, &lt;b&gt;GLITCHED!&lt;/b&gt;&quot;; }

	// - critical glitch (confirmed glitch + no hits)
	if (glitched == Math.ceil(baseDice / 2) &amp;&amp; hits == 0) { glitchmsg = &quot;, &lt;b&gt;CRITICAL GLITCH!&lt;/b&gt;&quot;; }

	// Spit out the results
	var results = &apos;&lt;div class=&quot;grid-40&quot;&gt;&apos; + rolled + &apos;&lt;/div&gt;&apos;;
	// Add individual dice stats
	results += &apos;&lt;div class=&quot;grid-40&quot;&gt;&apos;;
	results += hits + &apos; hits, &apos;;
	results += misses + &apos; failures&apos;;
	results += glitchmsg;
	results += &apos;&lt;/div&gt;&apos;;
	// Show the reroll link
	results += &apos;&lt;div class=&quot;grid-20 reroll&quot;&gt;(&lt;a href=&quot;#&quot;&gt;Reroll&lt;/a&gt;)&lt;/div&gt;&apos;;
	dr.innerHTML += results;
}
</script>
	</scripts>
	<script-project>
		<Project version="2" app="AuthenticView"/>
	</script-project>
	<importedxslt/>
	<globalstyles>
		<rule url="tabs.css">
			<media>
				<media value="all"/>
			</media>
		</rule>
		<rule url="unsemantic-master\assets\stylesheets\unsemantic-grid-responsive-no-ie7.css">
			<media>
				<media value="all"/>
			</media>
		</rule>
		<rule url="modal.css">
			<media>
				<media value="all"/>
			</media>
		</rule>
	</globalstyles>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<document-properties/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
						<watermark>
							<image transparency="50" fill-page="1" center-if-not-fill="1"/>
							<text transparency="50"/>
						</watermark>
					</documentsection>
					<userxmlelem openingtagtext="div class=&quot;grid-container&quot;">
						<children>
							<userxmlelem openingtagtext="div class=&quot;tabs grid-100&quot;">
								<children>
									<template subtype="source" match="XML">
										<children>
											<template subtype="element" match="document">
												<children>
													<template subtype="element" match="public">
														<children>
															<newline/>
															<template subtype="element" match="character">
																<children>
																	<userxmlelem openingtagtext="input class=&quot;input&quot; id=&quot;tab-{position()}&quot; name=&quot;tabs&quot; type=&quot;radio&quot;"/>
																	<userxmlelem openingtagtext="label class=&quot;label&quot; for=&quot;tab-{position()}&quot;">
																		<children>
																			<template subtype="attribute" match="name">
																				<children>
																					<content subtype="regular"/>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</userxmlelem>
																	<userxmlelem openingtagtext="div class=&quot;panel grid-100 actions&quot;">
																		<children>
																			<tgrid>
																				<properties border="0" cellpadding="0" cellspacing="0" width="100%"/>
																				<children>
																					<tgridbody-cols>
																						<children>
																							<tgridcol>
																								<properties valign="top"/>
																							</tgridcol>
																							<tgridcol/>
																							<tgridcol>
																								<properties valign="top"/>
																							</tgridcol>
																							<tgridcol>
																								<properties valign="top"/>
																							</tgridcol>
																							<tgridcol>
																								<properties valign="top"/>
																							</tgridcol>
																						</children>
																					</tgridbody-cols>
																					<tgridbody-rows>
																						<children>
																							<tgridrow>
																								<properties bgcolor="#3c3c3c"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Simple Actions">
																												<styles color="#f0f0f0" font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Marks">
																												<styles color="#f0f0f0" font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Note">
																												<styles color="#f0f0f0" font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Test: Source">
																												<styles color="#f0f0f0" font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="d6">
																												<styles color="#f0f0f0"/>
																											</text>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Change Icon"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Owner"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Change target icon, or self"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing">
																												<styles font-style="italic"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Miscellaneous"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Check Overwatch Score"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="-"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Get OS from GM"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Electronic Warfare ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Electronic Warfare&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Sleaze">
																												<styles font-style="italic"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Information Gathering"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="6d6"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Invite Mark"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Owner"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Choose # of Marks and Duration"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Mark Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Jack Out"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Owner"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Reboot and Dumpshock.  Roll only for Linklock"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Hardware ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Hardware&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]  + Willpower ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Willpower&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Willpower&apos;]/@modified | skills/active/skill[@name=&apos;Hardware&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Willpower&apos;]/@modified | skills/active/skill[@name=&apos;Hardware&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Miscellaneous"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Logic + Attack"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Attack&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Logic&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6]"/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Send Message"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="-"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Send short sentence, image, or file to user."/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Miscellaneous"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Switch Interface Mode"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Owner"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="AR to VR and vice versa. Can&apos;t if Linklocked"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Miscellaneous"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#5a5a5a"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Complex Actions">
																												<styles color="#f0f0f0" font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Marks">
																												<styles color="#f0f0f0" font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Note">
																												<styles color="#f0f0f0" font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Test: Source">
																												<styles color="#f0f0f0" font-weight="bold"/>
																											</text>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="d6">
																												<styles color="#f0f0f0"/>
																											</text>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Format Device"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="3"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Device is Formatted on next Reboot"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Computer ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Computer&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]  + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Device Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Willpower + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Willpower&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6]"/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Reboot Device"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="3"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Dumpshock.  Can&apos;t reboot if Linklocked"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Computer ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Computer&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Device Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Willpower + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Willpower&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Spoof Command"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="1"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Send command as though Owner"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Hacking ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Hacking&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Intuition ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Intuition&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Hacking&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Hacking&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Device Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Logic + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Logic&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Garbage In/Garbage Out"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="3"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Change command result (Pulling Trigger ejects)"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Sofware ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Software&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Software&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Software&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Device Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Logic + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Logic&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Crack File"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="1"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Remove File Protection"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Hacking ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Hacking&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Hacking&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Hacking&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Attack"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="File Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="2 * Protection Rating"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Disarm Data Bomb"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="-"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Triggers Data Bomb on Failure"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Software ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Software&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Intuition ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Intuition&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Software&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Software&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="File Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="2 * Data Bomb Rating"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Edit File"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="1"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Create, Change, Copy, Delete, or Protect any File"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Computer ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Computer&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="File Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Intuition + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Intuition&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6]"/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Set Data Bomb"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="1"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Choose Rating, Does Rating(d6) Matrix DV"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Software ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Software&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Software&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Software&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="File Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="2 * Data Bomb Rating"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Matrix Perception"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="-"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Opposed if target is running silent"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Computer ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Computer&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Inuition ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Intuition&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Information Gathering"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Logic + Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Logic&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Snoop"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="1"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="View/Record traffic to/from Marked Device"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Electronic Warfare ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Electronic Warfare&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Intuition ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Intuition&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Information Gathering"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Logic + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Logic&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Trace Icon"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="2"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Locate Physical Location of device/persona"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Computer ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Computer&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Intuition ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Intuition&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Information Gathering"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Willpower + Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Willpower&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Brute Force Attack"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="-"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="+1 Mark. Optional +1 Matrix DV per 2 net hits"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Cybercombat ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Cybercombat&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Cybercombat&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Cybercombat&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Attack"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Mark Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Willpower + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Willpower&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Brute Force Grid Hop"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="-"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Hop to Grid you don&apos;t have access to"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Cybercombat ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Cybercombat&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Cybercombat&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Cybercombat&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Attack"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Mark Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="4 (local) or 6 (global)"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Erase Mark"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="3"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Remove Marks on single icon from single icon"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Computer ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Computer&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Computer&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Attack"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Mark Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Willpower + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Willpower&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Hack on the Fly"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="-"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="+1 Mark.  +1 Matrix Perception Hit per 2 Net Hits"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Hacking ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Hacking&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Hacking&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Hacking&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink>
																													<fixtext value="#"/>
																												</hyperlink>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Mark Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Intuition + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Intuition&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Hack on the Fly Grid Hop"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Hop to grid you don&apos;t have access to"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Hacking ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Hacking&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Hacking&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Hacking&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Mark Manipulation"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="4 (local) or 6 (global)"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Crash Program"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="1"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Crash a specific program until Reboot"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Cybercombat ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Cybercombat&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Cybercombat&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Cybercombat&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Attack"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Matrix Combat"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Intuition + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Intuition&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Spike"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="-"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="DV = Attack + Net Hits + 2 * Marks"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Cybercombat ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Cybercombat&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Cybercombat&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Cybercombat&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Attack"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Matrix Combat"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Intuition + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Intuition&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Enter / Exit host"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="1"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Exit Host to where you entered from"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Miscellaneous"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Grid Hop"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="-"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Mast have permission, must leave host first"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Miscellaneous"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Hide"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="0"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Disappear from target that hasn&apos;t Marked you"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Electronic Warfare ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Electronic Warfare&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Intuition ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Intuition&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Intuition&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Sleaze"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Miscellaneous"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Intuition + Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Data Processing&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Intuition&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Jam Signals"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Owner"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Add Hits to Noise for 100m"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Electronic Warfare ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Electronic Warfare&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Attack"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Miscellaneous"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell/>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Jump into Rigged Device"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="3"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="No test if owner or have permission"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Electronic Warfare ["/>
																											<template subtype="element" match="skills">
																												<children>
																													<template subtype="userdefined" match="*">
																														<children>
																															<template subtype="element" filter="@name=&apos;Electronic Warfare&apos;" match="skill">
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="byte"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="] + Logic ["/>
																											<template subtype="element" match="attributes">
																												<children>
																													<template subtype="element" filter="@name=&apos;Logic&apos;" match="attribute">
																														<children>
																															<template subtype="attribute" match="modified">
																																<children>
																																	<content subtype="regular">
																																		<format basic-type="xsd" datatype="decimal"/>
																																	</content>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																											<text fixtext="]"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<link>
																												<properties onclick="openRoller({sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)})"/>
																												<children>
																													<text fixtext="["/>
																													<template subtype="userdefined" match="sum(attributes/attribute[@name=&apos;Logic&apos;]/@modified | skills/active/skill[@name=&apos;Electronic Warfare&apos;]/@modified)">
																														<children>
																															<content subtype="regular"/>
																														</children>
																														<variables/>
																													</template>
																													<text fixtext="d6]"/>
																												</children>
																												<action>
																													<none/>
																												</action>
																												<hyperlink/>
																											</link>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																							<tgridrow>
																								<properties bgcolor="#e1e1e1"/>
																								<children>
																									<tgridcell>
																										<children>
																											<text fixtext="Data Processing"/>
																										</children>
																									</tgridcell>
																									<tgridcell/>
																									<tgridcell>
																										<children>
																											<text fixtext="Miscellaneous"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<text fixtext="Willpower + Firewall"/>
																										</children>
																									</tgridcell>
																									<tgridcell>
																										<children>
																											<template subtype="element" match="gear">
																												<children>
																													<template subtype="element" match="equipment">
																														<children>
																															<template subtype="element" filter="(matrix/matrixattribute[@name=&apos;Sleaze&apos;]/@modified &gt; 0 or  contains(description, &apos;ommlink&apos;))" match="item">
																																<children>
																																	<userxmlelem openingtagtext="div class=&quot;grid-100&quot;">
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext=" ["/>
																																			<template subtype="userdefined" match="sum(./matrix/matrixattribute[@name=&apos;Firewall&apos;]/@modified   | ../../../attributes/attribute[@name=&apos;Willpower&apos;]/@modified)">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																			<text fixtext="d6] "/>
																																		</children>
																																	</userxmlelem>
																																</children>
																																<variables/>
																															</template>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																									</tgridcell>
																								</children>
																							</tgridrow>
																						</children>
																					</tgridbody-rows>
																				</children>
																			</tgrid>
																			<newline/>
																			<template subtype="element" match="gear">
																				<children>
																					<template subtype="userdefined" match="*">
																						<children>
																							<template subtype="element" filter="(@wireless=&apos;Present&apos; and not(contains(@name,&apos;Backpack&apos;) or contains(@name,&apos;Fetish&apos;) or contains(@name,&apos;Belltpouch&apos;)))" match="item">
																								<children>
																									<userxmlelem openingtagtext="div class=&quot;grid-20&quot;">
																										<children>
																											<tgrid>
																												<properties border="0" width="100%"/>
																												<children>
																													<tgridbody-cols>
																														<children>
																															<tgridcol/>
																															<tgridcol/>
																														</children>
																													</tgridbody-cols>
																													<tgridheader-rows>
																														<children>
																															<tgridrow>
																																<properties bgcolor="#e1e1e1"/>
																																<children>
																																	<tgridcell>
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																		</children>
																																	</tgridcell>
																																	<tgridcell joinleft="1"/>
																																</children>
																															</tgridrow>
																														</children>
																													</tgridheader-rows>
																													<tgridbody-rows>
																														<children>
																															<template subtype="element" match="matrix">
																																<children>
																																	<template subtype="element" match="matrixattribute">
																																		<children>
																																			<tgridrow>
																																				<children>
																																					<tgridcell>
																																						<children>
																																							<template subtype="attribute" match="name">
																																								<children>
																																									<content subtype="regular">
																																										<styles font-weight="bold"/>
																																									</content>
																																								</children>
																																								<variables/>
																																							</template>
																																						</children>
																																					</tgridcell>
																																					<tgridcell>
																																						<children>
																																							<template subtype="attribute" match="modified">
																																								<children>
																																									<content subtype="regular">
																																										<format basic-type="xsd" datatype="byte"/>
																																									</content>
																																								</children>
																																								<variables/>
																																							</template>
																																						</children>
																																					</tgridcell>
																																				</children>
																																			</tgridrow>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																																<variables/>
																															</template>
																														</children>
																													</tgridbody-rows>
																												</children>
																											</tgrid>
																										</children>
																									</userxmlelem>
																								</children>
																								<variables/>
																							</template>
																						</children>
																						<variables/>
																					</template>
																				</children>
																				<variables/>
																			</template>
																			<newline/>
																			<userxmlelem openingtagtext="div class=&quot;grid-66 skills&quot;">
																				<children>
																					<tgrid>
																						<properties border="0"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol/>
																									<tgridcol/>
																									<tgridcol/>
																									<tgridcol/>
																								</children>
																							</tgridbody-cols>
																							<tgridheader-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<styles text-align="left"/>
																												<children>
																													<text fixtext="name"/>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles text-align="left"/>
																												<children>
																													<text fixtext="modified"/>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles text-align="left"/>
																												<children>
																													<text fixtext="dicepool"/>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles text-align="left"/>
																												<children>
																													<text fixtext="specialization"/>
																												</children>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridheader-rows>
																							<tgridbody-rows>
																								<children>
																									<template subtype="element" match="skills">
																										<children>
																											<template subtype="userdefined" match="*">
																												<children>
																													<template subtype="element" match="skill">
																														<children>
																															<tgridrow>
																																<children>
																																	<tgridcell>
																																		<styles text-align="left"/>
																																		<children>
																																			<template subtype="attribute" match="name">
																																				<children>
																																					<content subtype="regular"/>
																																				</children>
																																				<variables/>
																																			</template>
																																		</children>
																																	</tgridcell>
																																	<tgridcell>
																																		<styles text-align="left"/>
																																		<children>
																																			<template subtype="attribute" match="modified">
																																				<children>
																																					<content subtype="regular">
																																						<format basic-type="xsd" datatype="byte"/>
																																					</content>
																																				</children>
																																				<variables/>
																																			</template>
																																		</children>
																																	</tgridcell>
																																	<tgridcell>
																																		<styles text-align="left"/>
																																		<children>
																																			<template subtype="attribute" match="dicepool">
																																				<children>
																																					<content subtype="regular">
																																						<format basic-type="xsd" datatype="byte"/>
																																					</content>
																																				</children>
																																				<variables/>
																																			</template>
																																		</children>
																																	</tgridcell>
																																	<tgridcell>
																																		<styles text-align="left"/>
																																		<children>
																																			<template subtype="element" match="specialization">
																																				<children>
																																					<template subtype="attribute" match="bonustext">
																																						<children>
																																							<content subtype="regular"/>
																																						</children>
																																						<variables/>
																																					</template>
																																				</children>
																																				<variables/>
																																			</template>
																																		</children>
																																	</tgridcell>
																																</children>
																															</tgridrow>
																														</children>
																														<variables/>
																													</template>
																												</children>
																												<variables/>
																											</template>
																										</children>
																										<variables/>
																									</template>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</userxmlelem>
																			<newline/>
																			<userxmlelem openingtagtext="div class=&quot;grid-33 attributes&quot;">
																				<children>
																					<tgrid>
																						<properties border="0"/>
																						<children>
																							<tgridbody-cols>
																								<children>
																									<tgridcol/>
																									<tgridcol/>
																								</children>
																							</tgridbody-cols>
																							<tgridheader-rows>
																								<children>
																									<tgridrow>
																										<children>
																											<tgridcell>
																												<children>
																													<text fixtext="Attribute"/>
																												</children>
																											</tgridcell>
																											<tgridcell>
																												<styles text-align="left"/>
																												<children>
																													<text fixtext="Rating"/>
																												</children>
																											</tgridcell>
																										</children>
																									</tgridrow>
																								</children>
																							</tgridheader-rows>
																							<tgridbody-rows>
																								<children>
																									<template subtype="element" match="attributes">
																										<children>
																											<template subtype="element" match="attribute">
																												<children>
																													<tgridrow>
																														<children>
																															<tgridcell>
																																<children>
																																	<template subtype="attribute" match="name">
																																		<children>
																																			<content subtype="regular"/>
																																		</children>
																																		<variables/>
																																	</template>
																																</children>
																															</tgridcell>
																															<tgridcell>
																																<styles text-align="left"/>
																																<children>
																																	<template subtype="attribute" match="modified">
																																		<children>
																																			<content subtype="regular">
																																				<format basic-type="xsd" datatype="decimal"/>
																																			</content>
																																		</children>
																																		<variables/>
																																	</template>
																																	<newline/>
																																</children>
																															</tgridcell>
																														</children>
																													</tgridrow>
																												</children>
																												<variables/>
																											</template>
																										</children>
																										<variables/>
																									</template>
																								</children>
																							</tgridbody-rows>
																						</children>
																					</tgrid>
																				</children>
																			</userxmlelem>
																		</children>
																	</userxmlelem>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</userxmlelem>
						</children>
					</userxmlelem>
					<paragraph>
						<properties class="grid-container modal-content" id="dice-tower"/>
						<styles display="none"/>
						<children>
							<paragraph>
								<properties class="grid-container close" onclick="closeTower()"/>
								<children>
									<text fixtext="X"/>
								</children>
							</paragraph>
							<paragraph>
								<properties class="modal-header"/>
								<children>
									<text fixtext="Header"/>
								</children>
							</paragraph>
							<userxmlelem openingtagtext="div class=&quot;grid-66 grid-parent&quot; id=&quot;dice-results&quot;">
								<children>
									<userxmlelem openingtagtext="div class=&quot;grid-40&quot;">
										<children>
											<text fixtext="Dice Rolled"/>
										</children>
									</userxmlelem>
									<userxmlelem openingtagtext="div class=&quot;grid-40&quot;">
										<children>
											<text fixtext="Dice Results"/>
										</children>
									</userxmlelem>
									<userxmlelem openingtagtext="div class=&quot;grid-20 reroll&quot;">
										<children>
											<text fixtext="Reroll"/>
										</children>
									</userxmlelem>
								</children>
							</userxmlelem>
							<newline/>
							<userxmlelem openingtagtext="div class=&quot;grid-33 grid-parent&quot;">
								<children>
									<userxmlelem openingtagtext="div class=&quot;grid-100&quot; id=&quot;action-name&quot;">
										<children>
											<text fixtext="Action Name"/>
										</children>
									</userxmlelem>
									<newline/>
									<userxmlelem openingtagtext="div class=&quot;grid-50&quot;">
										<children>
											<text fixtext="Dice"/>
										</children>
									</userxmlelem>
									<paragraph>
										<properties id="dice"/>
										<children>
											<text fixtext="6">
												<properties id="dice"/>
											</text>
										</children>
									</paragraph>
									<userxmlelem openingtagtext="div class=&quot;grid-50&quot;">
										<children>
											<text fixtext="Bonus Dice"/>
										</children>
									</userxmlelem>
									<userxmlelem openingtagtext="div class=&quot;grid-50&quot;">
										<children>
											<userxmlelem openingtagtext="input id=&quot;bonus-dice&quot; type=&quot;text&quot;"/>
										</children>
									</userxmlelem>
									<userxmlelem openingtagtext="div class=&quot;grid-50&quot;">
										<children>
											<text fixtext="Penalty Dice"/>
										</children>
									</userxmlelem>
									<userxmlelem openingtagtext="div class=&quot;grid-50&quot;">
										<children>
											<userxmlelem openingtagtext="input id=&quot;penalty-dice&quot; type=&quot;text&quot;"/>
										</children>
									</userxmlelem>
									<userxmlelem openingtagtext="div class=&quot;grid-50&quot;">
										<children>
											<text fixtext="Edge Roll (Pre)"/>
										</children>
									</userxmlelem>
									<userxmlelem openingtagtext="div class=&quot;grid-25&quot;">
										<children>
											<userxmlelem openingtagtext="input id=&quot;isPre&quot; type=&quot;checkbox&quot;"/>
										</children>
									</userxmlelem>
									<userxmlelem openingtagtext="div class=&quot;grid-25&quot;">
										<children>
											<userxmlelem openingtagtext="input id=&quot;edge-dice&quot; type=&quot;text&quot;"/>
										</children>
									</userxmlelem>
									<userxmlelem openingtagtext="div class=&quot;grid-100&quot; id=&quot;action-roll&quot; onclick=&quot;rollDice(6,true)&quot;">
										<children>
											<text fixtext="Roll Now"/>
										</children>
									</userxmlelem>
									<newline/>
								</children>
							</userxmlelem>
							<paragraph>
								<properties class="modal-footer"/>
								<children>
									<text fixtext="Footer"/>
								</children>
							</paragraph>
						</children>
					</paragraph>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
