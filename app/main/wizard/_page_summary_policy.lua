local area = param.get("area", "table")
local policy_id = param.get("policy_id", atom.integer)
local disable = param.get("disable", atom.string)

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well" .. disable },
      content = function()
        ui.container {
          attr = { class = "col-md-12 text-center paper" },
          content = function()
            --Selezione policy
            ui.container {
              attr = { class = "formSelect" },
              content = function()
                local area_policies = AllowedPolicy:get_policy_by_area_id(area.id)
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
  end
}