slot.set_layout("custom")

local initiative = Initiative:by_id(param.get_id())

ui.title(
  function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-3 text-left" },
          content = function()
            ui.link {
              attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back"              },
              module = "initiative",
              view = "show",
              id = initiative.id,
              image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
              content = _ "Back"
            }
          end
        }
        ui.container {
          attr = { class = "col-md-7 text-center label label-warning spaceline2 spaceline-bottom fittext1" },
          content = function()
            ui.heading {
              level = 2,
              content = _ "Edit Discussion URL"
            }
          end
        }
        ui.container {
          attr = { class = "col-md-1 text-center spaceline" },
          content = function()
            ui.field.popover {
              attr = {
                dataplacement = "auto",
                datahtml = "true";
                datatitle = _ "Box di aiuto per la pagina",
                datacontent = _ "If you opened a page for discussing on the initiative, put its URL here.",
                class = "text-center"
              },
              content = function()
                ui.image { attr = { class = "icon-medium" },static = "png/tutor.png" }
              end
            }
          end
        }
      end
    }
  end
)

ui.form {
  record = initiative,
  module = "initiative",
  action = "update",
  id = initiative.id,
  attr = { class = "vertical" },
  routing = {
    default = {
      mode = "redirect",
      module = "initiative",
      view = "show",
      id = initiative.id
    }
  },
  content = function()
    ui.field.text { label = _ "Discussion URL", name = "discussion_url" }
    ui.submit { text = _ "Save" }
  end
}