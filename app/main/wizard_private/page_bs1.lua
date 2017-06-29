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
local resource = param.get("resource", atom.string) or ""
local archivecloud = param.get("archivecloud", atom.string)
local sociallink = param.get("sociallink", atom.string)

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

local area_policies = AllowedPolicy:get_policy_by_area_id(area_id)
local policies = {}

for i, k in ipairs(area_policies) do
    policies[#policies + 1] = { id = k.policy_id, name = Policy:by_id(k.policy_id).name }
end

ui.title(function()
    ui.container {
        attr = { class = "row" },
        content = function()
           ui.container {
               attr = { class = "col-md-3 col-sm-12 col-xs-12 text-center" },
               content = function()
                   ui.link {
                       attr = { id = "btnPreviuos", class = "btn btn-primary btn-back spaceline spaceline-bottom fixclick" },
                       module = "unit_private",
                       view = "show_ext_bs",
                       params = { unit_id = unit_id, create = true, filter = "my_areas" },
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
                attr = { class = "col-md-6 well-inside paper col-sm-12 col.xs.12" },
                content = function()
                    ui.container {
                        attr = { class = "row" },
                        content = function()
                            ui.container {
                                attr = { class = "col-md-12 text-center" },
                                content = function()
                                    ui.heading { level = 1, attr = { class = "uppercase label label-warning" }, content = _ "STEP 1: Imposta tempi di discussione" }
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
              ui.container {
                  attr = { class = "col-md-3 col-sm-12 col-xs-12 text-center" },
                  content = function()
                      ui.tag {
                          tag = "a",
                          attr = { id = "btnNext", class = "btn btn-primary btn-back spaceline spaceline-bottom", onClick = "getElementById(\"page_bs1\").submit();" },
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
    attr = { id = "page_bs1" },
    module = 'wizard_private',
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
	archivecloud = archivecloud,
	sociallink = sociallink
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
                                    attr = { class = "col-md-12" },
                                    content = function()
                                        ui.container {
                                            attr = { class = "row" },
                                            content = function()
                                                ui.container {
                                                    attr = { class = "col-md-12 text-center spaceline" },
                                                    content = function()
                                                        
                                                    end
                                                }
                                                ui.container {
                                                    attr = { class = "row" },
                                                    content = function()
                                                   
                                                        ui.container {
                                                            attr = { class = "col-md-12 spaceline well-inside paper text-center" },
                                                            content = function()
                                                            --valore selezionato
                                                                ui.field.hidden {
                                                                    html_name = "policy_id",
                                                                    attr = { id = "policy_id" },
                                                                    value = param.get("policy_id", atom.integer) or 0
                                                                }
																					 ui.heading { level = 2, attr = { class = "uppercase text-center" }, content = _ "How much time does your proposal need to be examined?" }
                                                                --radio-button group
                                                                ui.container {
                                                                    attr = { class = "row" },
                                                                    content = function()
                                                                        ui.field.parelon_group_radio {
                                                                            id = "policy_id",
                                                                            out_id = "policy_id",
                                                                            elements = policies,
                                                                            selected = policy_id,
                                                                            attr = { class = "parelon-checkbox spaceline2" },
                                                                            label_attr = { class = "parelon-label spaceline2" }
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
