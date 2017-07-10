local initiative = param.get("initiative", "table")
local initiator = param.get("initiator", "table")

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 spaceline-bottom" },
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
          attr = { class = "row well-inside" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 paper" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-6 col-sm-12 col-xs-12 text-center" },
                      content = function()
                        ui.container {
                          attr = { class = "row" },
                          content = function()
                            ui.heading { level = 2, attr = { class = "col-md-12" }, content = _ "PRESENTAZIONE IN VIDEO DELLA PROPOSTA" } 
                          end
                        }
                        ui.container {
                          class = "row",
                          content = function()
                            ui.container {
                              attr = { class = "col-md-12 col-sm-12 col-xs-12 text-center spaceline" },
                              content = function()
                                ui.container {
                                  content = function()
                                    local resource = Resource:by_initiative_id_and_type(initiative.id, 'video')
                                    if resource ~= nil and resource[1] ~= nil and resource[1].url ~= "" then
                                      if string.find(resource[1].url, "https://www.youtube.com/watch") then
                                        local code = resource[1].url:sub(resource[1].url:find("=") + 1)
                                        slot.put('<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/' .. code .. '\" frameborder=\"0\" allowfullscreen></iframe>')
                                      end
                                    else
                                      ui.image {attr = { class = "img-responsive" }, static = "png/video-player.png" }
                                    end
                                    if initiator and initiator.accepted and not initiative.issue.half_frozen and not initiative.issue.closed and not initiative.revoked then
                                      ui.link {
                                        module = "initiative",
                                        view = "edit_video",
                                        id = initiative.id,
                                        attr = { class = "btn btn-primary btn-large large_btn" },
                                        text = _"Change video url"
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
                    ui.container {
                      attr = { class = "col-md-6 col-sm-12 col-xs-12" },
                      content = function()
                        local resource = Resource:by_initiative_id(initiative.id)
                        if resource ~= nil then
                          execute.view { 
                            module = "attachment",
                            view = "list",
                            id = initiative.id,
                            params = { caller = "intiative" }
                          }
                        end
                        if initiator and initiator.accepted and not initiative.issue.half_frozen and not initiative.issue.closed and not initiative.revoked then
                          ui.link {
                            module = "attachment",
                            view = "edit_other",
                            id = initiative.id,
                            params = { caller = "intiative" },
                            attr = { class = "btn btn-primary btn-large large_btn" },
                            text = _ "Edit resources"
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