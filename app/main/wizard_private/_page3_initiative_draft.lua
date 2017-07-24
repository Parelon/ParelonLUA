ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12"},
      content = function()
        ui.container {
          attr = { class = "panel panel-default"},
          content = function()	  

            ui.container {
              attr = {
                class = "row",
                role = "tab",
                id = "headingInitiativeDraft"
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
                            class = "btn btn-primary btn-wizard hidden-xs",
                            target = "_blank",
                            onclick = "collapseAll(); $('#initiative_abstract').collapse('show');"
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
                            href = "#initiative_draft",
                            ariaexpanded = "true",
                            ariacontrols = "initiative_draft",
                            onclick = "collapseAll(); $('#initiative_draft').collapse('show')"
                          },
                          content = function()
                              ui.container {
                                attr = { class = "row" },
                                content = function()
                                  ui.container {
                                    attr = { class = "col-md-10 col-sm-9 col-xs-7" },
                                    content = function() 
                                      ui.image { static = "png/arrow-down-icon.png" }
                                      slot.put(_ "Draft")
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
                      attr = { class = "col-md-2 text-center" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            class = "btn btn-primary btn-wizard hidden-xs",
                            target = "_blank",
                            onclick = "collapseAll(); $('#initiative_keywords').collapse('show');"
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
                id = "initiative_draft",
                class = "panel-collapse collapse",
                role = "tabpanel",
                arialabelledby = "headingInitiativeDraft"
              },
              content = function()
                ui.container {
                  attr = { class="panel-body"},
                  content = function()
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.container {
                          attr = { class = "col-md-10 text-left" },
                          content = function()
                            ui.tag { tag = "p", content = "Gli articoli i commi ed i riferimenti normativi della Tua proposta di soluzione al problema o questione sollevata" }
                          end
                        }

                        ui.container {
                          attr = { class = "col-md-12 issue_desc" },
                          content = function()
                            ui.tag {
                              tag = "textarea",
                              attr = {
                                name = "draft",
                                rows = "10",
                                style = "resize:none;"
                                },
                              content = param.get("draft", atom.string) or ""
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