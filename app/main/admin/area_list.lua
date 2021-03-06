slot.set_layout("custom")

local unit_id = param.get_id()
local unit = Unit:by_id(unit_id)

local show_not_in_use = param.get("show_not_in_use", atom.boolean) or false

local areas = Area:build_selector { unit_id = unit_id, active = not show_not_in_use }:exec()

ui.title(function()
    ui.container {
      attr = { class = "row text-left" },
      content = function()
        ui.container {
          attr = { class = "col-md-3" },
          content = function()
            ui.link {
              attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back" },
              module = "admin",
              view = "unit_list",
              image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
              content = _ "Back"
            }
          end
        }
        ui.heading {
          level = 1,
          attr = { class = "col-md-9 text-center spaceline spaceline-bottom" },
          content = function()
            ui.tag {
              tag = "strong",
              content = _("Area list of '#{unit_name}'", { unit_name = unit.name })
            }
          end
        }
      end
    }
  end)

ui.actions(function()
    ui.container {
      attr = { class = "row spaceline2" },
      content = function()
        if show_not_in_use then
          ui.link {
            text = _ "Show areas in use",
            module = "admin",
            view = "area_list",
            id = unit_id,
            attr = { class = "col-md-offset-2 col-md-2 btn btn-primary text-center" }
          }

        else
          ui.link {
            text = _ "Create new area",
            module = "admin",
            view = "area_show",
            params = { unit_id = unit_id },
            attr = { class = "col-md-offset-2 col-md-2 btn btn-primary text-center" }
          }

          ui.link {
            text = _ "Show areas not in use",
            module = "admin",
            view = "area_list",
            id = unit_id,
            params = { show_not_in_use = true },
            attr = { class = "col-md-2 btn btn-primary text-center" }
          }

          ui.link {
            text = _ "Save areas as template",
            module = "admin",
            view = "save_areas_template",
            id = unit_id,
            params = { unit_name = unit.name, areas = areas },
            attr = { class = "col-md-2 btn btn-primary text-center" }
          }

          ui.link {
            text = _ "Paste areas from template",
            module = "admin",
            view = "paste_areas_template",                    
            id = unit_id,
            params = { unit_name = unit.name, areas = areas },
            attr = { class = "col-md-2 btn btn-primary text-center" }
          }
        end
      end
    }
  end)

ui.list {
  records = areas,
  columns = {
    { label = _ "Area", name = "name" },

    {
      content = function(record)
        if app.session.member.admin then
          ui.link {
            attr = { class = { "action admin_only" } },
            text = _ "Edit",
            module = "admin",
            view = "area_show",
            id = record.id
          }
        end
      end
    }
  }
}
