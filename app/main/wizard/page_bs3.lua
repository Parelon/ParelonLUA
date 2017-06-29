slot.set_layout("custom")

local initiative = Initiative:by_id(param.get_id())
local issue_id = param.get("issue_id", atom.integer) or 0
local area_id = param.get("area_id", atom.integer)
local unit_id = param.get("unit_id", atom.integer)
local area_name = param.get("area_name", atom.string)
local unit_name = param.get("unit_name", atom.string)
local policy_id = param.get("policy_id", atom.integer) or 0
local issue_title = param.get("issue_title", atom.string) or ""
local issue_brief_description = param.get("issue_brief_description", atom.string) or ""
local issue_keywords = param.get("issue_keywords", atom.string)
local problem_description = param.get("problem_description", atom.string) or ""
local aim_description = param.get("aim_description", atom.string) or ""
local initiative_title = param.get("initiative_title", atom.string) or ""
local initiative_brief_description = param.get("initiative_brief_description", atom.string) or ""
local draft = param.get("draft", atom.string) or ""
local technical_areas = param.get("technical_areas", atom.string)
local proposer1 = param.get("proposer1", atom.boolean) or false
local proposer2 = param.get("proposer2", atom.boolean) or false
local proposer3 = param.get("proposer3", atom.boolean) or false
local resource = param.get("resource", atom.string)
local sociallink = param.get("sociallink", atom.strin)
local archivecloud = param.get("archivecloud", atom.string)

-- trace di controllo sui valori dei parametri
trace.debug("issue_id: " .. tostring(issue_id))
trace.debug("area_id: " .. tostring(area_id))
trace.debug("area_name: " .. area_name)
trace.debug("unit_id: " .. tostring(unit_id))
trace.debug("unit_name: " .. tostring(unit_name))
trace.debug("policy_id: " .. tostring(policy_id))
trace.debug("issue_title: " .. issue_title)
trace.debug("issue_brief_description: " .. issue_brief_description)
trace.debug("issue_keywords: " .. (issue_keywords and issue_keywords or "none"))
trace.debug("problem_description: " .. problem_description)
trace.debug("aim_description: " .. aim_description)
trace.debug("initiative_title: " .. initiative_title)
trace.debug("initiative_brief_description: " .. initiative_brief_description)
trace.debug("draft: " .. draft)
trace.debug("technical_areas: " .. (technical_areas and technical_areas or "none"))
trace.debug("proposer1: " .. tostring(proposer1))
trace.debug("proposer2: " .. tostring(proposer2))
trace.debug("proposer3: " .. tostring(proposer3))
trace.debug("resource: " .. (resource and resource or "none"))
trace.debug("sociallink: " .. (sociallink and sociallink or "none"))
trace.debug("archivecloud: " .. (archivecloud and archivecloud or "none"))
ui.title(function()
 ui.container {
      attr = { class = "row" },
      content = function()
             ui.container {
               attr = { class = "col-md-3 col-sm-4 col-xs-12 text-center spaceline" },
               content = function()
                   ui.tag {
                       tag = "a",
                       attr = { id = "btnPreviuos", class = "btn btn-primary btn-back fixclick", onClick = "getElementById(\"page_bs3_back\").submit();" },
                       content = function()
                           ui.heading {
                               level = 3,
                               content = function()
                                   ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
                                   slot.put(_ "Back Phase")
                               end
                           }
                       end
                   }
               end
           }
          ui.container {
              attr = { class = "col-md-6 well-inside paper col-sm-4 col-xs-12 text-center" },
                                content = function()
                                    ui.heading { level = 1, attr = { class = "uppercase label label-success" }, content = _ "STEP 3: Proponi una soluzione" }
                                    ui.heading {
                                        level = 2,
                                        attr = { class = "spaceline" },
                                        content = function()
                                            slot.put(_ "Unit" .. ": " .. "<strong>" .. unit_name .. "</strong>")
                                        end
                                    }
                                    ui.heading {
                                        level = 2,
                                        content = function()
                                            slot.put(_ "Area" .. ": " .. "<strong>" .. area_name .. "</strong>")
                                        end
                                    }
                                end
                            }
           ui.container {
               attr = { class = "col-md-3 col-sm-4 col-xs-12 text-center spaceline" },
               content = function()
                   ui.tag {
                       tag = "a",
                       attr = { id = "btnNext", class = "btn btn-primary btn-back fixclick", onClick = "getElementById(\"page_bs3\").submit();" },
                       content = function()
                           ui.heading {
                               level = 3,
                               content = function()
                                   slot.put(_ "Next Phase")
                                   ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-right.svg" }
                               end
                           }
                       end
                   }
               end
           }
                        end
                    }
end)

