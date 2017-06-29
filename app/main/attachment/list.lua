slot.set_layout("custom")
local issue_id = param.get_id()
local resourcesarch = ResourceIssue:by_issue_id_and_type(issue_id, "archive_url")
local resourcesopen = ResourceIssue:by_issue_id_and_type(issue_id, "open_data")
local resourcesvid = ResourceIssue:by_issue_id_and_type(issue_id, "playlist_video_url")
local resourcessoc = ResourceIssue:by_issue_id_and_type(issue_id, "social_url")

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-8 col-md-offset.2" },
              content = function()
                ui.container {
                  attr = { class = "label label-warning-tbox" },
                  content = function()
                    ui.heading { level = 1, attr = { class = "uppercase" }, content = function() slot.put(_ "Documentazione") end }
                  end
                }
              end
            }
          end
        }

        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 well-inside paper" },
              content = function()
                for i=1,ResourceIssue:count_by_type(issue_id, "archive_url") do
                  ui.container {
                    attr = { class = "row" },
                    content = function()
                      ui.image {attr = { class = "icon-small" }, static = "png/Logo_of_Google_Drive.png" }
                      ui.link {
                        attr = { class = "uppercase h2", target = "_blank" },
                        external = resourcesarch[i].url,
                        text = _("Archivio Pubblico ") .. resourcesarch[i].id
                      }
                    end
                  }
                end
                for i=1,ResourceIssue:count_by_type(issue_id, "open_data_url") do
                  ui.container {
                    attr = { class = "row spaceline" },
                    content = function()
                      ui.image {attr = { class = "icon-small" }, static = "png/open-data.png" }
                      ui.link {
                        attr = { class = "uppercase h2", target = "_blank" },
                        external = resourcesopen[i].url,
                        text = _("Open Data " ) .. resourcesopen[i].id
                      }
                    end
                  }
                end
                for i=1,ResourceIssue:count_by_type(issue_id, "playlist_video_url") do
                  ui.container {
                    attr = { class = "row spaceline" },
                    content = function()
                      ui.image {attr = { class = "icon-small" }, static = "png/YouTube-Logo.png" }
                      ui.link {
                        attr = { class = "uppercase h2", target = "_blank" },
                        external = resourcesvid[i].url,
                        text = _("Play list video pubblica ") .. resourcesvid[i].id
                      }
                    end
                  }
                end
                for i=1,ResourceIssue:count_by_type(issue_id, "social_url") do
                  ui.container {
                    attr = { class = "row spaceline" },
                    content = function()
                      ui.image {attr = { class = "icon-small" }, static = "png/icon_forum.png" }
                      ui.link {
                        attr = { class = "uppercase h2", target = "_blank" },
                        external = resourcessoc[i].url,
                        text = _("Forum, gruppi social o altri luoghi di discussione ") .. resourcessoc[i].id
                      }
                    end
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

