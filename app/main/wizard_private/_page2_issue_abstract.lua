local issue_brief_description = param.get("issue_brief_description", atom.string)

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        
        ui.container {
          attr = { class = "panel panel-default"},
          content = function()
              
            ui.container {
              attr = {
                class = "row",
                role = "tab",
                id = "headingIssueAbstract"
              },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-2 col-sm-3 text-center hidden-xs" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            onclick = "collapseAll(); $('#issue_title').collapse('show');"
                          },
                          content = _"Back"
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-8  col-sm-6 text-center" },
                      content = function()
                        ui.heading { 
                          level = 3,
                          attr = {
                            datatoggle = "collapse",
                            class = "label label-accordion panel-title btn",
                            href = "#issue_abstract",
                            ariaexpanded = "true",
                            ariacontrols = "issue_abstract",
                            onclick = "collapseAll(); $('#issue_abstract').collapse('show')"
                          },
                          content = function()
                              ui.container {
                                attr = { class = "row" },
                                content = function()
                                  ui.container {
                                    attr = { class = "col-md-10  col-xs-6" },
                                    content = function() 
                                      ui.image { static = "png/arrow-down-icon.png" }
                                      slot.put(_ "Abstract")
                                     end
                                  }
                                  ui.container {
                                    attr = { class = "col-md-2 text-right col-xs-6" },
                                    content = function() 
                                      ui.image { attr = { class = "icon-medium" },static = "svg/arrow-right.svg" }
                                    end
                                  }
                                end
                              }
                            end
                          }
                        end
                      }
                    
                    ui.container {
                      attr = { class = "col-md-2  col-sm-3 text-center hidden-xs" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            onclick = "collapseAll(); $('#issue_description').collapse('show');"
                          },
                          content = _"Next"
                        }
                      end
                    }
                  end
                }
              end
            }
            
            ui.container {
              attr = {
                id = "issue_abstract",
                class = "panel-collapse collapse",
                role = "tabpanel",
                arialabelledby = "headingIssueAbstract"},
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
                            ui.tag { span = "p", content = "Inserisci una brevissima descrizione di massimo 140 caratteri: " }
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