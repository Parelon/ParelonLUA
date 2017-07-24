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
                id = "headingInitiativeTitle"
              },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-8  col-sm-6 col-sm-offset-3 col-md-offset-2" },
                      content = function()
                        ui.heading { 
                          level = 3,
                          attr = {
                            datatoggle = "collapse",
                            class = "label label-accordion panel-title btn",
                            href = "#initiative_title",
                            ariaexpanded = "true",
                            ariacontrols = "initiative_title",
                            onclick = "collapseAll(); $('#initiative_title').collapse('show')"
                          },
                          content = function()
                              ui.container {
                                attr = { class = "row" },
                                content = function()
                                  ui.container {
                                    attr = { class = "col-md-10 col-xs-7" },
                                    content = function() 
                                      ui.image { static = "png/arrow-down-icon.png" }
                                      slot.put(_ "title")
                                     end
                                  }
                                  ui.container {
                                    attr = { class = "col-md-2 col-sm-3 col-xs-5" },
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
                      attr = { class = " col-md-2 text-center hidden-xs" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            onclick = "collapseAll(); $('#initiative_abstract').collapse('show');"
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
                id = "initiative_title",
                class = "panel-collapse collapse in",
                role = "tabpanel",
                arialabelledby = "headingInitiativeTitle"
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
                          attr = { class = "col-md-12" },
                          content = function()
                            ui.field.text {
                              name = "initiative_title",
                              value = param.get("initiative_title", atom.string) or ""
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