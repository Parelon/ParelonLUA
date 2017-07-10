local issue = param.get("issue", "table")

ui.container {
  attr = { class = "col-md-12 well-blue" },
  content = function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-12 text-center" },
          content = function()
            ui.link {
              content = function()
                ui.heading { attr = { class = "label label-warning" },level = 1, content = "Questione o Problema N° " .. issue.id .. " - " .. (issue.title or _ "No title for this issue") }
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
          attr = { class = "row spaceline hidden-xs hidden-sm" },
          content = function()
            ui.container {
              attr = { class = "col-md-7" },
              content = function()
                ui.heading { level = 3, attr = { class = "label label-warning-tbox" }, content = _"Breve descrizione" }
              end
            }

            ui.container {
              attr = { class = "row" },
              content = function()
                ui.tag { tag = "p", attr = { class = "col-md-12 well-inside paper" }, content = issue.brief_description or _ "No description available" }
              end
            }
          end
        }
        
        ui.container {
          attr = { class = "col-md-12" },
          content = function()
            local content
            content = #issue.initiatives .. _ " INITIATIVES TO RESOLVE THE ISSUE"
            ui.heading { level = 3, attr = { class = "label label-warning-tbox" }, content = content }
          end
        }
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 well-inside paper" },
              content = function()
                local initiatives_selector = issue:get_reference_selector("initiatives")
                local highlight_string = param.get("highlight_string")
                if highlight_string then
                  initiatives_selector:add_field({ '"highlight"("initiative"."name", ?)', highlight_string }, "name_highlighted")
                end
                execute.view {
                  module = "assembly",
                  view = "_initiative_box",
                  params = { issue = issue }
                }
              end
            }
          end
        }
        
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.link {
              attr = { id = "issue_see_det_" .. issue.id, class = "col-md-12 text-center" },
              module = "issue",
              view = "show",
              id = issue.id,
              params = {
                view = "area",
                state = state,
                orderby = orderby,
                desc = desc,
                interest = interest,
                scope = scope,
                view = view,
                ftl_btns = ftl_btns
              },
              content = function()
                ui.heading { level = 3, attr = { class = "btn btn-primary large_btn" }, content = _ "SEE DETAILS" }
              end
            }
          end
        }
      end
    }   
  end
}
ui.container {
  attr = { class = "row spaceline2" },
  content = function()
    ui.tag { tag = "hr", attr = { class = "" } }
  end
}