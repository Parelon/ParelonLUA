slot.set_layout("custom")

local issue_id = param.get("issue_id", atom.integer) or 0
local area_id = param.get("area_id", atom.integer)
local unit_id = param.get("unit_id", atom.integer)
local area_name = param.get("area_name", atom.string)
local unit_name = param.get("unit_name", atom.string)
local policy_id = param.get("policy_id", atom.integer) or 0
local issue_title = param.get("issue_title", atom.string) or ""
local issue_brief_description = param.get("issue_brief_description", atom.string) or ""
local issue_keywords = param.get("issue_keywords", atom.string) or ""
local problem_description = param.get("problem_description", atom.string) or ""
local aim_description = param.get("aim_description", atom.string) or ""
local initiative_title = param.get("initiative_title", atom.string) or ""
local initiative_brief_description = param.get("initiative_brief_description", atom.string) or ""
local draft = param.get("draft", atom.string) or ""
local technical_areas = param.get("technical_areas", atom.string) or ""
local proposer1 = param.get("proposer1", atom.boolean) or false
local proposer2 = param.get("proposer2", atom.boolean) or false
local proposer3 = param.get("proposer3", atom.boolean) or false
local resource = param.get("resource", atom.string)
local sociallink = param.get("sociallink", atom.string)
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
trace.debug("issue_keywords: " .. issue_keywords)
trace.debug("problem_description: " .. problem_description)
trace.debug("aim_description: " .. aim_description)
trace.debug("initiative_title: " .. initiative_title)
trace.debug("initiative_brief_description: " .. initiative_brief_description)
trace.debug("draft: " .. draft)
trace.debug("technical_areas: " .. tostring(technical_areas))
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
                       attr = { id = "btnPreviuos", class = "btn btn-primary btn-back fixclick", onClick = "getElementById(\"page_bs2_back\").submit();" },
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
                  ui.heading { level = 1, attr = { class = "uppercase label label-danger" }, content = _ "STEP 2: Segnala il problema o questione " }
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
                       attr = { id = "btnNext", class = "btn btn-primary btn-back fixclick", onClick = "getElementById(\"page_bs2\").submit();" },
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
    attr = { id = "page_bs2" },
    module = 'wizard_private',
    view = 'page_bs3',
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
	archivecloud = archivecloud,
        sociallink = sociallink
    },
    content = function()
