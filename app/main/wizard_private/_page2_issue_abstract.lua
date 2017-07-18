local issue_brief_description = param.get("issue_brief_description", atom.string)

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
                  attr = { class = "label label-accordion", role="tab", id="headingTwo"},
                  content = function()						                     
                    ui.heading { 
                      level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#issue_brief_description", ariaexpanded="true", ariacontrols="issue_brief_description"},  
                    }	
                    ui.image { static = "png/arrow-down-icon.png" }				                                   
                    ui.link {content = _ "BREVE DESCRIZIONE"}
                  end
                }
                ui.container {
                  attr = { id="issue_brief_description", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingTwo"},
                  content = function()
                    ui.container {
                      attr = { class="panel-body"},
                      content = function()
                        ui.container {
                          attr = { class = "row" },
                          content = function()
                            ui.container {
                              attr = { class = "col-md-12 text-left" },
                              content = function()
                                ui.tag { span = "p", content = "Inserisci un abstract di massimo 140 caratteri: " }
                                ui.tag { span = "p", attr = { id = "count" }, content = "140" }
                                ui.tag { span = "p", content = " rimasti" }
                              end
                            }
                            ui.container {
                              attr = { class = "col-md-12 issue_desc" },
                              content = function()
                                ui.tag {
                                  tag = "textarea",
                                  attr = {
                                    id = "issue_abstract",
                                    name = "issue_brief_description",	
                                    style = "resize: none",
                                    maxlength = "140",
                                    onkeyup = "var length = $('#issue_abstract').val().length; var count = 140-length; $('#count').text(count)"
                                  },
                                  content = issue_brief_description or ""
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