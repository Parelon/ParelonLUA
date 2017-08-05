local issue_title = param.get("issue_title", atom.string)

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
                id = "headingIssueTitle"
              },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-8  col-sm-6 col-sm-offset-3 col-md-offset-2" },
                      content = function()
                        ui.heading { 
                          level = 3,
                          attr = {
                            datatoggle = "collapse",
                            class = "label label-accordion panel-title btn",
                            href = "#issue_title",
                            ariaexpanded = "true",
                            ariacontrols = "issue_title",
                            onclick = "collapseAll(); $('#issue_title').collapse('show')"
                          },
                          content = function()
                              ui.container {
                                attr = { class = "row" },
                                content = function()
                                  ui.container {
                                    attr = { class = "col-md-10 col-xs-6" },
                                    content = function() 
                                      ui.image { static = "png/arrow-down-icon.png" }
                                      slot.put(_ "Title")
                                     end
                                  }
                                  ui.container {
                                    attr = { class = "col-md-2 col-sm-3 pull-right col-xs-6" },
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
                      attr = { class = "col-md-2 text-center hidden-xs" },
                      content = function()
                        ui.tag {
                          tag = "a",
                          attr = {
                            id = "issueTitleNext",
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            onclick = "collapseAll(); $('#issue_abstract').collapse('show');"
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
                id = "issue_title",
                class = "panel-collapse collapse in",
                role = "tabpanel",
                arialabelledby = "headingIssueTitle"
              },
              content = function()
                ui.container {
                  attr = { class = "panel-body" },
                  content = function()
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.container {
                          attr = { class = "col-md-12 text-left" },
                          content = function()
                            ui.field.text {
                              label = _"Give your problem a title" .. ":",
--                              label_attr = { class = "h3" },
                              name = "issue_title",
                              value = issue_title or ""
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

ui.script { script = "$('#issue_title').on('hide.bs.collapse', function() { $('#issueTitleNext').hide();});" }
ui.script { script = "$('#issue_title').on('show.bs.collapse', function() { $('#issueTitleNext').show();});" }