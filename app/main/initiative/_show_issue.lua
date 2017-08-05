local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row spaceline spaceline-bottom" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well-blue" },
      content = function()
        ui.container {
          attr = { class = "row text-center" },
          content = function()
            ui.container {
              attr = { class = "label label-warning" },
              content = function()
                ui.heading {
                  level = 4,
                  attr = { class = "col-md-4" },
                  content = _ ("Solution to the issue P#{id}:", {id = issue.id})
                }
                ui.heading { level = 1, attr = { class = "text-center" }, content = issue.title }
              end
            }
          end
        }
        ui.container {
          attr = { class = "row spaceline text-center paper" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 h6 spaceline spaceline-bottom" },
              content = issue.brief_description
            }
          end
        }
        ui.container {
          attr = { class = "row spaceline" },
          content = function()
            ui.container {
              attr = { class = "col-md-12" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-4 col-md-offset-4 text-center" },
                      content = function()
                        ui.link {
                          attr = { id = "issue_see_det_" .. issue.id, class = "btn btn-primary large_btn h3" },
                          module = "issue",
                          view = "show",
                          id = issue.id,
                          content = _ "See details" 
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