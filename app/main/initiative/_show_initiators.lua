local initiative = param.get("initiative", "table")
local initiators = param.get("initiators", "table")

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-7" },
      content = function()
        ui.heading {
          level = 3,
          attr = { class = "label label-warning-tbox" },
          content = _ "Authors"
        }
      end
    }
  end
}
ui.container {
  attr = { class = "col-md-12 well-inside paper" },
  content = function()
    if #initiators > 0 then
      if #initiators > 1 then
        for i, initiator in ipairs(initiators) do
          if app.session:has_access("all_pseudonymous") then
            execute.view {
              module = "member",
              view = "_show_thumb",
              params = {
                member = initiator,
                initiative = initiative,
                issue = initiative.issue,
                initiator = initiator
              }
            }
            
          end
        end
      else
        execute.view { module = "member", view = "_info_data", id = initiators[1].id, params = { module = "initiative", view = "show", content_id = initiative.id } }
      end
--        ui.container {
--          attr = { class = "row spaceline" },
--          content = function()
--            ui.container {
--              attr = { class = "row" },
--              content = function()
--                ui.container {
--                  attr = { class = "col-md-12" },
--                  content = function()
--                    ui.tag { tag = "hr" }
--                  end
--                }
--              end
--            }
--          end
--        }
    else
      ui.heading { level = 6, content = _ "No author for this issue" }
    end
  end
}