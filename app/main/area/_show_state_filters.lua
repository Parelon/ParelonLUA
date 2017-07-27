slot.set_layout("custom")

local create = param.get("create", atom.boolean)
local area = param.get("area", "table")
local state = param.get("state", atom.string)
local orderby = param.get("orderby", atom.string)
local desc = param.get("desc", atom.boolean)

local classNew = "btn btn-primary btn-large fixclick"
local classDiscussion = "btn btn-primary btn-large fixclick"
local classClosed = "btn btn-primary btn-large fixclick"

if state == "admission" then
  classNew = classNew .. " active"
elseif state == "development" then
  classDiscussion = classDiscussion .. " active"
elseif state == "closed" then
  classClosed = classClosed .. " active"
end

ui.container {
  attr = { class = "row well" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 spaceline text-center" },
      content = function()
        ui.heading { level = 2, content = _ "I want to read:" }
      end
    }

    ui.container {
      attr = { class = "col-md-12 spaceline" },
      content = function()
        ui.container {
          attr = { class = "well-inside" },
          content = function()
            ui.container {
              attr = { class = "row spaceline text-center" },
              content = function()                    
                ui.container {
                  attr = { class = "col-md-4" },
                  content = function()
                    ui.link {
                      attr = { class = classNew },
                      module = "area",
                      view = "show",
                      params = { create = create, state = "admission", orderby = orderby, interest = interest, desc = desc },
                      id = area.id,
                      content = function()
                        ui.heading { level = 3, attr = { class = "fittext" }, content = _ "INITIATIVES LOOKING FOR SUPPORTERS" }
                      end
                    }
                  end
                }

                ui.container {
                  attr = { class = "col-md-4" },
                  content = function()
                    ui.link {
                      attr = { class = classDiscussion },
                      module = "area",
                      view = "show",
                      params = { create = create, state = "development", orderby = orderby, interest = interest, desc = desc },
                      id = area.id,
                      content = function()
                        ui.heading { level = 3, attr = { class = "fittext" }, content = _ "INITIATIVES NOW IN DISCUSSION" }
                      end
                    }
                  end
                }

                ui.container {
                  attr = { class = "col-md-4" },
                  content = function()
                    ui.link {
                      attr = { class = classClosed },
                      module = "area",
                      view = "show",
                      params = { create = create, state = "closed", orderby = orderby, interest = interest, desc = desc },
                      id = area.id,
                      content = function()
                        ui.heading { level = 3, attr = { class = "fittext" }, content = _ "COMPLETE" }
                      end
                    }
                  end
                }
              end
            }
            ui.container {
              attr = { class = "row spaceline2 text-center" },
              content = function()
                slot.put("&nbsp;")
              end
            }
          end
        }
      end
    }
  end
}
