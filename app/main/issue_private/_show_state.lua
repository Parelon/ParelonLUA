local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row text-center" },
  content = function()
    ui.container {
      attr = { class = "well-inside" },
      content = function() 
            ui.container {
              content = function()
                execute.view { module = "issue_private", view = "info_box", params = { issue = issue } }
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
              attr = { class = "col-md-9 col-md-offset-3 col.xs-12 col-sm-12" },
              content = function()
                execute.view { module = "issue", view = "phasesbar", params = { state = issue.state } }
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