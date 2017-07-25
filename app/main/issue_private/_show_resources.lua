local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        ui.heading { level = 3, attr = { class = "label label-warning-tbox spaceline" }, content = _ "Attachments" }
      end
    }
  end
}
ui.container {
  attr = { class = "row well-inside" },
  content = function()
    ui.container {
      attr = { class = "col-md-6 col-sm-12 col-xs-12 text-center spaceline-bottom spaceline" },
      content = function()
        ui.heading { level = 2, content = _ "PRESENTAZIONE IN VIDEO DELLA PROPOSTA" } 
        ui.container {
          attr = { class = "col-md-12 col-sm-12 col-xs-12 text-center" },
          content = function()
            local resource = ResourceIssue:by_issue_id_and_type(issue.id, 'video')
            if resourcer and resource.url ~= "" then
              if string.find(resource.url, "https://www.youtube.com/watch") then
                local code = resource.url:sub(resource[1].url:find("=") + 1)
                slot.put('<iframe width=\"100%\" height=\"400\" src=\"https://www.youtube.com/embed/' .. code .. '\" frameborder=\"0\" allowfullscreen></iframe>')
              else
                ui.image {attr = { class = "img-responsive" }, static = "png/video-player.png" }
              end
            else
              ui.image {attr = { class = "img-responsive" }, static = "png/video-player.png" }
            end

            if app.session.member_id == issue.member_id then
              ui.link {
                module = "attachment",
                view = "edit_video",
                id = issue.id,
                params = { caller = "issue_private" },
                attr = { class = "btn btn-primary btn-large large_btn" },
                text = _"Change video url"
              }
            end
          end
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6 col-sm-12 col-xs-12 well spaceline2" },
      content = function()
        execute.view { 
          module = "attachment",
          view = "list",
          id = issue.id,
          params = { caller = "issue_private" }
        }
        if app.session.member_id == issue.member_id then
          ui.container {
            attr = { class = "row spaceline" },
            content = function()
              ui.container {
                attr = { class = "col-md-12 text-center" },
                content = function()
                  ui.link {
                    module = "attachment",
                    view = "edit_resources",
                    params = { caller = "issue_private" },
                    id = issue.id,
                    attr = { class = "btn btn-primary btn-large large_btn" },
                    text = _"Change Resources url"
                  }
                end
              }
            end
          }
        end
      end
    }
  end
}