local problem_description = param.get("problem_description", atom.string)

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
                id = "headingIssueDescription"
              },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-2  col-sm-3 text-center hidden-xs" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            onclick = "collapseAll(); $('#issue_abstract').collapse('show');"
                          },
                          content = _"Back"
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-8 col-sm-6 text-center" },
                      content = function()
                        ui.heading { 
                          level = 3,
                          attr = {
                            datatoggle = "collapse",
                            class = "label label-accordion panel-title btn",
                            href = "#issue_description",
                            ariaexpanded = "true",
                            ariacontrols = "issue_description",
                            onclick = "collapseAll(); $('#issue_description').collapse('show')"
                          },
                          content = function()
                              ui.container {
                                attr = { class = "row" },
                                content = function()
                                  ui.container {
                                    attr = { class = "col-md-10 col-xs-7" },
                                    content = function() 
                                      ui.image { static = "png/arrow-down-icon.png" }
                                      slot.put(_ "description")
                                     end
                                  }
                                  ui.container {
                                    attr = { class = "col-md-2 col-sm-3 text-right col-xs-5" },
                                    content = function() 
                                      ui.image { attr = { class = "icon-medium" },static = "svg/arrow-right.svg" }
                                    end
                                  }
                                end
                              }
                          end
                        }
                      end
                    }                    
                    ui.container {
                      attr = { class = "col-md-2 text-center hidden-xs" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            onclick = "collapseAll(); $('#issue_aim').collapse('show');"
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
                id = "issue_description",
                class = "panel-collapse collapse",
                role = "tabpanel",
                arialabelledby = "headingIssueDescription"
              },
              content = function()
                ui.container {
                  attr = { class="panel-body"},
                  content = function()
                    -- Descrizione del problema
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.container {
                          attr = { class = "col-md-12 text-left" },
                          content = function()
                            ui.tag { tag = "p", content = _ "Descrivi il problema a cui vuoi dare soluzione" }
                          end
                        }
                        ui.container {
                          attr = { class = "col-md-12 issue_desc" },
                          content = function()
                            ui.tag {
                              tag = "textarea",
                              attr = {
                                name = "problem_description",
                                style = "height:250px; resize:none;"
                              },
                              content = problem_description or ""
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