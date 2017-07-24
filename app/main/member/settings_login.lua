slot.set_layout("custom")

ui.title(function()
    ui.container {
        attr = { class = "row" },
        content = function()
            ui.container {
                attr = { class = "col-md-3 text-left" },
                content = function()
                    ui.link {
                        attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back" },
                        module = "member",
                        view = "settings",
                        image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
                        content = _ "Back to previous page"
                    }
                end
            }

            ui.container {
                attr = { class = "col-md-8 spaceline text-center well-inside" },
                content = function()
                    ui.heading {
                        level = 1,
                        attr = { class = "fittext1 uppercase spaceline spaceline-bottom" },
                        content = _ "Change your login"
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
                            datacontent = _ "In questa pagina puoi modificare il tuo nome utente.",
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
    attr = { class = "vertical well text-center" },
    module = "member",
    action = "update_login",
    routing = {
        ok = {
            mode = "redirect",
            module = "member",
            view = "settings"
        }
    },
    content = function()
        ui.field.text { label = _ "Login", name = "login", value = app.session.member.login }
        ui.tag {
            tag = "input",
            attr = {
                type = "submit",
                class = "btn btn-primary btn-large",
                value = _ "Change login"
            }
        }
    end
}

