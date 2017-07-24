local draft = param.get("draft", atom.string)
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
                          attr = { class = "label label-accordion", role="tab", id="headingSeven"},
                          content = function()						                     
                            ui.heading { 
                              level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#draft", ariaexpanded="true", ariacontrols="draft"},  
                            }
                            ui.image { static = "png/arrow-down-icon.png" }				                                   
                            ui.link {content = _ " TESTO DELLA PROPOSTA"}
                          end
                        }
                        ui.container {
                          attr = { id="draft", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingSeven"},
                          content = function()
                            ui.container {
                              attr = { class="panel-body"},
                              content = function()
                                -- Descrizione dell' obiettivo
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
                                      attr = { class = "col-md-12 issue_desc" },
                                      content = function()
                                        ui.tag {
                                          tag = "textarea",
                                          attr = { id = "draft", name = "draft", style = "height:250px;width:100%;resize:yes;" },
                                          content = draft or ""
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