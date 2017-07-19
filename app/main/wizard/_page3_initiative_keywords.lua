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
                id = "headingInitiativeKeywords"
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
                            onclick = "collapseAll(); $('#initiative_draft').collapse('show');"
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
                            href = "#initiative_keywords",
                            ariaexpanded = "true",
                            ariacontrols = "initiative_keywords",
                            onclick = "collapseAll(); $('#initiative_keywords').collapse('show')"
                          },
                          content = function()
                            ui.image { static = "png/arrow-down-icon.png" }
                            slot.put(_ "Keywords")
                          end
                        }
                      end
                    }

--                    ui.container {
--                      attr = { class = "col-md-2 text-center" },
--                      content = function()
--                        ui.tag {
--                          tag = "a",
--                          attr = {
--                            class = "btn btn-primary btn-large",
--                            target = "_blank",
--                            onclick = "collapseAll(); $('#initiative_keywords').collapse('show');"
--                          },
--                          content = _"Next"
--                        }
--                      end
--                    }
                  end
                }
              end
            }

            ui.container {
              attr = {
                id = "initiative_keywords",
                class = "panel-collapse collapse",
                role = "tabpanel",
                arialabelledby = "headingInitiativeKeywords"
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
                            ui.tag { tag = "p", content = _"Suggerisci competenze in materia tecnica, sociale, finanziaria, impatto ambientale e pianificazione delle risorse, per es: Psicologo, Commercialista, economista, muratore. " }
                          end
                        }
                        ui.container {
                          attr = { class = "col-md-12" },
                          content = function()
                            ui.tag {
                              tag = "textarea",
                              attr = {
                                id = "technical_areas",
                                name = "technical_areas",
                                class = "tagsinput",
                                style = "resize:none;",
                                placeholder = _ "Add a keyword"
                              },
                              content = param.get("technical_areas", atom.string) or ""
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

ui.script { static = "js/jquery.tagsinput.js" }
ui.script { script = "$('#technical_areas').tagsInput({'maxChars' : 20});" }