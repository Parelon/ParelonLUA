local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row text-center" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well-inside paper" },
      content = function() 
        ui.container {
          attr = { class = "row text-center" },
          content = function()
            ui.container {
              content = function()
                execute.view { module = "issue", view = "info_box", params = { issue = issue } }
              end
            }
          end
        }
--        ui.container {
--          attr = { class = "row spaceline5 hidden-sm hidden-xs" },
--          content = function()
--          end
--        }
--        ui.container {
--          attr = { class = "row spaceline2 hidden-lg hidden-md" },
--          content = function()
--          end
--        }
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-1 hidden-xs hidden-sm" },
              content = function()
                ui.image { static = "spacer.png" }
              end
            }
            ui.container {
              attr = { class = "col-md-9 col.xs-12 col-sm-12" },
              content = function()
                execute.view { module = "issue", view = "phasesbar", params = { state = issue.state } }
              end
            }
            ui.container {
              attr = { class = "col-md-2 hidden-xs hidden-sm" },
              content = function()
                ui.image { static = "spacer.png" }
              end
            }
          end
        }
--        ui.container {
--          attr = { class = "row spaceline5 hidden-md hidden-lg" },
--          content = function()

--          end
--        }
--        ui.container {
--          attr = { class = "row spaceline2 hidden-lg hidden-md" },
--          content = function()

--          end
--        }
      end
    }
  end
}