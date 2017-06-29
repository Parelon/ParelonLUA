slot.set_layout("custom")

local issue_id = param.get("issue_id", atom.integer) or 0
local draft_id = param.get("draft_id", atom.integer) or 0
local area_id = param.get("area_id", atom.integer)
local unit_id = param.get("unit_id", atom.integer)
local area_name = param.get("area_name", atom.string)
local unit_name = param.get("unit_name", atom.string)

-- trace di controllo sui valori dei parametri
trace.debug("issue_id: " .. tostring(issue_id))
trace.debug("draft_id: " .. tostring(draft_id))
trace.debug("area_id: " .. tostring(area_id))
trace.debug("area_name: " .. area_name)
trace.debug("unit_id: " .. tostring(unit_id))
trace.debug("unit_name: " .. tostring(unit_name))

local action = "create"
local action_params = {
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
    formatting_engine = "rocketwiki",
    resource = resource,
    sociallink = sociallink,
    archivecloud = archivecloud
}

--set the back parameters
local view_back = "show_ext_bs"
local module_back = "unit_private"
local params_back = { unit_id = unit_id, create = true, filter = "my_areas" }

local disable = ""
local only_draft = ""
if issue_id ~= 0 then
    disable = " hidden"
end
if draft_id ~= 0 then
    disable = " hidden"
    only_draft = " hidden"
end
trace.debug("disable: " .. disable .. "; only_draft: " .. only_draft)

