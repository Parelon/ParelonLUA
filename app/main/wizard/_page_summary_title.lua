local area = param.get("area", "table")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 col-sm-4 col-xs-12 text-left" },
      content = function()
        -- implementare "indietro"
        ui.tag {
          tag = "a",
          attr = {
            class = "btn btn-primary fixclick btn-back",
            onclick = "$('#page_summary_back').submit();"
          },
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

--    ui.container {
--      attr = { class = "col-md-6 col-sm-7 col-xs-12 text-center spaceline label label-success" },
--      content = function()
--        ui.heading { level = 3, content = _ "WIZARD HEADER END" }
--      end
--    }
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
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12" },
              content = function()
                ui.heading { level = 1, attr = { class = "uppercase label label-success spaceline" }, content = _ "All done" }
              end
            }
          end
        }
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 text-left" },
              content = function()
                ui.heading { level = 3, attr = { class = "uppercase spaceline" }, content = _ "Check that all the infos are correct and then public it" .. "." }
              end
            }
          end
        }
      end
    }

    ui.container {
      attr = { class = "col-md-1 col-sm-1 spaceline text-right hidden-xs" },
      content = function()
        ui.field.popover {
          attr = {
            dataplacement = "left",
            datahtml = "true";
            datatitle = _ "Insert Technical Areas",
            datacontent = _ "All done. Check that all infos given are correct.",
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