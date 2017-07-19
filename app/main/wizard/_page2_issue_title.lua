local issue_title = param.get("issue_title", atom.string)

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()

        ui.container {
          attr = { class = "panel panel-default"},
          content = function()	 

            ui.container {
              attr = {
                class = "row",
                role = "tab",
                id = "headingIssueTitle"
              },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-8 col-md-offset-2 text-center" },
                      content = function()
                        ui.heading { 
                          level = 3,
                          attr = {
                            datatoggle = "collapse",
                            class = "label label-accordion panel-title btn",
                            href = "#issue_title",
                            ariaexpanded = "true",
                            ariacontrols = "issue_title",
                            onclick = "collapseAll(); $('#issue_title').collapse('show')"
                          },
                          content = function()
                            ui.image { static = "png/arrow-down-icon.png" }
                            slot.put(_ "Title")
                          end
                        }
                      end
                    }
                    
                    ui.container {
                      attr = { class = "col-md-2 text-center" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            class = "btn btn-primary btn-large",
                            target = "_blank",
                            onclick = "collapseAll(); $('#issue_abstract').collapse('show');"
                          },
                          content = _"Next"
                        }
                      end
                    }
                  end
                }
              end
            }

            ui.container {
              attr = {
                id = "issue_title",
                class = "panel-collapse collapse in",
                role = "tabpanel",
                arialabelledby = "headingIssueTitle"
              },
              content = function()
                ui.container {
                  attr = { class = "panel-body" },
                  content = function()
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.container {
                          attr = { class = "col-md-12 text-left" },
                          content = function()
                            ui.heading {
                              level = 3,
                              content = "Inserire il titolo del problema"
                            }
                          end
                        }
                        ui.container {
                          attr = { class = "col-md-12 text-left" },
                          content = function()
                            ui.field.text {
                              name = "issue_title",
                              value = issue_title or ""
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
  end
}