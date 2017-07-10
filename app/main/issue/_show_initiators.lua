local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        ui.heading { level = 3, attr = { class = "label label-warning-tbox spaceline" }, content = _ "General data" }
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
              attr = { class = "col-md-12 well-inside paper" },
              content = function()
                execute.view { module = "issue", view = "info_data", params = { issue = issue } }
              end
            }
          end
        }
      end
    }
  end
}