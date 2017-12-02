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
                      attr = { class = "col-md-2 col-sm-3 text-center hidden-xs" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            id = "initiativeAbstractBack",
                            class = "btn btn-primary btn-wizard hidden-xs",
                            style = "display: none;",
                            target = "_blank",
                            onclick = "collapseAll(); $('#initiative_title').collapse('show');"
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
                            href = "#initiative_abstract",
                            ariaexpanded = "true",
                            ariacontrols = "initiative_abstract",
                            onclick = "collapseAll(); $('#initiative_abstract').collapse('show')"
                          },
                          content = function()
                            ui.container {
                              attr = { class = "row" },
                              content = function()
                                ui.container {
                                  attr = { class = "col-md-10 col-sm-9 col-xs-7" },
                                  content = function() 
                                    ui.image { static = "png/arrow-down-icon.png" }
                                    slot.put(_ "abstract")
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
                      attr = { class = "col-md-2  col-sm-3 text-center hidden-xs" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            id = "initiativeAbstractNext",
                            class = "btn btn-primary btn-wizard",
                            style = "display: none;",
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
                          attr = { class = "col-md-12 init_brief" },
                          content = function()
                            ui.field.text {
                              multiline = true,
                              name = "initiative_brief_description",
                              attr = {
                              id = "initiativeAbstract",
                                style = "resize:none;",
                                maxlength = "300",
                                rows = "5",
                                onkeyup = "var length = $('#initiativeAbstract').val().length; var count = 300-length; $('#initiativeCount').text(count)"
                              },
                              label = function()
                                ui.tag { tag = "span", content = _"Give a very short description of 300 characters maximum" .. ": " }
                                ui.tag { tag = "span", attr = { id = "initiativeCount" }, content = "300" }
                                ui.tag { tag = "span", content = " " .. _"left" }
                              end,
                              value = param.get("initiative_brief_description", atom.string) or ""
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

ui.script { script = "$('#initiative_abstract').on('hide.bs.collapse', function() { $('#initiativeAbstractBack').hide(); $('#initiativeAbstractNext').hide(); });" }
ui.script { script = "$('#initiative_abstract').on('show.bs.collapse', function(){ $('#initiativeAbstractBack').show(); $('#initiativeAbstractNext').show(); });" }
