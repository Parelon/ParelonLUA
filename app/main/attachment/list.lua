slot.set_layout("custom")
local id = param.get_id()
local caller = param.get("caller", atom.string)

trace.debug(caller)

local resourcesarch
local resourcesopen
local resourcesvid
local resourcessoc

if caller == "issue" then
  resourcesarch = ResourceIssue:by_issue_id_and_type(id, "archive_url")
  resourcesopen = ResourceIssue:by_issue_id_and_type(id, "open_data")
  resourcesvid = ResourceIssue:by_issue_id_and_type(id, "playlist_video_url")
  resourcessoc = ResourceIssue:by_issue_id_and_type(id, "social_url")
else
  resourcesarch = Resource:by_initiative_id_and_type(id, "archive_url")
  resourcesopen = Resource:by_initiative_id_and_type(id, "open_data")
  resourcesvid = Resource:by_initiative_id_and_type(id, "playlist_video_url")
  resourcessoc = Resource:by_initiative_id_and_type(id, "social_url")
end

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
              attr = { class = "col-md-8 col-md-offset.2" },
              content = function()
                ui.container {
                  attr = { class = "label label-warning-tbox" },
                  content = function()
                    ui.heading { level = 1, attr = { class = "uppercase" }, content = _ "Bibliography" }
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
                if #resourcesarch > 0 then
                  for i,resource in ipairs(resourcesarch) do
                    ui.container {
                      attr = { class = "row spaceline spaceline-bottom" },
                      content = function()
                        ui.image {attr = { class = "col-md-1 icon-small" }, static = "png/Logo_of_Google_Drive.png" }
                        ui.link {
                          attr = { class = "uppercase h2 col-md-11", target = "_blank" },
                          external = resource.url,
                          text = _"Public repository" .. "&nbsp;" .. resource.id
                        }
                      end
                    }
                  end
                else
                  ui.container {
                    attr = { class = "row spaceline spaceline-bottom" },
                    content = function()
                      ui.image {attr = { class = "col-md-1 icon-small" }, static = "png/Logo_of_Google_Drive.png" }
                      ui.heading { level = 2, attr = { class = "col-md-11" }, content = _ "Nothing" }
                    end
                  }
                end

                if #resourcesopen > 0 then
                  for i,resource in ipairs(resourcesopen) do
                    ui.container {
                      attr = { class = "row spaceline" },
                      content = function()
                        ui.image {attr = { class = "icon-small col-md-1" }, static = "png/open-data.png" }
                        ui.link {
                          attr = { class = "uppercase h2 col-md-11", target = "_blank" },
                          external = resource.url,
                          text = _"Open Data repository" .. "&nbsp;"  .. resource.id
                        }
                      end
                    }
                  end
                else
                  ui.container {
                    attr = { class = "row spaceline spaceline-bottom" },
                    content = function()
                      ui.image {attr = { class = "icon-small col-md-1" }, static = "png/open-data.png" }
                      ui.heading { level = 2, attr = { class = "col-md-11" }, content = _ "Nothing" }
                    end
                  }
                end

                if #resourcesvid > 0 then
                  for i,resource in ipairs(resourcesvid) do
                    ui.container {
                      attr = { class = "row spaceline" },
                      content = function()
                        ui.image {attr = { class = "icon-small" }, static = "png/YouTube-Logo.png" }
                        ui.link {
                          attr = { class = "uppercase h2", target = "_blank" },
                          external = resource.url,
                          text = _"YouTube playlist" .. "&nbsp;" .. resource.id
                        }
                      end
                    }
                  end
                else
                  ui.container {
                    attr = { class = "row spaceline spaceline-bottom" },
                    content = function()
                      ui.image {attr = { class = "icon-small col-md-1" }, static = "png/YouTube-Logo.png" }
                      ui.heading { level = 2, attr = { class = "col-md-11" }, content = _ "Nothing" }
                    end
                  }
                end

                if #resourcessoc > 0 then
                  for i,resource in ipairs(resourcessoc) do
                    ui.container {
                      attr = { class = "row spaceline" },
                      content = function()
                        ui.image {attr = { class = "icon-small" }, static = "png/icon_forum.png" }
                        ui.link {
                          attr = { class = "uppercase h2", target = "_blank" },
                          external = resource.url,
                          text = _"Discussion page" .. "&nbsp;" .. resource.id
                        }
                      end
                    }
                  end
                else
                  ui.container {
                    attr = { class = "row spaceline spaceline-bottom" },
                    content = function()
                      ui.image {attr = { class = "icon-small col-md-1" }, static = "png/icon_forum.png" }
                      ui.heading { level = 2, attr = { class = "col-md-11" }, content = _ "Nothing" }
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

--ui.link {
--  attr = { class = "col-md-offset-4 btn btn-primary btn-large large_btn" },
--  module = "attachment",
--  view = "edit_other",
--  id = id,
--  params = { caller = caller },
--  text = _"Edit resources"
--}