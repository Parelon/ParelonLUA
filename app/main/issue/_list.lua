slot.set_layout("custom")

ui.title(function()

    ui.container {
        attr = { class = "row" },
        content = function()                
            ui.container {
                attr = { class = "col-md-3 text-center hidden-xs col-sm-4" },
                content = function()
                    ui.link {
                        attr = { class = "btn btn-primary fixclick btn-back" },
                        module = "index",
                        view = "index",
                        params = { initiative_id = param.get_id() },
                        image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
                        content = _ "Back to previous page"
                    }
                end
            }
            ui.container {
                attr = { class = "spaceline col-md-6 well-inside paper text-center col-xs-12 col-sm-8" },
                content = function()
                    ui.heading {
                        level = 1,
                        content = function()
                            slot.put(_("<strong>#{realname}.</strong>", { realname = (app.session.member.realname and app.session.member.realname or app.session.member.login) }))
                        end
                    }

                    ui.heading { level = 6, content = _("Ti trovi ora nell' Elenco delle discussioni.", { realname = (app.session.member.realname and app.session.member.realname or app.session.member.login) }) }
                end
            }
            --[[ mobile button-back ]]
             ui.container {
                attr = { class = "col-md-12 text-center hidden-sm hidden-md hidden-lg" },
                content = function()
                    ui.link {
                        attr = { class = "btn btn-primary fixclick btn-back" },
                        module = "index",
                        view = "index",
                        params = { initiative_id = param.get_id() },
                        image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
                        content = _ "Back to previous page"
                    }
                end
            }
            --[[ End mobile button-back ]]
            ui.container {
                attr = { class = "col-md-3 col-sm-12 hidden-xs text-right" },
                content = function()
                    ui.field.popover {
                        attr = {
                            dataplacement = "left",
                            datahtml = "true";
                            datatitle = _ "Box di aiuto per la pagina",
                            datacontent = _ "<h3 class='spaceline-bottom'>Argomento: La delega per questione</h3>".."<p class='spaceline-bottom'>Una delega per questa questione ha precedenza rispetto ad una potenziale/esistente delega globale e/o ad una delega dell'area tematica. Aggiungendo l'interesse, la delega uscente viene sospesa durante la fase di discussione, ma è attiva nel voto finale se non si effettua la votazione prima della chiusura.</p><br>"..
 "<p class='spaceline-bottom'>E' possibile delegare solo membri della propria lista contatti (potete, in ogni momento, ampliare la vostra lista contatti nell'area Utenti</p><br>"..
 "<p class='spaceline-bottom'>Nota:Potete trovare altri membri selezionando la tab Potenziali votanti nella nell'unità corrispondente, cliccare sul partecipante per visualizzare il suo profilo ed utilizzare Aggiungi ai miei contatti per aggiungerlo alla propria lista contatti.</p><br>"..
"<iframe width='560' height='315' src='https://www.youtube.com/embed/videoseries?list=PLLVi3WpqQgKQY0SARzvwvhNr46NkuIDWm' frameborder='0' allowfullscreen></iframe>",
                            datahtml = "true",
                            class = "text-center"
                        },
                        content = function()
                            ui.image { attr = { class = "icon-medium " },static = "png/tutor.png" }
                        end
                    }
                end
            }
        end
    }
end)


local issues_selector = param.get("issues_selector", "table")
local member = param.get("for_member", "table") or app.session.member
local for_member = param.get("for_member", "table")
local for_state = param.get("for_state")
local for_unit = param.get("for_unit", atom.boolean)
local for_area = param.get("for_area", atom.boolean)


if for_state == "open" then
    issues_selector:add_where("issue.closed ISNULL")
elseif for_state == "closed" then
    issues_selector:add_where("issue.closed NOTNULL")
end

ui.add_partial_param_names {
    "filter",
    "filter_open",
    "filter_voting",
    "filter_interest",
    "issue_list"
}

local filters = execute.load_chunk {
    module = "issue",
    chunk = "_filters.lua",
    params = {
        member = member,
        for_member = for_member,
        state = for_state,
        for_unit = for_unit,
        for_area = for_area
    }
}

filters.content = function()
    ui.paginate {
        per_page = tonumber(param.get("per_page") or 25),
        selector = issues_selector,
        content = function()
            local highlight_string = param.get("highlight_string", "string")
            local issues = issues_selector:exec()
            issues:load_everything_for_member_id(member and member.id or nil)

            ui.container {
                attr = { class = "row" },
                content = function()
            ui.container {
                attr = { class = "col-md-12 well" },
                content = function() 

                    for i, issue in ipairs(issues) do

                        execute.view {
                            module = "issue",
                            view = "_show",
                            params = {
                                issue = issue,
                                for_listing = true,
                                for_member = for_member
                            }
                        }
                    end
                end
            }
        end
     }
     end
    }
end

filters.opened = true
filters.selector = issues_selector

if param.get("no_filter", atom.boolean) then
    filters.content()
else
    ui.filters(filters)
end
