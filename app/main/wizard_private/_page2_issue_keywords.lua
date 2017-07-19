local issue_keywords = param.get("issue_keywords", atom.string)

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
                id = "headingIssueKeywords"
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
                            onclick = "collapseAll(); $('#issue_aim').collapse('show');"
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
                            href = "#issue_keywords",
                            ariaexpanded = "true",
                            ariacontrols = "issue_keywords",
                            onclick = "collapseAll(); $('#issue_keywords').collapse('show')"
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
--                            onclick = "collapseAll(); $('#issue_keywords').collapse('show');"
--                          },
--                          content = _"Save"
--                        }
--                      end
--                    }
                  end
                }
              end
            }

            ui.container {
              attr = {
                id = "issue_keywords",
                class = "panel-collapse collapse",
                role = "tabpanel",
                arialabelledby = "headingIssueKeywords"
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
                            ui.tag { tag = "p", content = _ "Usa delle parole chiave per descrivere il tuo problema" }
                          end
                        }
                        ui.container {
                          attr = { class = "col-md-12" },
                          content = function()
                            ui.tag {
                              tag = "textarea",
                              attr = {
                                id = "text",
                                name = "issue_keywords",
                                class = "tagsinput",
                                style = "resize:none;",
                                placeholder = _ "Add a keyword"
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
      end
    }
  end
}
ui.script { static = "js/jquery.tagsinput.js" }
ui.script { script = "$('#text').tagsInput({'height':'100%','width':'100%','maxChars' : 20});" }