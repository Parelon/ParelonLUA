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
                                ui.tag { span = "p", content = "Inserisci un abstract di massimo 300 caratteri: " }
                                ui.tag { span = "p", attr = { id = "count" }, content = "300" }
                                ui.tag { span = "p", content = " rimasti" }
                              end
                            }
                            ui.container {
                              attr = { class = "col-md-12 init_brief" },
                              content = function()
                                ui.tag {
                                  tag = "textarea",
                                  attr = {
                                    id = "initiative_abstract",
                                    name = "initiative_brief_description",
                                    style = "height:250px; resize:none;",
                                    maxlength = "300",
                                    onkeyup = "var length = $('#initiative_abstract').val().length; var count = 300-length; $('#count').text(count)"
                                  },
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