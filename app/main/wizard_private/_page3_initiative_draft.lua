local draft = param.get("draft")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well"},
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
                      level = 3, attr = { datatoggle="collapse", class = "panel-title", href="#draft", ariaexpanded="true", ariacontrols="draft"},  
                    }
                    ui.image { static = "png/arrow-down-icon.png" }
                    ui.link {content = _ " TESTO DELLA PROPOSTA"}
                  end
                }
                ui.container {
                  attr = { id="draft", class="panel-collapse collapse",  role="tabpanel", arialabelledby="headingThree"},
                  content = function()
                    ui.container {
                      attr = { class="panel-body"},
                      content = function()
                        ui.container {
                          attr = { class = "row" },
                          content = function()
                            ui.container {
                              attr = { class = "col-md-10 text-left" },
                              content = function()
                                ui.tag { tag = "p", content = "Gli articoli i commi ed i riferimenti normativi della Tua proposta di soluzione al problema o questione sollevata" }
                              end
                            }	
--                            ui.container {
--                              attr = { class = "col-md-2 text-right" },
--                              content = function()
--                                ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
--                                slot.put(_ "Esporta")	
--                              end
--                            }	
                            ui.container {
                              attr = { class = "col-md-12 issue_desc" },
                              content = function()
                                ui.tag {
                                  tag = "textarea",
                                  attr = { id = "draft", name = "draft", style = "height:250px; resize:none;" },
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