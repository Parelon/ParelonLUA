local area = param.get("area", "table")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 col-sm-4 col-xs-12 text-center spaceline" },
      content = function()
        ui.tag {
          tag = "a",
          attr = { id = "btnPreviuos", class = "btn btn-primary btn-back fixclick", onClick = "getElementById(\"page2_back\").submit();" },
          content = function()
            ui.heading {
              level = 3,
              content = function()
                ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
                slot.put(_ "Back Phase")
              end
            }
          end
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6 well-inside paper col-sm-4 col-xs-12 text-center" },
      content = function()
        ui.heading { level = 1, attr = { class = "uppercase label label-danger" }, content = _ "STEP 2: Segnala il problema o questione " }
        ui.heading {
          level = 2,
          attr = { class = "spaceline" },
          content = function()
            slot.put(_ "Unit" .. ": " .. "<strong>" .. area.unit.name .. "</strong>")
          end
        }
        ui.heading {
          level = 2,
          content = function()
            slot.put(_ "Area" .. ": " .. "<strong>" .. area.name .. "</strong>")
          end
        }
      end
    }
    ui.container {
      attr = { class = "col-md-3 col-sm-4 col-xs-12 text-center spaceline" },
      content = function()
        ui.tag {
          tag = "a",
          attr = { id = "btnNext", class = "btn btn-primary btn-back fixclick", onClick = "getElementById(\"page2\").submit();" },
          content = function()
            ui.heading {
              level = 3,
              content = function()
                slot.put(_ "Next Phase")
                ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-right.svg" }
              end
            }
          end
        }
      end
    }
  end
}