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
                      attr = { class = "col-md-2 col-sm-3 text-center hidden-xs" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            id = "initiativeKeywordsBack",
                            class = "btn btn-primary btn-wizard hidden-xs",
                            style = "display: none;",
                            target = "_blank",
                            onclick = "collapseAll(); $('#initiative_draft').collapse('show');"
                          },
                          content = _"Back"
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-8 col-xs-6" },
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
--                            id = "initiativeKeywordsNext",
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
                          attr = { class = "col-md-12" },
                          content = function()
                            ui.field.text {
                              multiline = true,
                              label = _"Give some keywords that describe area of expertise needed to evalueate this solution" .. ":",
                              name = "technical_areas",
                              attr = {
                                id = "initiativeKeywords",
                                class = "tagsinput",
                                style = "resize:none;",
                                placeholder = _ "Add a keyword"
                              },
                              value = param.get("technical_areas", atom.string) or ""
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
ui.script { script = "$('#initiativeKeywords').tagsInput({'maxChars' : 20});" }
ui.script { script = "$('#initiative_keywords').on('hide.bs.collapse', function() { $('#initiativeKeywordsBack').hide(); $('#initiativeKeywordsNext').hide(); });" }
ui.script { script = "$('#initiative_keywords').on('show.bs.collapse', function(){ $('#initiativeKeywordsBack').show(); $('#initiativeKeywordsNext').show(); });" }