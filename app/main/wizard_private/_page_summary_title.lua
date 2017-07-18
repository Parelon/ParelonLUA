local area = param.get("area", "table")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 text-left" },
      content = function()
        -- implementare "indietro"
        ui.tag {
          tag = "a",
          attr = {
            class = "btn btn-primary fixclick btn-back",
            onclick = "getElementById('page_summary_back').submit();"
          },
          content = function()
            ui.heading {
              level = 3,
              content = function()
                ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
                slot.put(_ "Back to previous page")
              end
            }
          end
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6 text-center label label-warning spaceline" },
      content = function()
        ui.heading { level = 3, content = _ "WIZARD HEADER END" }
      end
    }
    ui.container {
      attr = { class = "col-md-3 spaceline text-right " },
      content = function()
        ui.field.popover {
          attr = {
            dataplacement = "left",
            datahtml = "true";
            datatitle = _ "Insert Technical Areas",
            datacontent = _ "WIZARD END",
            datahtml = "true",
            class = "text-center"
          },
          content = function()
            ui.container {
              attr = { class = "icon" },
              content = function()
                ui.image { attr = { class = "icon-medium" },static = "png/tutor.png" }
                --								    ui.heading{level=3 , content= _"What you want to do?"}
              end
            }
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
      attr = { class = "col-md-12 text-center paper" },
      content = function()
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
  end
}