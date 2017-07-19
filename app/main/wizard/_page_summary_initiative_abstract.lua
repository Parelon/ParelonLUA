local initiative_brief_description = param.get("initiative_brief_description", atom.string)

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 paper"},
              content = function()
                ui.container {
                  attr = { class = "panel-group", id = "accordion", role = "tablist", ariamultiselectable = "true" },
                  content = function()
                    ui.container {
                      attr = { class = "panel panel-default"},
                      content = function()	  
                        ui.container {
                          attr = { class = "label label-accordion", role="tab", id="headingSix"},
                          content = function()						                     
                            ui.heading { 
                              level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#initiative_brief_description", ariaexpanded="true", ariacontrols="initiative_brief_description"},  
                            }	
                            ui.image { static = "png/arrow-down-icon.png" }			                                   
                            ui.link {content = _ " BREVE DESCRIZIONE"}
                          end
                        }
                        ui.container {
                          attr = { id="initiative_brief_description", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingSix"},
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
                                        ui.tag { tag = "p", content = "Digitate parole o espressioni che meglio etichettano gli ambiti di applicazione e di contenuti della vostra proposta, separandole da virgola." }
                                      end
                                    }	
                                    ui.container {
                                      attr = { class = "col-md-12 init_brief" },
                                      content = function()
                                        ui.tag {
                                          tag = "textarea",
                                          attr = { id = "initiative_brief_description", name = "initiative_brief_description", style = "height:250px;width:100%;resize:yes;" },
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
      end
    }
  end
}