local area = param.get("area", "table")
local member = param.get("member", "table")
local create = param.get("create", atom.boolean) or false

ui.container {
  attr = { class = "paper well-inside spaceline-bottom" },
  content = function()

    execute.view { module = "area_private", view = "_head", params = { area = area, hide_unit = true, show_content = true, member = member, create = create } }
    
    ui.container {
      attr = { class = "row spaceline-bottom" },
      content = function()
        slot.put("<hr/>")
        if not create then      
          ui.container {
            attr = { class = "col-md-offset-5 col-md-2" },
            content = function()
              ui.link {
                attr = { class = "btn btn-primary btn-large" },
                module = "area_private",
                view = "show",
                id = area.id,
                content = _"Read all"
              }
            end
          }
--          ui.container {
--            attr = { class = "col-md-offset-2 col-md-2" },
--            content = function()
--              ui.container {
--                attr = { class = "btn btn-primary btn-large" },
--                content = _ "Filter"
--              }
--            end
--          }
        else
          ui.container {
            attr = { class = "col-md-offset-5 col-md-2" },
            content = function()
              ui.link {
                attr = { class = "btn btn-primary btn-large" },
                module = "wizard_private",
                view = "page1",
                params = { area_id = area.id },
                content = _"Write"
              }
            end
          }
        end
      end
    }
  end
}

--ui.container {
--  attr = { class = "row well-inside text-center" },
--  content = function()
--    ui.container {
--      attr = { class = "col-md-12" },
--      content = function()
--        ui.link {
--          attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
--          module = "area",
--          view = "show",
--          id = area.id,
--          params = { state = "admission" },
--          text = _("#{count} new", { count = area.issues_new_count })
--        }
--        ui.link {
--          attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
--          module = "area",
--          view = "show",
--          id = area.id,
--          params = { state = "discussion" },
--          text = _("#{count} in discussion", { count = area.issues_discussion_count })
--        }
--        ui.link {
--          attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
--          module = "area",
--          view = "show",
--          id = area.id,
--          params = { state = "verification" },
--          text = _("#{count} in verification", { count = area.issues_frozen_count })
--        }
--        ui.link {
--          attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
--          module = "area",
--          view = "show",
--          id = area.id,
--          params = { state = "voting" },
--          text = _("#{count} in voting", { count = area.issues_voting_count })
--        }
--        ui.link {
--          attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
--          module = "area",
--          view = "show",
--          id = area.id,
--          params = { state = "finished" },
--          text = _("#{count} finished", { count = area.issues_finished_count })
--        }
--        ui.link {
--          attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
--          module = "area",
--          view = "show",
--          id = area.id,
--          params = { state = "canceled" },
--          text = _("#{count} canceled", { count = area.issues_canceled_count })
--        }
--      end
--    }
--  end
--}
