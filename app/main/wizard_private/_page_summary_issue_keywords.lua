local issue_keywords = param.get("issue_keywords", atom.string)

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well-blue" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 text-left paper" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function() 
                    ui.heading {
                      attr = { class = "label label-accordion" },
                      level = 3,
                      content = _ "CHIAVI DI RICERCA"
                    }
                  end
                }

                ui.container {
                  attr = { class = "col-md-12" },
                  content = function()
                    ui.tag {
                      tag = "textarea",
                      attr = {
                        id = "issue_keywords",
                        name = "issue_keywords",
                        class = "tagsinput",
                        style = "resize:none"
                      },
                      content = issue_keywords or ""
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