ui.title(function()
    ui.container {
        attr = { class = "row spaceline" },
        content = function()
            ui.container {
                attr = { class = "col-md-12" },
                content = function()
                    ui.container {
                        attr = { class = "row" },
                        content = function()
                            ui.container {
                                attr = { class = "col-md-3" },
                                content = function()
                                    ui.link {
                                        attr = { id = "btnPreviuos", class = "col-md-9 btn btn-primary large_btn fixclick" },
                                        module = module_back,
                                        view = view_back,
                                        params = params_back,
                                        id = app.session.member.unit_id,
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
                                attr = { class = "col-md-8" },
                                content = function()
                                    ui.heading { level = 1, content = _ "WIZARD SHORTCUT HEADER" }
                                    ui.heading { level = 3, content = _ "WIZARD SHORTCUT" }
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
                        attr = { class = "col-md-12 text-center" },
                        content = function()
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
                end
            }
        end
    }
end)

ui.form {
  method = "post",
  attr = { id = "page_bs12", class = "" },
  module = 'wizard_private',
  action = action,
  params = action_params,
  routing = {
    error = {
      mode = 'redirect',
      module = 'wizard_private',
      view = 'shortcut',
      params = action_params
    }
  },
  content = function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-12 well" .. disable },
          content = function()
            ui.container {
              attr = { class = "col-md-12 text-center well-inside paper" },
              content = function()
                --Selezione policy
                ui.container {
                  attr = { class = "formSelect" },
                  content = function()
                    local area_policies = AllowedPolicy:get_policy_by_area_id(area_id)
                    local policies = {}

                    for i, k in ipairs(area_policies) do
                      policies[#policies + 1] = { id = k.policy_id, name = Policy:by_id(k.policy_id).name }
                    end

                    ui.container {
                      attr = { class = "formSelect" },
                      content = function()
                        ui.container {
                          attr = { class = "row spaceline1 spaceline-bottom " },
                          content = function()
                            ui.container {
                              attr = { class = "col-md-12" },
                              content = function()
                                ui.container {
                                  attr = { class = "inline-block" },
                                  content = function()
                                    ui.container {
                                      attr = { class = "text-left" },
                                      content = function()
                                        ui.container {
                                          attr = { class = "row" },
                                          content = function()
                                            --policy selezionata cambiata
                                            ui.field.hidden {
                                              html_name = "policy_id",
                                              attr = { id = "policy_id" },
                                              value = param.get("policy_id", atom.integer) or 0
                                            }
                                            --radio-button group
                                            ui.field.parelon_group_radio {
                                              id = "policy_id",
                                              out_id = "policy_id",
                                              elements = policies,
                                              selected = policy_id,
                                              attr = { class = "parelon-checkbox spaceline3 " },
                                              label_attr = { class = "parelon-label spaceline3 " }
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
        -- Box questione
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
                                    ui.link {content = _ " PROBLEMA O QUESTIONE"}
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
                                    ui.link {content = _ " DESCRIZIONE DEL PROBLEMA"}
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
                                              attr = { class = "col-md-12 issue_desc" },
                                              content = function()
                                                ui.tag {
                                                  tag = "textarea",
                                                  attr = { id = "aim_description", name = "aim_description", style = "height:250px;width:100%;resize:yes;" },
                                                  content = aim_description  or ""
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


        -- Box proposta

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
                                                  value = initiative_title
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
                                                ui.tag { tag = "p", content = "Digitate parole o espressioni che meglio etichettano gli ambiti di applicazione e di contenuti della vostra proposta, separandole da virgola." }
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
                                        -- Descrizione dell' obiettivo
                                        ui.container {
                                          attr = { class = "row" },
                                          content = function()
                                            ui.container {
                                              attr = { class = "col-md-12 text-left" },
                                              content = function()
                                                ui.tag { tag = "p", content = "Digitate parole o espressioni che meglio etichettano gli ambiti di applicazione e di contenuti della vostra proposta, separandole da virgola." }
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
                                              value = resource
                                            }
                                            ui.heading { level = 4, attr = { class = "col-md-12" }, content = "Inserire il link ad una cartella cloud pubblica o a documenti" }
                                            ui.field.text {
                                              attr = { id = "archivecloud", class = "col-md-5" },
                                              name = "archivecloud",
                                              value = archivecloud
                                            }	
                                            ui.heading { level = 4, attr = { class = "col-md-12" }, content = "Inserire il link ad una pagina social, forum, meetup o blog di discussione" }
                                            ui.field.text {
                                              attr = { id = "sociallink", class = "col-md-5" },
                                              name = "sociallink",
                                              value = sociallink
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
                          attr = { class = "col-md-12" },
                          content = function()
                            ui.tag {
                              tag = "input",
                              id = "technical_areas",
                              attr = { id = "technical_areas", name = "technical_areas", class = "tagsinput", style = "resize:none;" }
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

    -- Pulsanti
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-3 text-center", style = "width:100%;" },
          content = function()
            ui.container {
              attr = { id = "pulsanti", style = "position: relative;" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.container {
                          attr = { class = "col-md-4 text-center" },
                          content = function()
                            --pulsante anteprima
                            ui.container {
                              attr = { id = "btnAnteprima", class = "btn btn-primary large_btn fixclick", disabled = "true", style = "opacity:0.5;" },
                              module = "wizard",
                              view = "anteprima",
                              content = function()
                                ui.heading {
                                  level = 3,
                                  attr = { class = "fittext_btn_wiz" },
                                  content = function()
                                    ui.container {
                                      attr = { class = "row" },
                                      content = function()
                                        ui.container {
                                          attr = { class = "col-md-12" },
                                          content = function()
                                            slot.put(_ "Show preview")
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
                        --pulsante "Save preview"
                        ui.container {
                          attr = { class = "col-md-4 text-center" },
                          content = function()
                            ui.container {
                              attr = { id = "btnSalvaPreview", class = "btn btn-primary large_btn fixclick", disabled = "true", style = "opacity:0.5;" },
                              module = "wizard_private",
                              view = "_save_preview",
                              content = function()
                                ui.heading {
                                  level = 3,
                                  attr = { class = "fittext_btn_wiz" },
                                  content = function()
                                    ui.container {
                                      attr = { class = "row" },
                                      content = function()
                                        ui.container {
                                          attr = { class = "col-md-12" },
                                          content = function()
                                            slot.put(_ "Save preview")
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
                        --pulsante Save
                        ui.container {
                          attr = { class = "col-md-4 text-center" },
                          content = function()
                            ui.tag {
                              tag = "a",
                              attr = { id = "btnSaveIssue", class = "btn btn-primary large_btn fixclick", style = "cursor:pointer;", onclick = "getElementById(\"page_bs12\").submit()" },
                              content = function()
                                ui.heading {
                                  level = 3,
                                  attr = { class = "fittext_btn_wiz" },
                                  content = function()
                                    ui.container {
                                      attr = { class = "row" },
                                      content = function()
                                        ui.container {
                                          attr = { class = "col-md-12" },
                                          content = function()
                                            slot.put(_ "Save issue")
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

--	ROUTING BACK

ui.form {
  method = "post",
  attr = { id = "page_bs12_back" },
  module = 'wizard_private',
  view = back_view,
  params = back_params
}

ui.script { static = "js/jquery.tagsinput.js" }
ui.script { script = "$('#issue_keywords').tagsInput({'height':'0%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
ui.script { script = "$('#technical_areas').tagsInput({'height':'0%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
