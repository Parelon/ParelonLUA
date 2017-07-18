local filter = param.get("filter", atom.string)
local create = param.get("create", atom.boolean) or false
local id = param.get_id() or 0

btn_class = "btn btn-primary btn-large large_btn"
btn1, btn2 = btn_class, btn_class

if filter == "my_areas" then
  btn2 = btn2 .. " active"
else
  btn1 = btn1 .. " active"
end

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well" },
      content = function()
        ui.container {
          attr = { class = "row text-center" },
          content = function()
            ui.container {
              attr = { class = "col-md-6" },
              content = function()                
                ui.link {
                  attr = { class = btn1 },
                  module = "unit",
                  view = "list_areas",
                  params = { create = create },
                  content = function()
                    ui.heading { level = 3, content = _ "SHOW ALL AREAS" }
                  end
                }
              end
            }
            ui.container {
              attr = { class = "col-md-6" },
              content = function()
                ui.link {
                  attr = { class = btn2 },
                  module = "unit",
                  view = "list_areas",
                  params = { filter = "my_areas", create = create },
                  content = function()
                    ui.heading { level = 3, content = _ "MY FAVOURITE AREAS" }
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