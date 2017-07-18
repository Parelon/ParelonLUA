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

ui.title(
  function()
    execute.view {
      module = "wizard",
      view = "_page_summary_title",
      params = { area = area }
    }
  end
)

ui.form {
  method = "post",
  attr = { id = "page_summary", class = "" },
  module = 'wizard',
  action = action,
  params = action_params,
  routing = {
    error = {
      mode = 'redirect',
      module = 'wizard',
      view = 'page_summary',
      params = action_params
    }
  },
  content = function()

    execute.view {
      module = "wizard",
      view = "_page_summary_policy",
      params = { area = area, policy_id = policy_id, disable = disable }
    }

    execute.view {
      module = "wizard",
      view = "_page_summary_issue_title",
      params = { issue_title = issue_title }
    }

    execute.view {
      module = "wizard",
      view = "_page_summary_issue_abstract",
      params = { issue_brief_description = issue_brief_description }
    }

    execute.view {
      module = "wizard",
      view = "_page_summary_issue_description",
      params = { problem_description = problem_description }
    }

    execute.view {
      module = "wizard",
      view = "_page_summary_issue_aim",
      params = { aim_description = aim_description }
    }

    execute.view {
      module = "wizard",
      view = "_page_summary_issue_keywords",
      params = { issue_keywords = issue_keywords }
    }

    execute.view {
      module = "wizard",
      view = "_page_summary_initiative_title",
      params = { initiative_title = initiative_title }
    }

    execute.view {
      module = "wizard",
      view = "_page_summary_initiative_abstract",
      params = { initiative_brief_description = initiative_brief_description }
    }

    execute.view {
      module = "wizard",
      view = "_page_summary_initiative_draft",
      params = { draft = draft }
    }

--    execute.view {
--      module = "wizard",
--      view = "_page_summary_initiative_media",
--      params = {
--        resource = resource,
--        sociallink = sociallink,
--        archivecloud = archivecloud,
--      }
--    }

    execute.view {
      module = "wizard",
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
                              attr = { id = "btnSaveIssue", class = "btn btn-primary large_btn fixclick", style = "cursor:pointer;", onclick = "getElementById('page_summary').submit()" },
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
  attr = { id = "page_summary_back" },
  module = 'wizard',
  view = back_view,
  params = back_params
}

ui.script { static = "js/jquery.tagsinput.js" }
ui.script { script = "$('#issue_keywords').tagsInput({'height':'0%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
ui.script { script = "$('#technical_areas').tagsInput({'height':'0%','width':'96%','defaultText':'" .. _ "Add a keyword" .. "','maxChars' : 20});" }
