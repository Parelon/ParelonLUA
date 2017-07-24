local id = param.get_id()
local video
local caller = param.get("caller", atom.string)
if caller == "issue" then
  video = ResourceIssue:get_video_by_issue_id(id)
else
  video = Resource:get_video_by_initiative_id(id)
end

trace.debug(caller or "no caller")

ui.title(function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-3 text-left" },
          content = function()
            ui.link {
              attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back" },
              module = caller,
              view = "show",
              id = id,
              image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
              content = _ "Back to previous page"
            }
          end
        }

        ui.container {
          attr = { class = "col-md-8 spaceline2 text-center label label-warning" },
          content = function()
            ui.heading {
              level = 1,
              attr = { class = "fittext1 uppercase" },
              content = _ "Edit this video link"
            }
          end
        }
        ui.container {
          attr = { class = "col-md-1 text-center spaceline" },
          content = function()
            ui.field.popover {
              attr = {
                dataplacement = "left",
                datahtml = "true";
                datatitle = _ "Box di aiuto per la pagina",
                datacontent = _ "Se vuoi aggiungere un video di presentazione della tua proposta o modificare quello già inserito, pubblicalo su youtube e incolla l'indirizzo nel box sottostante. Una volta fatto clicca su <i>Salva</i>. Se invece vuoi rimuovere il video che hai inserito, semplicemente cancella l'indirizzo visualizzato e poi clicca <i>Salva</i>.",
                datahtml = "true",
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
  end)

ui.form {
  attr = { class = "vertical" },
  module = "attachment",
  action = "edit_video",
  id = id,
  params = {
    caller = caller,
    link = link
  },
  routing = {
    ok = {
      mode = "redirect",
      module = caller,
      view = "show",
      id = id
    },
    error = {
      mode = "redirect",
      module = "attachment",
      view = "edit_video",
      id = id,
      params = { caller = caller }      
    }
  },
  content = function()
    ui.field.text {
      label = _ "Youtube link",
      attr = { id = "link" },
      name = "link",
      value = video
    }
    ui.tag {
      tag = "input",
      attr = {
        type = "submit",
        class = "col-md-offset-4 btn btn-primary btn-large large_btn",
        value = _ "Save"
      }
    }
  end
}