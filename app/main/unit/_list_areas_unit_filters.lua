local filter = param.get("filter", atom.string)
local create = param.get("create", atom.boolean) or false
local id = param.get_id() or 0
local unit_selector = param.get("unit_selector")

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
            ui.link {
              attr = { class = "col-md-3 btn btn-primary btn-large text-center active" },
              module = "unit",
              view = "list_areas",
              params = { create = create, filter = filter },
              content = _ "All my units"
            }
          end
        }
      end
    }
  end
}