ui.form {
    method = "post",
    attr = { id = 'page_bs3' },
    module = 'wizard',
    view = 'page_bs12',
    params = {
        issue_id = issue_id,
        area_id = area_id,
        unit_id = unit_id,
        area_name = area_name,
        unit_name = unit_name,
        policy_id = policy_id,
        issue_title = issue_title,
        issue_brief_description = issue_brief_description,
        issue_keywords = issue_keywords,
        problem_description = problem_description,
        aim_description = aim_description,
        initiative_title = initiative_title,
        initiative_brief_description = initiative_brief_description,
        draft = draft,
        technical_areas = technical_areas,
        proposer1 = proposer1,
        proposer2 = proposer2,
        proposer3 = proposer3,
        resource = resource,
	sociallink = sociallink,
	archivecloud = archivecloud
    },         
    content = function()
			ui.container {
				attr = { class = "row" },
				content = function()
					ui.container {
						attr = { class = "col-md-12 well" },
						content = function()
							ui.container {
								attr = { class = "row" },
								content = function()
									ui.container {
										attr = { class = "col-md-12 well-inside paper"},
										content = function()
											ui.container {
												attr = { class = "panel-group", id = "accordion", role = "tablist", ariamultiselectable = "true" },
												content = function()
													ui.container {
														attr = { class = "panel panel-default"},
														content = function()	  
															ui.container {
																attr = { class = "label label-accordion", role="tab", id="headingFive"},
																content = function()						                     
																ui.heading { 
																	level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#initiative_title", ariaexpanded="true", ariacontrols="initiative_title"},  
																	}
																	ui.image { static = "png/arrow-down-icon.png" }				                                   
																	ui.link {content = _ " TITOLO PROPOSTA"}
															end
															}
														ui.container {
																attr = { id="initiative_title", class="panel-collapse collapse in",  role="tabpanel", arialabelledby="headingFive"},
																content = function()
																ui.container {
																		attr = { class="panel-body"},
																		content = function()
			                                        -- Descrizione del problema
				                                        ui.container {
				                                            attr = { class = "row" },
				                                            content = function()
				                                                ui.container {
				                                                    attr = { class = "col-md-12" },
				                                                    content = function()
                                                                        ui.field.text {
                                                                            attr = { id = "initiative_title", style = " font-size: 25px;" },
                                                                            name = "initiative_title",
                                                                            value = initiative_title or ""
                                                                        }
				                                                    end
				                                                }
				                                            end
				                                        }
																	end
																}   
															end
															}					                    
													end
													}
											end 
											}
									end
									}
							end
							}
					end
					}
				end
			} 		         
			ui.container {
				attr = { class = "row" },
				content = function()
					ui.container {
						attr = { class = "col-md-12 well" },
						content = function()
							ui.container {
								attr = { class = "row" },
								content = function()
									ui.container {
										attr = { class = "col-md-12 well-inside paper"},
										content = function()
											ui.container {
												attr = { class = "panel-group", id = "accordion", role = "tablist", ariamultiselectable = "true" },
												content = function()
													ui.container {
														attr = { class = "panel panel-default"},
														content = function()	  
															ui.container {
																attr = { class = "label label-accordion", role="tab", id="headingSix"},
																content = function()						                     
																ui.heading { 
																	level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#initiative_brief_description", ariaexpanded="true", ariacontrols="initiative_brief_description"},  
																	}	
																	ui.image { static = "png/arrow-down-icon.png" }			                                   
																	ui.link {content = _ " BREVE DESCRIZIONE"}
															end
															}
														ui.container {
																attr = { id="initiative_brief_description", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingSix"},
																content = function()
																ui.container {
																		attr = { class="panel-body"},
																		content = function()
			                                        -- Descrizione del problema
			                                        ui.container {
			                                            attr = { class = "row" },
			                                            content = function()
																				ui.container {
																					attr = { class = "col-md-12 text-left" },
																					content = function()
																					ui.tag { tag = "p", content = "Descrivete in un abstract max 300 parole, i punti di forza, le criticità ed i benefici della vostra proposta." }
																					end
																				}	
			                                                ui.container {
			                                                    attr = { class = "col-md-12 init_brief" },
			                                                    content = function()
			                                                        ui.tag {
			                                                            tag = "textarea",
			                                                            attr = { id = "initiative_brief_description", name = "initiative_brief_description", style = "height:250px;width:100%;resize:yes;" },
			                                                            content = initiative_brief_description or ""
			                                                        }
			                                                    end
			                                                }
			                                            end
			                                        }
																	end
																}   
															end
															}					                    
													end
													}
											end 
											}
									end
									}
							end
							}
					end
					}
				end
			}
			ui.container {
				attr = { class = "row" },
				content = function()
					ui.container {
						attr = { class = "col-md-12 well" },
						content = function()
							ui.container {
								attr = { class = "row" },
								content = function()
									ui.container {
										attr = { class = "col-md-12 well-inside paper"},
										content = function()
											ui.container {
												attr = { class = "panel-group", id = "accordion", role = "tablist", ariamultiselectable = "true" },
												content = function()
													ui.container {
														attr = { class = "panel panel-default"},
														content = function()	  
															ui.container {
																attr = { class = "label label-accordion", role="tab", id="headingSeven"},
																content = function()						                     
																ui.heading { 
																	level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#draft", ariaexpanded="true", ariacontrols="draft"},  
																	}
																	ui.image { static = "png/arrow-down-icon.png" }				                                   
																	ui.link {content = _ " TESTO DELLA PROPOSTA"}
															end
															}
														ui.container {
																attr = { id="draft", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingSeven"},
																content = function()
																ui.container {
																		attr = { class="panel-body"},
																		content = function()
						                                        ui.container {
						                                            attr = { class = "row" },
						                                            content = function()
																							ui.container {
																								attr = { class = "col-md-10 text-left" },
																								content = function()
																								ui.tag { tag = "p", content = "Gli articoli i commi ed i riferimenti normativi della Tua proposta di soluzione al problema o questione sollevata" }
																								end
																							}	
																							ui.container {
																								attr = { class = "col-md-2 text-right" },
																								content = function()
																									 ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
													                                     slot.put(_ "Esporta")	
																								end
																							}	
						                                                ui.container {
						                                                    attr = { class = "col-md-12 issue_desc" },
						                                                    content = function()
						                                                        ui.tag {
						                                                            tag = "textarea",
						                                                            attr = { id = "draft", name = "draft", style = "height:250px;width:100%;resize:yes;" },
						                                                            content = draft or ""
						                                                        }
						                                                    end
						                                                }
						                                            end
						                                        }
																	end
																}   
															end
															}					                    
													end
													}
											end 
											}
									end
									}
							end
							}
					end
					}
				end
			}
			ui.container {
				attr = { class = "row" },
				content = function()
					ui.container {
						attr = { class = "col-md-12 well" },
						content = function()
							ui.container {
								attr = { class = "row" },
								content = function()
									ui.container {
										attr = { class = "col-md-12 well-inside paper"},
										content = function()
											ui.container {
												attr = { class = "panel-group", id = "accordion", role = "tablist", ariamultiselectable = "true" },
												content = function()
													ui.container {
														attr = { class = "panel panel-default"},
														content = function()	  
															ui.container {
																attr = { class = "label label-accordion", role="tab", id="headingHeight"},
																content = function()						                     
																ui.heading { 
																	level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#resource", ariaexpanded="true", ariacontrols="title"},  
																	}
																	ui.image { static = "png/arrow-down-icon.png" }					                                   
																	ui.link {content = _ " DOCUMENTAZIONE ALLEGATA E MEDIA"}
															end
															}
														ui.container {
																attr = { id="resource", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingHeight"},
																content = function()
																ui.container {
																	attr = { class="panel-body"},
																	content = function()
																	ui.container {
																		attr = { class = "row " },
																		content = function()
																			 ui.heading { level = 4, attr = { class = "col-md-12" }, content = "Se lo hai fatto, puoi inserire il link di un video youtube relativo alla tua proposta" }
                                                          ui.field.text {
                                                              attr = { id = "resource", class = "col-md-5" },
                                                              name = "resource",
                                                              value = resource or ""
                                                          }	
                                                          ui.heading { level = 4, attr = { class = "col-md-12" }, content = "Inserire il link ad una cartella cloud pubblica o a documenti" }
                                                          ui.field.text {
                                                              attr = { id = "archivecloud", class = "col-md-5" },
                                                              name = "archivecloud",
                                                              value = archivecloud or ""
                                                          }	
                                                          ui.heading { level = 4, attr = { class = "col-md-12" }, content = "Inserire il link ad una pagina social, forum, meetup o blog di discussione" }
                                                          ui.field.text {
                                                              attr = { id = "sociallink", class = "col-md-5" },
                                                              name = "sociallink",
                                                              value = sociallink or ""
                                                          }	
                                                             end
                                                          }																				
																		end
																		}
																	end
																}   
															end
															}					                    
													end
													}
											end 
											}
									end
									}
							end
							}
					end
					}
				end
			}
			ui.container {
				attr = { class = "row" },
				content = function()
					ui.container {
						attr = { class = "col-md-12 well" },
						content = function()
			             ui.container {
			                 attr = { class = "row" },
			                 content = function()
										ui.container {
											attr = { class = "col-md-12 text-left well-inside paper" },
											content = function()
												ui.container {
							                 attr = { class = "row" },
							                 content = function()
											     ui.heading {
				                          attr = { class = "label label-accordion" },
				                          level = 3,
				                          content = _ "COMPETENZE TECNICHE"
				                           }
							               end
						                  }
				                  		 ui.container {
													attr = { class = "col-md-12 text-left" },
													content = function()
													ui.tag { tag = "p", content = "Suggerisci competenze in materia tecnica, sociale, finanziaria, impatto ambientale e pianificazione delle risorse, per es: Psicologo, Commercialista, economista, muratore. " }
													end
												}	 
			                                          
				                     ui.container {
				                         attr = { class = "col-md-12" },
				                         content = function()
			                              ui.tag {
			                                  tag = "input",
			                                  id = "technical_areas",
			                                  attr = { id = "technical_areas", name = "technical_areas", class = "tagsinput", style = "resize:none;" },
							  value = technical_areas or ""
			                              }
				                     end
				                     }
				                     
				                  end
										}   
									end
									} 
			             end
			             }		                    
					end
					}	

		
--	ROUTING BACK

ui.form {
    method = "post",
    attr = { class = "inline-block", id = "page_bs3_back" },
    module = 'wizard',
    view = 'page_bs2',
    params = {
        issue_id = issue_id,
        area_id = area_id,
        unit_id = unit_id,
        area_name = area_name,
        unit_name = unit_name,
        policy_id = policy_id,
        issue_title = issue_title,
        issue_brief_description = issue_brief_description,
        issue_keywords = issue_keywords,
        problem_description = problem_description,
        aim_description = aim_description,
        initiative_title = initiative_title,
        initiative_brief_description = initiative_brief_description,
        draft = draft,
        technical_areas = technical_areas,
        proposer1 = proposer1,
        proposer2 = proposer2,
        proposer3 = proposer3,
        resource = resource,
	sociallink = sociallink,
	archivecloud = archivecloud
    }
}
ui.script { static = "js/jquery.tagsinput.js" }
ui.script { script = "$('#issue_keywords').tagsInput({'height':'1%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
ui.script { script = "$('#technical_areas').tagsInput({'height':'1%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
