local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "well-inside" },
      content = function()
            ui.container {
              content = function()
                execute.view { module = "issue", view = "info_box", params = { issue = issue } }
              end
            }  
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-9 col-md-offset-2 col.xs-12 col-sm-12" },
              content = function()
                execute.view { module = "issue", view = "phasesbar", params = { state = issue.state } }
              end
            }
          end
        }                            
      end
    }
  end
}