local issue_keywords = param.get("issue_keywords", atom.string)

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well-blue" },
      content = function()
        ui.container {
          attr = { class = "panel-group", id = "accordion", role = "tablist", ariamultiselectable = "true" },
          content = function()
            ui.container {
              attr = { class = "panel panel-default"},
              content = function()	  
                ui.container {
                  attr = { class = "label label-accordion", role="tab", id="headingFive"},
                  content = function()						                     
                    ui.heading { 
                      level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#problem_keywords", ariaexpanded="true", ariacontrols="problem_keywords"},  
                    }	
                    ui.image { static = "png/arrow-down-icon.png" }
                    ui.link {content = _ "PAROLE CHIAVE"}
                  end
                }
                ui.container {
                  attr = { id="problem_keywords", class="panel-collapse collapse", role ="tabpanel", arialabelledby="headingFive"},
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
                                  tag = "input",
                                  id = "issue_keywords",
                                  attr = {
                                    name = "issue_keywords",
                                    class = "tagsinput",
                                    style = "resize:none;",
                                    placeholder = _ "Add a keyword"
                                  },
                                  value = technical_areas or ""
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
  end
}
ui.script { static = "js/jquery.tagsinput.js" }
ui.script { script = "$('#issue_keywords').tagsInput({'height':'100%','width':'100%','maxChars' : 20});" }