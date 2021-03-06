local aim_description = param.get("aim_description", atom.string)

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
                id = "headingIssueAim"
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
                            id = "issueAimBack",
                            style = "display: none;",
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            onclick = "collapseAll(); $('#issue_description').collapse('show');"
                          },
                          content = _"Back"
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-8 col-sm-6 text-center" },
                      content = function()
                        ui.heading { 
                          level = 3,
                          attr = {
                            datatoggle = "collapse",
                            class = "label label-accordion panel-title btn",
                            href = "#issue_aim",
                            ariaexpanded = "true",
                            ariacontrols = "issue_aim",
                            onclick = "collapseAll(); $('#issue_aim').collapse('show')"
                          },
                          content = function()
                            ui.container {
                              attr = { class = "row" },
                              content = function()
                                ui.container {
                                  attr = { class = "col-md-10 col-xs-6" },
                                  content = function() 
                                    ui.image { static = "png/arrow-down-icon.png" }
                                    slot.put(_ "aim")
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
                            id = "issueAimNext",
                            style = "display: none;",
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            onclick = "collapseAll(); $('#issue_keywords').collapse('show');"
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
                id = "issue_aim",
                class = "panel-collapse collapse",
                role = "tabpanel",
                arialabelledby = "headingIssueAim"
              },
              content = function()
                ui.container {
                  attr = { class="panel-body"},
                  content = function()
                    -- Descrizione dell'obiettivo
                    ui.container {
                      attr = { class = "row" },
                      content = function()                                        
                        ui.container {
                          attr = { class = "col-md-12 issue_desc" },
                          content = function()
                            ui.field.text {
                              multiline = true,
                              label = _ "Describe what you want to accomplish" .. ":",
                              name = "aim_description",
                              attr = {
                                style = "resize:none;",
                                rows = "5"
                              },
                              value = aim_description or ""
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

ui.script { script = "$('#issue_aim').on('hide.bs.collapse', function() { $('#issueAimBack').hide(); $('#issueAimNext').hide(); });" }
ui.script { script = "$('#issue_aim').on('show.bs.collapse', function(){ $('#issueAimBack').show(); $('#issueAimNext').show(); });" }