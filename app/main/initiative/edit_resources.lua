slot.set_layout("custom")

local initiative = Initiative:by_id(param.get_id())
local resources = Resource:by_initiative_id(initiative.id)
local link = ""
for i=1, Resource:count(initiative.id) do
	link = link .. resources[i].url .. "\n"
end
ui.title(function()
    ui.container {
        attr = { class = "row" },
        content = function()
            ui.container {
                attr = { class = "col-md-3 text-left" },
                content = function()
                    ui.link {
                        attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back" },
                        module = "initiative",
                        view = "show",
                        id = initiative.id,
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
                        content = _ "Edit the archive link for this initiative"
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
                            datacontent = _ "Se vuoi aggiungere un archivio di file pubblico della tua questione o modificare quello già inserito, pubblicalo e incolla l'indirizzo nel box sottostante. Una volta fatto clicca su <i>Salva</i>. Se invece vuoi rimuovere il link all'archivio che hai inserito, semplicemente cancella l'indirizzo visualizzato e poi clicca <i>Salva</i>.",
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
    module = "initiative",
    action = "edit_resources",
    params = {
        initiative_id = initiative.id,
        link = link,
	type = "archive_url"
    },
    routing = {
        ok = {
            mode = "redirect",
            module = "initiative",
            view = "show",
            id = initiative.id
        },
        error = {
        	mode = "redirect",
            module = "initiative",
            view = "edit_resources",
            id = initiative.id
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
