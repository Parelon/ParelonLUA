local filter = param.get("filter", atom.string)
local create = param.get("create", atom.boolean) or false
local id = param.get_id() or 0

local units = app.session.member:get_reference_selector("units"):add_where("unit.public"):exec()

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.heading {
              level = 3,
              attr = { class = "col-md-2 spaceline" },
              content = _"I want to see areas in: "
            }

            local class = "col-md-3 btn btn-primary btn-large text-center"

            if id == 0 then
              ui.link {
                attr = { class = class .. " active" },
                module = "unit",
                view = "list_areas",
                params = { create = create, filter = filter },
                content = _ "All my units"
              }
            else
              ui.link {
                attr = { class = class },
                module = "unit",
                view = "list_areas",
                params = { create = create, filter = filter },
                content = _ "All my units"
              }
            end

            for i,unit in ipairs(units) do
              if unit.id == id then
                ui.link {
                  attr = { class = class .. " active" },
                  module = "unit",
                  view = "list_areas",
                  id = unit.id,
                  params = { create = create, filter = filter },
                  content = unit.name
                }
              else
                ui.link {
                  attr = { class = class },
                  module = "unit",
                  view = "list_areas",
                  id = unit.id,
                  params = { create = create, filter = filter },
                  content = unit.name
                }
              end            
            end
          end
        }
      end
    }
  end
}