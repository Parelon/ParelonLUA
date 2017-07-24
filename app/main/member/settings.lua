slot.set_layout("custom")

ui.title(function()
    ui.container {
        attr = { class = "row" },
        content = function()
            ui.container {
                attr = { class = "col-md-3 col-sm-4 col-xs-12 text-left" },
                content = function()
                    ui.link {
                        attr = { class = "btn btn-primary fixclick btn-back" },
                        module = "index",
                        view = "index",
                        image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
                        content = _ "Back to previous page"
                    }
                end
            }

            ui.container {
                attr = { class = "col-md-8 col-sm-7 col-xs-12 text-center well-inside spaceline" },
                content = function()
                    ui.heading {
                        level = 1,
                        attr = { class = "fittext1 uppercase spaceline spaceline-bottom" },
                        content = _ "Settings"
                    }
                end
            }
            ui.container {
                attr = { class = "col-md-1 col-sm-1 hidden-xs text-center spaceline" },
                content = function()
                    ui.field.popover {
                        attr = {
                            dataplacement = "left",
                            datahtml = "true";
                            datatitle = _ "Box di aiuto per la pagina",
                            datacontent = _ "In questa pagina puoi modificare le impostazioni del tuo account.",
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

local pages = {}

if not config.locked_profile_fields.name then
    pages[#pages + 1] = { view = "settings_name", text = _ "Change your screen name" }
end
if not config.locked_profile_fields.login then
    pages[#pages + 1] = { view = "settings_login", text = _ "Change your login" }
end
pages[#pages + 1] = { view = "settings_password", text = _ "Change your password" }
if not config.locked_profile_fields.notify_email then
    pages[#pages + 1] = { view = "settings_email", text = _ "Change your notification email address" }
end
pages[#pages + 1] = { view = "settings_notification", text = _ "Notification settings" }
--pages[#pages + 1] = { view = "developer_settings", text = _ "Developer settings" }

if config.download_dir then
    pages[#pages + 1] = { module = "index", view = "download", text = _ "Database download" }
end

ui.list {
    attr = { class = "text-center well" },
    style = "div",
    records = pages,
    columns = {
        {
            content = function(page)
                ui.link {
                    attr = { class = "btn btn-primary x-large-btn fixclick spaceline spaceline-bottom text-center" },
                    module = page.module or "member",
                    view = page.view,
                    text = page.text
                }
            end
        }
    }
}

