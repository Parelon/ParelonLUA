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
local view_back = "show"
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
    execute.view {
      module = "wizard_private",
      view = "_page_summary_policy",
      params = { area = area, policy_id = policy_id, disable = disable }
    }

    execute.view {
      module = "wizard_private",
      view = "_page_summary_issue_title",
      params = { issue_title = issue_title }
    }

    execute.view {
      module = "wizard_private",
      view = "_page_summary_issue_abstract",
      params = { issue_brief_description = issue_brief_description }
    }

    execute.view {
      module = "wizard_private",
      view = "_page_summary_issue_description",
      params = { problem_description = problem_description }
    }

    execute.view {
      module = "wizard_private",
      view = "_page_summary_issue_aim",
      params = { aim_description = aim_description }
    }

    execute.view {
      module = "wizard_private",
      view = "_page_summary_issue_keywords",
      params = { issue_keywords = issue_keywords }
    }

    execute.view {
      module = "wizard_private",
      view = "_page_summary_initiative_title",
      params = { initiative_title = initiative_title }
    }

    execute.view {
      module = "wizard_private",
      view = "_page_summary_initiative_abstract",
      params = { initiative_brief_description = initiative_brief_description }
    }

    execute.view {
      module = "wizard_private",
      view = "_page_summary_initiative_draft",
      params = { draft = draft }
    }

--    execute.view {
--      module = "wizard_private",
--      view = "_page_summary_initiative_media",
--      params = {
--        resource = resource,
--        sociallink = sociallink,
--        archivecloud = archivecloud,
--      }
--    }

    execute.view {
      module = "wizard_private",
      view = "_page_summary_technical_keywords",
      params = { technical_areas = technical_areas }
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
                              module = "wizard_private",
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
