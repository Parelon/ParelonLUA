local area = param.get("area", "table")
local state = param.get("state", atom.string)
local orderby = param.get("orderby", atom.string)
local desc = param.get("desc", atom.boolean)
local create = param.get("create", atom.boolean)

-- Determines the desc order button text
local inv_txt
if not desc then
  inv_txt = _ "INVERT ORDER FROM ASCENDING TO DESCENDING"
else
  inv_txt = _ "INVERT ORDER FROM DESCENDING TO ASCENDING"
end

ui.container {
  attr = { class = "row well" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        ui.heading {
          level = 2,
          attr = { class = "uppercase text-center spaceline spaceline-bottom" },
          content = _ "Order by:"
        }
      end
    }
    ui.container {
      attr = { class = "col-md-12 well-inside" },
      content = function()
        ui.container {
          attr = { class = "row spaceline spaceline-bottom text-center" },
          content = function()
--            ui.container {
--              attr = { class = "col-md-12" },
--              content = function()

            local btna, btnb, btnc, btnd = "", "", "", ""
            if orderby == "supporters" then
              btna = " active"
            elseif orderby == "creation_date" then
              btnb = " active"
            elseif orderby == "event" then
              btnc = " active"
            end
            if desc then
              btnd = " active"
            end
    ui.container {
      attr = { class = "col-lg-3 col-md-6 col-sm-6 col-xs-12" },
      content = function()
              ui.link {
                attr = { class = "text-center btn btn-primary h3 filter_btn fixclick" .. btna },
                module = "area_private",
                view = "show",
                id = area.id,
                params = { create = create, state = state, orderby = "supporters", interest = interest, desc = desc },
                content = 
                function()
                  ui.heading { level = 3, content = _ "ORDER BY NUMBER OF SUPPORTERS" }
                end
              }
      end
    }
    ui.container {
      attr = { class = "col-lg-3 col-md-6 col-sm-6 col-xs-12" },
      content = function()          
           -- end
            ui.link {
              attr = { class = "text-center btn btn-primary filter_btn fixclick" .. btnb },
              module = "area_private",
              view = "show",
              id = area.id,
              params = { state = state, orderby = "creation_date", interest = interest, desc = desc, ftl_btns = ftl_btns },
              content = function()
                ui.heading { level = 3, content = _ "ORDER BY DATE OF CREATION" }
              end
            }
        end
    }
    ui.container {
      attr = { class = "col-lg-3 col-md-6 col-sm-6 col-xs-12" },
      content = function()          
            ui.link {
              attr = { class = "text-center btn btn-primary filter_btn fixclick" .. btnc },
              module = "area_private",
              view = "show",
              id = area.id,
              params = { create = create, state = state, orderby = "supporters", interest = interest, desc = desc },
              content = function()
                ui.heading { level = 3, content = _ "ORDER BY LAST EVENT DATE" }
              end
            }
      end
    }
    ui.container {
      attr = { class = "col-lg-3 col-md-6 col-sm-6 col-xs-12" },
      content = function()
            ui.link {
              attr = { class = "text-center btn btn-primary filter_btn fixclick" .. btnd },
              text = inv_txt,
              module = "area_private",
              view = "show",
              id = area.id,
              params = { create = create, state = state, orderby = "supporters", interest = interest, desc = desc },
            }
      end
    }           
          end
        }
      end
    }
  end
}