ui.container {
	attr = { class = "row" },
	content = function()
		ui.container {
			attr = { class = "col-md-12 well-blue" },
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
													attr = { class = "label label-accordion", role="tab", id="headingOne"},
													content = function()						                     
													ui.heading { 
														level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#issue_title", ariaexpanded="true", ariacontrols="issue_title"},  
														}
														ui.image { static = "png/arrow-down-icon.png" }					                                   
														ui.link {content = _ " PROBLEMA"}
														
												end
												}
											ui.container {
													attr = { id="issue_title", class="panel-collapse collapse in",  role="tabpanel", arialabelledby="headingOne"},
													content = function()
													ui.container {
															attr = { class="panel-body"},
															content = function()
														ui.container {
															attr = { class = "row " },
															content = function()
																	ui.container {
																		attr = { class = "col-md-12 text-left" },
																		content = function()
																		ui.tag { tag = "p", content = "Inserire il titolo del problema o solleva una questione" }
																		end
																	}
																	ui.container {
																		attr = { class = "col-md-12 text-left" },
																		content = function()
																		ui.tag { tag = "input", attr = { id = "issue_title", name = "issue_title", value = issue_title or "" }, content = "" }
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
			attr = { class = "col-md-12 well-blue" },
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
													attr = { class = "label label-accordion", role="tab", id="headingTwoa"},
													content = function()						                     
													ui.heading { 
														level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#issue_brief_description", ariaexpanded="true", ariacontrols="issue_brief_description"},  
														}	
														ui.image { static = "png/arrow-down-icon.png" }				                                   
														ui.link {content = _ " BREVE DESCRIZIONE"}
												end
												}
												ui.container {
														attr = { id="issue_brief_description", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingTwoa"},
														content = function()
														ui.container {
																attr = { class="panel-body"},
																content = function()
				                                        ui.container {
				                                            attr = { class = "row" },
				                                            content = function()
																					ui.container {
																						attr = { class = "col-md-12 text-left" },
																						content = function()
																						ui.tag { tag = "p", content = "Un abstract di max 20 parole max " }
																						end
																					}
					                                                ui.container {
					                                                    attr = { class = "col-md-12 issue_desc" },
					                                                    content = function()
					                                                         ui.tag {
					                                                             tag = "textarea",
					                                                             attr = {
					                                                                 id = "issue_brief_description",
					                                                                 name = "issue_brief_description",	
					                                                             },
					                                                             content = issue_brief_description or ""
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
			attr = { class = "col-md-12 well-blue" },
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
													attr = { class = "label label-accordion", role="tab", id="headingTwo"},
													content = function()						                     
													ui.heading { 
														level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#problem_description", ariaexpanded="true", ariacontrols="problem_description"},  
														}	
														ui.image { static = "png/arrow-down-icon.png" }				                                   
														ui.link {content = _ " DESCRIZIONE PROBLEMA"}
												end
												}
											ui.container {
													attr = { id="problem_description", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingTwo"},
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
																		ui.tag { tag = "p", content = "Descrivi Il problema a cui vuoi dare soluzione" }
																		end
																	}
                                                ui.container {
                                                    attr = { class = "col-md-12 issue_desc" },
                                                    content = function()
                                                        ui.tag {
                                                            tag = "textarea",
                                                            attr = { id = "problem_description", name = "problem_description", style = "height:250px;width:100%;resize:yes;" },
                                                            content = problem_description or ""
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
			attr = { class = "col-md-12 well-blue" },
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
													attr = { class = "label label-accordion", role="tab", id="headingThree"},
													content = function()						                     
													ui.heading { 
														level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#aim-description", ariaexpanded="true", ariacontrols="aim-description"},  
														}
														ui.image { static = "png/arrow-down-icon.png" }					                                   
														ui.link {content = _ " OBIETTIVO"}	
												end
												}
											ui.container {
													attr = { id="aim-description", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingThree"},
													content = function()
													ui.container {
															attr = { class="panel-body"},
															content = function()
                                        -- Descrizione dell' obiettivo
                                        ui.container {
                                            attr = { class = "row" },
                                            content = function()
															ui.container {
																attr = { class = "col-md-12 text-left" },
																content = function()
																ui.tag { tag = "p", content = "Descrivi vantaggi e benefici, in termini di impatto sociale, economico, ambientale" }
																end
															}                                          
                                                ui.container {
                                                    attr = { class = "col-md-12 issue_desc" },
                                                    content = function()
                                                        ui.tag {
                                                            tag = "textarea",
                                                            attr = { id = "aim_description", name = "aim_description", style = "height:250px;width:100%;resize:yes;" },
                                                            content = aim_description or ""
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
	end
}
ui.container {
	attr = { class = "row" },
	content = function()
		ui.container {
			attr = { class = "col-md-12 well-blue" },
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
	                           content = _ "CHIAVI DI RICERCA"
	                           }
				               end
			                  }
                                          
	                     ui.container {
	                         attr = { class = "col-md-12" },
	                         content = function()
	                             ui.tag {
	                                 tag = "input",
	                                 id = "issue_keywords",
	                                 attr = { id = "issue_keywords", name = "issue_keywords", class = "tagsinput", style = "resize:none" }
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
    attr = { class = "inline-block", id = "page_bs2_back" },
    module = 'wizard_private',
    view = 'page_bs1',
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
	archivecloud = archivecloud,
	sociallink = sociallink
    }
}
ui.script { static = "js/jquery.tagsinput.js" }
ui.script { script = "$('#issue_keywords').tagsInput({'height':'1%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
ui.script { script = "$('#technical_areas').tagsInput({'height':'1%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
