local aim_description = param.get("aim_description", atom.string)

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
                          attr = { class = "label label-accordion", role="tab", id="headingThree"},
                          content = function()						                     
                            ui.heading { 
                              level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#aim-description", ariaexpanded="true", ariacontrols="aim-description"},  
                            }
                            ui.image { static = "png/arrow-down-icon.png" }				                                   
                            ui.link {content = _ " OBIETTIVO"}
                          end
                        }
                        ui.container {
                          attr = { id="aim-description", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingThree"},
                          content = function()
                            ui.container {
                              attr = { class="panel-body"},
                              content = function()
                                -- Descrizione dell' obiettivo
                                ui.container {
                                  attr = { class = "row" },
                                  content = function()                                           
                                    ui.container {
                                      attr = { class = "col-md-12 issue_desc" },
                                      content = function()
                                        ui.tag {
                                          tag = "textarea",
                                          attr = { id = "aim_description", name = "aim_description", style = "height:250px;width:100%;resize:yes;" },
                                          content = aim_description  or ""
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