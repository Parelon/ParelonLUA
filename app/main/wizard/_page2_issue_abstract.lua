local issue_brief_description = param.get("issue_brief_description", atom.string)
trace.debug("issue abstract: " .. issue_brief_description)

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
                            id = "issueAbstractBack",
                            style = "display: none;",
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
                            id = "issueAbstractNext",
                            style = "display: none;",
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
                          attr = { class = "col-md-12 issue_desc" },
                          content = function()
                            ui.field.text {
                              label = function()
                                ui.tag {
                                  tag = "span",
                                  content = (_"Give a very short description of 140 characters maximum" .. ": ")
                                }
                                ui.tag { tag = "span", attr = { id = "issueCount" }, content = "140" }
                                ui.tag { tag = "span", content = (slot.put(" ", _ "left")) }
                              end,                              
                              multiline = true,
                              attr = {
                                id = "issueAbstract",
                                style = "resize: none",
                                maxlength = "140",
                                onkeyup = "var length = $('#issueAbstract').val().length; var count = 140-length; $('#issueCount').text(count);"
                              },
                              name = "issue_brief_description",	
                              value = issue_brief_description or ""
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

ui.script { script = "$('#issue_abstract').on('hide.bs.collapse', function() { $('#issueAbstractBack').hide(); $('#issueAbstractNext').hide(); });" }
ui.script { script = "$('#issue_abstract').on('show.bs.collapse', function(){ $('#issueAbstractBack').show(); $('#issueAbstractNext').show(); });" }