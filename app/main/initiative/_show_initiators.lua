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
          slot.put(" ")
          if app.session:has_access("all_pseudonymous") then
            ui.link {
              content = function()
                execute.view {
                  module = "member_image",
                  view = "_show",
                  params = {
                    member = initiator,
                    image_type = "avatar",
                    show_dummy = true,
                    class = "micro_avatar",
                    popup_text = text
                  }
                }
              end,
              module = "member",
              view = "show",
              id = initiator.id
            }
            slot.put(" ")
          end
          ui.link {
            text = initiator.name,
            module = "member",
            view = "show",
            id = initiator.id
          }
          if not initiator.accepted then
            ui.tag { attr = { title = _ "Not accepted yet" }, content = "?" }
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