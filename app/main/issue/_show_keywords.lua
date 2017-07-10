local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        ui.heading {
          level = 3,
          attr = { class = "label label-warning-tbox spaceline" },
          content = function()
            ui.tag { content = _ "Keywords" }
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
      attr = { class = "col-md-12 well-inside paper" },
      content = function()
--        ui.container{ attr = { class = "row"}, content = function()
--            ui.container{ attr = { class = "col-md-12"}, content = function()
--                ui.tag{ content = _"(Press a keyword to see all issues created until today discussing that topic)" }
--              end
--            }
--          end
--        }
        ui.container {
          attr = { class = "row" },
          content = function()

            ui.container {
              attr = { class = "col-md-12" },
              content = function()
                local keywords = Keyword:by_issue_id(issue.id)
                if keywords and #keywords > 0 then
                  for k = 1, #keywords do
                    if not keywords[k].technical_keyword then
                      ui.tag {
                        tag = "span",
                        attr = { class = "btn btn-danger btn-small filter_btn nowrap" },
                        content = function()
                          ui.heading { level = 5, attr = { class = "uppercase" }, content = keywords[k].name }
                        end
                      }
                    end
                  end
                end
              
              end
            }
          end
        }
      end
    }
  end
}