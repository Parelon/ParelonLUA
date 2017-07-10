local problem_description = param.get("problem_description", atom.string)

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
                  attr = { class = "label label-accordion", role="tab", id="headingThree"},
                  content = function()						                     
                    ui.heading { 
                      level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#problem_description", ariaexpanded="true", ariacontrols="problem_description"},  
                    }	
                    ui.image { static = "png/arrow-down-icon.png" }				                                   
                    ui.link {content = _ "DESCRIZIONE PROBLEMA"}
                  end
                }
                ui.container {
                  attr = { id="problem_description", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingThree"},
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
                                ui.tag { tag = "p", content = _ "Descrivi il problema a cui vuoi dare soluzione" }
                              end
                            }
                            ui.container {
                              attr = { class = "col-md-12 issue_desc" },
                              content = function()
                                ui.tag {
                                  tag = "textarea",
                                  attr = {
                                    id = "problem_description",
                                    name = "problem_description",
                                    style = "height:250px; resize:none;"
                                  },
                                  content = problem_description or ""
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