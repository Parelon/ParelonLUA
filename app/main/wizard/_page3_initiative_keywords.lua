local technical_areas = param.get("technical_areas")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well" },
      content = function()
        ui.container {
          attr = { class = "panel-group", id = "accordion", role = "tablist", ariamultiselectable = "false" },
          content = function()
            ui.container {
              attr = { class = "panel panel-default"},
              content = function()	  
                ui.container {
                  attr = { class = "label label-accordion", role="tab", id="headingFive"},
                  content = function()						                     
                    ui.heading { 
                      level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#technical_areas-panel", ariaexpanded="true", ariacontrols="technical_areas-panel"},  
                    }	
                    ui.image { static = "png/arrow-down-icon.png" }
                    ui.link {content = _ "PAROLE CHIAVE"}
                  end
                }
                ui.container {
                  attr = { id="technical_areas-panel", class="panel-collapse collapse", role ="tabpanel", arialabelledby="headingFive"},
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
                                  tag = "input",
                                  id = "technical_areas",
                                  attr = {
                                    name = "technical_areas",
                                    class = "tagsinput",
                                    style = "resize:none;",
                                    placeholder = _ "Add a keyword" },
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
ui.script { script = "$('#technical_areas').tagsInput({'maxChars' : 20});" }