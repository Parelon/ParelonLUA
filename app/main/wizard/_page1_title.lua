local area = param.get("area", "table")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 col-sm-4 col-xs-12 text-center spaceline" },
      content = function()
        ui.link {
          attr = { id = "btnPreviuos", class = "btn btn-primary btn-back fixclick" },
          module = "unit",
          view = "list_areas",
          params = { create = true, filter = "my_areas" },
          id = area.unit.id,
          content = function()
            ui.heading {
              level = 3,
              content = function()
                ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
                slot.put(_ "Back")
              end
            }
          end
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6 col-sm-4 col-xs-12 text-center" },
      content = function()
        ui.container {
          attr = { class = "well-inside" },
          content = function()
            ui.container {
              attr = { class = "row spaceline" },
              content = function()
                ui.container {
                  attr = { class = "col-md-2 h4 text-left" },
                  content = _"Unit" ..":"
                }
                ui.container {
                  attr = { class = "col-md-8 h2"},
                  content = function() slot.put("<strong>" .. area.unit.name .. "</strong>") end
                }
              end
            }

            ui.container {
              attr = { class = "row" },
              content = function()
                ui.container {
                  attr = { class = "col-md-2 h4 text-left" },
                  content = _"Area" ..":"
                }
                ui.container {
                  attr = { class = "col-md-8 h2"},
                  content = function() slot.put("<strong>" .. area.name .. "</strong>") end
                }
              end
            }
          end
        }
        ui.heading { level = 1, attr = { class = "uppercase label label-warning spaceline" }, content = _ "STEP 1: Discussion policy" }
      end
    }
    ui.container {
      attr = { class = "col-md-3 col-sm-4 col-xs-12 text-center spaceline" },
      content = function()
        ui.tag {
          tag = "a",
          attr = { id = "btnNext", class = "btn btn-primary btn-back spaceline", onClick = "$('#page1').submit();" },
          content = function()
            ui.heading {
              level = 3,
              content = function()
                slot.put(_ "Next")
                ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-right.svg" }
              end
            }
          end
        }
      end
    }
  end
}