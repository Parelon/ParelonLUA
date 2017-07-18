local area = param.get("area", "table")
local member = param.get("member", "table")
local create = param.get("create", atom.boolean) or false

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well-inside paper" },
      content = function()
        ui.container {
          attr = { class = "col-md-3 text-center spaceline" },
          content = function()
            if create then
              if app.session.member.elected then
                ui.link {
                  module = "wizard",
                  view = "shortcut",
                  params = { area_id = area.id },
                  attr = { class = "label label-warning" },
                  image = { attr = { class = "icon-mid" }, static = image},
                  content = function()
                    -- ui.heading { level = 3, content = _ "AREA " .. area.id }
                    if area.unit.image then
                      slot.put(area.unit.image)
                    else
                      ui.image { attr = { class = "icon-medium" }, static = "png/discussion.png" }
                    end
                    ui.heading { level = 4, content = _ "" .. area.unit.name }
                  end
                }
              else
                ui.link {
                  module = "wizard",
                  view = "page1",
                  params = { area_id = area.id },
                  attr = { class = "label label-warning" },
                  --image = {attr = { class = "img-unit" }, static = image},
                  content = function()
                    --  ui.heading { level = 3, content = _ "AREA " .. area.id }
                    if area.unit.image then
                      slot.put(area.unit.image)
                    else
                      ui.image { attr = { class = "icon-medium" }, static = "png/discussion.png" }
                    end
                    ui.heading { level = 4, content = _ "" .. area.unit.name }				                                    
                  end
                }
              end
            else
              ui.link {
                module = "area",
                view = "show",
                id = area.id,
                attr = { class = "label label-warning" },
                --image = {attr = { class = "img-unit" }, static = image},
                content = function()
                  --  ui.heading { level = 3, content = _ "AREA " .. area.id }
                  if area.unit.image then
                    slot.put(area.unit.image)
                  else
                    ui.image { attr = { class = "icon-medium" }, static = "png/documentation.png" }
                  end
                  ui.heading { level = 4, content = area.unit.name }				                               
                end
              }
            end
          end
        }
        ui.container {
          attr = { class = "row text-center" },
          content = function()
            execute.view { module = "area", view = "_head", params = { area = area, hide_unit = true, show_content = true, member = member, create = create } }
            --          end }
            --        end }
            ui.tag {attr = { class = "h2 spaceline-bottom" },content = _ "Issues:" }
            slot.put("<br />")
            if not create then
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "admission" },
                text = _("#{count} new", { count = area.issues_new_count })
              }
              slot.put("")
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "discussion" },
                text = _("#{count} in discussion", { count = area.issues_discussion_count })
              }
              slot.put("")
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "verification" },
                text = _("#{count} in verification", { count = area.issues_frozen_count })
              }
              slot.put("")
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "voting" },
                text = _("#{count} in voting", { count = area.issues_voting_count })
              }
              slot.put("")
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "finished" },
                text = _("#{count} finished", { count = area.issues_finished_count })
              }
              slot.put("")
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "canceled" },
                text = _("#{count} canceled", { count = area.issues_canceled_count })
              }
            end
          end
        }
      end
    }
  end
}
