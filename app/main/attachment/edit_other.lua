slot.set_layout("custom")

local id = param.get_id()
local resources
local caller = param.get("caller", atom.string)

if caller == "issue" then
  resources = ResourceIssue:by_issue_id(id)
else
  resources = Resource:by_initiative_id(id)
end

if #resources > 0 then
  for i,resource in ipairs(resources) do
    link = link .. "\n"
  end
end

ui.title(function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-3 col-sm-6 col-xs-12 text-center" },
          content = function()
            ui.link {
              attr = { class = "btn btn-primary fixclick btn-back" },
              module = caller,
              view = "show",
              id = id,
              image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
              content = _ "Back"
            }
          end
        }

        ui.container {
          attr = { class = "col-md-6 col-sm-6 col-xs-12 spaceline2 text-center label label-warning" },
          content = function()
            ui.heading {
              level = 1,
              content = _ "Change resources URL"
            }
          end
        }
        ui.container {
          attr = { class = "col-md-2 hidden-xs text-right spaceline" },
          content = function()
            ui.field.popover {
              attr = {
                dataplacement = "left",
                datahtml = "true";
                datatitle = _ "Box di aiuto per la pagina",
                datacontent = _ "Se vuoi aggiungere un archivio di file pubblico della tua questione o modificare quello già inserito, pubblicalo e incolla l'indirizzo nel box sottostante,sono supportati, gruppi o pagine facebook ed archivi pubblici google drive. Una volta fatto clicca su <i>Salva</i>. Se invece vuoi rimuovere il link all'archivio che hai inserito, semplicemente cancella l'indirizzo visualizzato e poi clicca <i>Salva</i>.",
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
ui.container {
  attr = { class = "row well" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well-inside paper" },
      content = function()
        ui.form {
          attr = { class = "vertical" },
          module = "attachment",
          action = "edit_other",
          id = id,
          params = {
            caller = caller,
            link = link,
            type = "archive_url"
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
              view = "edit_other",
              id = id,
              params = { caller = caller }
            }
          },
          content = function()
            ui.tag {
              tag = "textarea",
              attr = { id = "link", rows = "8", placeholder = "One link per row", name = "link" },
              content = link or ""
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
      end
    }
  end
}