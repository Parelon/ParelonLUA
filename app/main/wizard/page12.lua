slot.set_layout("custom")

local issue_id = param.get("issue_id", atom.integer) or 0
local draft_id = param.get("draft_id", atom.integer) or 0
local area = Area:by_id(param.get("area_id", atom.integer))
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
local proposer1 = param.get("proposer1", atom.boolean) or true
local proposer2 = param.get("proposer2", atom.boolean) or true
local proposer3 = param.get("proposer3", atom.boolean) or true
local resource = param.get("resource", atom.string)
local sociallink = param.get("sociallink", atom.string)
local archivecloud = param.get("archivecloud", atom.string)

-- trace di controllo sui valori dei parametri
trace.debug("issue_id: " .. tostring(issue_id))
trace.debug("draft_id: " .. tostring(draft_id))
trace.debug("area_id: " .. tostring(area.id))
trace.debug("policy_id: " .. tostring(policy_id))
trace.debug("issue_title: " .. issue_title)
trace.debug("issue_brief_description: " .. issue_brief_description)
trace.debug("issue_keywords: " .. (issue_keywords and issue_keywords or ""))
trace.debug("problem_description: " .. problem_description)
trace.debug("aim_description: " .. aim_description)
trace.debug("initiative_title: " .. initiative_title)
trace.debug("initiative_brief_description: " .. initiative_brief_description)
trace.debug("draft: " .. draft)
trace.debug("technical_areas: " .. (technical_areas and technical_areas or ""))
trace.debug("proposer1: " .. tostring(proposer1))
trace.debug("proposer2: " .. tostring(proposer2))
trace.debug("proposer3: " .. tostring(proposer3))
trace.debug("resource: " .. (resource and resource or "none"))
trace.debug("sociallink: " .. (sociallink and sociallink or "none"))
trace.debug("archivecloud: " .. (archivecloud and archivecloud or "none"))

local action = "create"
local action_params = {
  issue_id = issue_id,
  area_id = area.id,
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

local back_view = "page3"
local back_params = {
  issue_id = issue_id,
  area_id = area.id,
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

local disable = ""
local only_draft = ""
if issue_id ~= 0 then
  disable = " hidden"
end
if draft_id ~= 0 then
  disable = " hidden"
  only_draft = " hidden"
  action = "add_new_draft"
  action_params = {
    draft_id = draft_id,
    issue_id = issue_id,
    area_id = area.id,
    policy_id = policy_id,
    issue_title = issue_title,
    issue_brief_description = issue_brief_description,
    issue_keywords = issue_keywords,
    problem_description = problem_description,
    aim_description = aim_description,
    initiative_title = initiative_title,
    initiative_brief_description = initiative_brief_description,
    content = draft,
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
  back_view = "page3"
  back_params = {
    draft_id = draft_id,
    issue_id = issue_id,
    area_id = area.id,
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
end
trace.debug("disable: " .. disable .. "; only_draft: " .. only_draft)

ui.title(function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-3 text-left" },
          content = function()
            -- implementare "indietro"
            ui.tag {
              tag = "a",
              attr = {
                class = "btn btn-primary fixclick btn-back",
                onclick = "getElementById('page12_back').submit();"
              },
              content = function()
                ui.heading {
                  level = 3,
                  content = function()
                    ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
                    slot.put(_ "Back to previous page")
                  end
                }
              end
            }
          end
        }
        ui.container {
          attr = { class = "col-md-6 text-center label label-warning spaceline" },
          content = function()
            ui.heading { level = 3, content = _ "WIZARD HEADER END" }
          end
        }
        ui.container {
          attr = { class = "col-md-3 spaceline text-right " },
          content = function()
            ui.field.popover {
              attr = {
                dataplacement = "left",
                datahtml = "true";
                datatitle = _ "Insert Technical Areas",
                datacontent = _ "WIZARD END",
                datahtml = "true",
                class = "text-center"
              },
              content = function()
                ui.container {
                  attr = { class = "icon" },
                  content = function()
                    ui.image { attr = { class = "icon-medium" },static = "png/tutor.png" }
                    --								    ui.heading{level=3 , content= _"What you want to do?"}
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
          attr = { class = "col-md-12 text-center well-inside paper" },
          content = function()
            ui.heading {
              level = 2,
              attr = { class = "spaceline" },
              content = function()
                slot.put(_ "Unit" .. ": " .. "<strong>" .. area.unit.name .. "</strong>")
              end
            }
            ui.heading {
              level = 2,
              content = function()
                slot.put(_ "Area" .. ": " .. "<strong>" .. area.name .. "</strong>")
              end
            }
          end
        }
      end
    }

  end)

ui.form {
  method = "post",
  attr = { id = "page12", class = "" },
  module = 'wizard',
  action = action,
  params = action_params,
  routing = {
    error = {
      mode = 'redirect',
      module = 'wizard',
      view = 'page12',
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
                              attr = { id = "issue_keywords", name = "issue_keywords", class = "tagsinput", style = "resize:none" },
                              content = issue_keywords or ""
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
                              attr = { id = "technical_areas", name = "technical_areas", class = "tagsinput", style = "resize:none;" },
                              content = technical_areas or ""
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
                              module = "wizard",
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
  attr = { id = "page12_back" },
  module = 'wizard',
  view = back_view,
  params = back_params
}

ui.script { static = "js/jquery.tagsinput.js" }
ui.script { script = "$('#issue_keywords').tagsInput({'height':'0%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
ui.script { script = "$('#technical_areas').tagsInput({'height':'0%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
