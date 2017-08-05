local issue_keywords = param.get("issue_keywords", atom.string)

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
                id = "headingIssueKeywords"
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
                            id = "issueKeywordsBack",
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            style = "display: none;",
                            onclick = "collapseAll(); $('#issue_aim').collapse('show');"
                          },
                          content = _"Back"
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-8  col-sm-6  text-center" },
                      content = function()
                        ui.heading { 
                          level = 3,
                          attr = {
                            datatoggle = "collapse",
                            class = "label label-accordion panel-title btn",
                            href = "#issue_keywords",
                            ariaexpanded = "true",
                            ariacontrols = "issue_keywords",
                            onclick = "collapseAll(); $('#issue_keywords').collapse('show')"
                          },
                          content = function()
                            ui.image { static = "png/arrow-down-icon.png" }
                            slot.put(_ "Keywords")
                          end
                        }
                      end
                    }
                    if param.get("concat", atom.boolean) then
                      ui.container {
                        attr = { class = "col-md-2 text-center" },
                        content = function()
                          ui.tag {
                            tag = "a",
                            attr = {
                              id = "issueKeywordsNext",
                              style = "display: none",
                              class = "btn btn-primary btn-large",
                              target = "_blank",
                              onclick = "collapseAll(); $('#initiative_title').collapse('show');"
                            },
                            content = _"Next"
                          }
                        end
                      }
                    end
                  end
                }
              end
            }

            ui.container {
              attr = {
                id = "issue_keywords",
                class = "panel-collapse collapse",
                role = "tabpanel",
                arialabelledby = "headingIssueKeywords"
              },
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
                              name = "issue_keywords",
                              label = _ "Give some keywords that describe this issue" .. ":",
                              attr = {
                                id = "issueKeywords",
                                class = "tagsinput",
                                style = "resize:none;",
                                placeholder = _ "Add a keyword",
                                rows = "1"
                              },
                              value = issue_keywords or ""
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
ui.script { static = "js/jquery.tagsinput.js" }
ui.script { script = "$('#issueKeywords').tagsInput({'height':'100%','width':'100%','maxChars' : 20});" }
ui.script { script = "$('#issue_keywords').on('hide.bs.collapse', function() { $('#issueKeywordsBack').hide(); $('#issueKeywordsNext').hide(); });" }
ui.script { script = "$('#issue_keywords').on('show.bs.collapse', function(){ $('#issueKeywordsBack').show(); $('#issueKeywordsNext').show(); });" }