local issue_title = param.get("issue_title", atom.string)

-- Box questione
ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well-blue" },
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
                          attr = { class = "label label-accordion", role="tab", id="headingOne"},
                          content = function()						                     
                            ui.heading { 
                              level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#issue_title", ariaexpanded="true", ariacontrols="issue_title"},  
                            }
                            ui.image { static = "png/arrow-down-icon.png" }					                                   
                            ui.link {content = _ "TITOLO PROBLEMA O QUESTIONE"}
                          end
                        }
                        ui.container {
                          attr = { id="issue_title", class="panel-collapse collapse in",  role="tabpanel", arialabelledby="headingOne"},
                          content = function()
                            ui.container {
                              attr = { class="panel-body"},
                              content = function()
                                ui.container {
                                  attr = { class = "row " },
                                  content = function()
                                    ui.container {
                                      attr = { class = "col-md-12 text-left" },
                                      content = function()
                                        ui.tag { tag = "input", attr = { id = "issue_title", name = "issue_title", value = issue_title or "" }, content = "" }
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