local issue = param.get("issue", "table")

ui.container {
  attr = { class = "col-md-12 well-blue spaceline" },
  content = function()
    ui.container {
      attr = { class = "row text-center" },
      content = function()
        ui.container {
          attr = { class = "label label-warning" },
          content = function()
            ui.heading {
              level = 1,
              content = function()
                ui.tag { content = _ "In risposta alla questione sollevata:" }
              end
            }
            ui.tag {
              content = function()
                ui.heading { level = 2, content = issue.title }
              end
            }
          end
        }
      end
    }

    ui.container {
      attr = { class = "row spaceline" },
      content = function()
        ui.container {
          attr = { class = "col-md-3 label label-info" },
          content = function()
            ui.heading {
              level = 3,
              attr = { class = "" },
              content = _ "Brief description"
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
            ui.container {
              attr = { class = "row" },
              content = function()
                ui.container {
                  attr = { class = "col-md-12 initiative_list_box" },
                  content = function()
                    ui.field.text {
                      value = issue.brief_description
                    }
                  end
                }
              end
            }
          end
        }
      end
    }

    ui.container {
      attr = { class = "row spaceline" },
      content = function()
        ui.container {
          attr = { class = "col-md-12" },
          content = function()
            ui.link {
              attr = { id = "issue_see_det_" .. issue.id, class = "col-md-4 col-md-offset-4 text-center" },
              module = "issue",
              view = "show",
              id = issue.id,
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