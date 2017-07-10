local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-10" },
              content = function()
                ui.heading { level = 3, attr = { class = "label label-warning-tbox" }, content = _ "Attachments" }
              end
            }
          end
        }
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12  well-inside paper " },
              content = function()
                ui.container {
                  attr = { class = "row spaceline" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-6 col-sm-12 col-xs-12 text-center" },
                      content = function()
                        ui.heading { level = 2, content = _ "PRESENTAZIONE IN VIDEO DELLA PROPOSTA" } 
                      end
                    }
                  end
                }
                ui.container {
                  attr = { class = "row spaceline2" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-6  col-sm-12 col-xs-12 text-center spaceline" },
                      content = function()
                        ui.container {
                          content = function()
                            local resource = ResourceIssue:by_issue_id_and_type(issue.id, 'video')
                            if #resource > 0 and resource[1].url ~="" then
                              if string.find(resource[1].url, "https://www.youtube.com/watch") then
                                local code = resource[1].url:sub(resource[1].url:find("=") + 1)
                                slot.put('<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/' .. code .. '\" frameborder=\"0\" allowfullscreen></iframe>')
                              else
                                slot.put(_"Wrong link format")
                              end
                            else
                              ui.image {attr = { class = "img-responsive" }, static = "png/video-player.png" }
                            end
                            if app.session.member == issue.member then
                              ui.link {
                                module = "attachment",
                                view = "edit_video",
                                id = issue.id,
                                params = { caller = "issue" },
                                attr = { class = "btn btn-primary btn-large large_btn" },
                                text = _"Change video url"
                              }
                            end
                          end
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-6 col-sm-12 col-xs-12" },
                      content = function()                        
                        execute.view { 
                          module = "attachment",
                          view = "list",
                          id = issue.id,
                          params = { caller = "issue" }
                        }
                        if app.session.member == issue.member then
                          ui.link {
                            module = "attachment",
                            view = "edit_resources",
                            params = { caller = "issue" },
                            id = issue.id,
                            attr = { class = "btn btn-primary btn-large large_btn" },
                            text = _"Change Resources url"
                          }
                        end
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