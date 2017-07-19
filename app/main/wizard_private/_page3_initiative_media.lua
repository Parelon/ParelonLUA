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
                  attr = { class = "label label-accordion", role="tab", id="headingFour"},
                  content = function()						                     
                    ui.heading { 
                      level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#resource", ariaexpanded="true", ariacontrols="title"},  
                    }
                    ui.image { static = "png/arrow-down-icon.png" }					                                   
                    ui.link {content = _ " DOCUMENTAZIONE ALLEGATA E MEDIA"}
                  end
                }
                ui.container {
                  attr = { id="resource", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingFour"},
                  content = function()
                    ui.container {
                      attr = { class="panel-body"},
                      content = function()
                        ui.container {
                          attr = { class = "row " },
                          content = function()
                            ui.heading { level = 4, attr = { class = "col-md-12" }, content = "Se lo hai fatto, puoi inserire il link di un video youtube relativo alla tua proposta" }
                            ui.field.text {
                              attr = { id = "resource", class = "col-md-5" },
                              name = "resource",
                              value = param.get("resource", atom.string) or ""
                            }	
                            ui.heading { level = 4, attr = { class = "col-md-12" }, content = "Inserire il link ad una cartella cloud pubblica o a documenti" }
                            ui.field.text {
                              attr = { id = "archivecloud", class = "col-md-5" },
                              name = "archivecloud",
                              value = param.get("archivecloud", atom.string) or ""
                            }	
                            ui.heading { level = 4, attr = { class = "col-md-12" }, content = "Inserire il link ad una pagina social, forum, meetup o blog di discussione" }
                            ui.field.text {
                              attr = { id = "sociallink", class = "col-md-5" },
                              name = "sociallink",
                              value = param.get("sociallink", atom.string) or ""
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