local initiative_title = param.get("initiative_title")

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
                  attr = { class = "label label-accordion", role="tab", id="headingOne"},
                  content = function()						                     
                    ui.heading { 
                      level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#initiative_title", ariaexpanded="true", ariacontrols="initiative_title"},  
                    }
                    ui.image { static = "png/arrow-down-icon.png" }
                    ui.link {content = _ "TITOLO PROPOSTA"}
                  end
                }
                ui.container {
                  attr = { id="initiative_title", class="panel-collapse collapse in",  role="tabpanel", arialabelledby="headingOne"},
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
                                  attr = { id = "initiative_title", style = " font-size: 25px;" },
                                  name = "initiative_title",
                                  value = initiative_title or ""
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