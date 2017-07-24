ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well text-center" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-12 well-inside paper" },
                      content = function()
                        ui.heading { level = 2, content = _ "What you want to do?" }
                        ui.heading { level = 6, content = _ "Puoi leggere, valutare ed integrare le proposte redatte dai cittadini, presentare una tua proposta, votare quelle attualmente in discussione:" }
                      end
                    }
                  end
                }
                ui.container {
                  attr = { class = "row text-center spaceline-bottom" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-6 col-sm-6 col-xs-12 spaceline" },
                      content = function()
                        ui.link {
                          attr = { class = "btn btn-primary large_btn" },
                          module = "unit",
                          view = "list_areas",
                          params = { filter = "my_areas" },
                          content = function()
                            ui.heading { level = 3, content = _ "Homepage read new issues" }
                          end
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-6 col-sm-6 col-xs-12 spaceline" },
                      content = function()
                        ui.link {
                          attr = { class = "btn btn-primary large_btn" },
                          module = "unit",
                          view = "list_areas",
                          params = { create = true, filter = "my_areas" },
                          content = function()
                            ui.heading { level = 3, content = _ "Homepage write new issue" }
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