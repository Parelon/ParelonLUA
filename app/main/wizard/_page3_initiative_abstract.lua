local initiative_brief_description = param.get("initiative_brief_description")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well" },
      content = function()
        ui.container {
          attr = { class = "panel-group", id = "accordion", role = "tablist", ariamultiselectable = "true" },
          content = function()
            ui.container {
              attr = { class = "panel panel-default"},
              content = function()	  
                ui.container {
                  attr = { class = "label label-accordion", role="tab", id="headingTwo"},
                  content = function()						                     
                    ui.heading { 
                      level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#initiative_brief_description", ariaexpanded="true", ariacontrols="initiative_brief_description"},  
                    }	
                    ui.image { static = "png/arrow-down-icon.png" }			                                   
                    ui.link {content = _ " BREVE DESCRIZIONE"}
                  end
                }
                ui.container {
                  attr = { id="initiative_brief_description", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingTwo"},
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
                                ui.tag { tag = "p", content = "Descrivete in un abstract max 300 parole, i punti di forza, le criticità ed i benefici della vostra proposta." }
                              end
                            }	
                            ui.container {
                              attr = { class = "col-md-12 init_brief" },
                              content = function()
                                ui.tag {
                                  tag = "textarea",
                                  attr = { id = "initiative_brief_description", name = "initiative_brief_description", style = "height:250px; resize:none;" },
                                  content = initiative_brief_description or ""
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