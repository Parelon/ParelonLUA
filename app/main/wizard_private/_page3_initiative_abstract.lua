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
                id = "headingInitiativeAbstract"
              },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-2 text-center" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            class = "btn btn-primary btn-large",
                            target = "_blank",
                            onclick = "collapseAll(); $('#initiative_title').collapse('show');"
                          },
                          content = _"Back"
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-8 text-center" },
                      content = function()
                        ui.heading { 
                          level = 3,
                          attr = {
                            datatoggle = "collapse",
                            class = "label label-accordion panel-title btn",
                            href = "#initiative_abstract",
                            ariaexpanded = "true",
                            ariacontrols = "initiative_abstract",
                            onclick = "collapseAll(); $('#initiative_abstract').collapse('show')"
                          },
                          content = function()
                            ui.image { static = "png/arrow-down-icon.png" }
                            slot.put(_ "Abstract")
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
                            onclick = "collapseAll(); $('#initiative_draft').collapse('show');"
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
                id = "initiative_abstract",
                class = "panel-collapse collapse",
                role = "tabpanel",
                arialabelledby = "headingInitiativeAbstract"
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
                            ui.tag { span = "p", content = "Inserisci un abstract di massimo 300 caratteri: " }
                            ui.tag { span = "p", attr = { id = "count" }, content = "300" }
                            ui.tag { span = "p", content = " rimasti" }
                          end
                        }
                        ui.container {
                          attr = { class = "col-md-12 init_brief" },
                          content = function()
                            ui.tag {
                              tag = "textarea",
                              attr = {
                                id = "abstract",
                                name = "initiative_brief_description",
                                style = "resize:none;",
                                maxlength = "300",
                                onkeyup = "var count = 300-$('#abstract').val().length; $('#count').text(count)"
                              },
                              content = param.get("initiative_brief_description", atom.string) or ""
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
