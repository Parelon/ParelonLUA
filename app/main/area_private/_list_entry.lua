local area = param.get("area", "table")
local member = param.get("member", "table")
local create = param.get("create", atom.boolean) or false
    
    ui.container {
      attr = { class = "row well-inside text-center" },
      content = function()
--            ui.container {
--              attr = { class = "col-md-6" },
--              content = function()
 --               execute.view { module = "area", view = "_head", params = { area = area, hide_unit = true, show_content = true, member = member, create = create } }
--              end
--            }
            if create then
              if app.session.member.elected then
          ui.container {
              attr = { class = "col-md-6 col-md-offset-3" },
              content = function()
                ui.link {
                  module = "wizard_private",
                  view = "shortcut",
                  params = { area_id = area.id },
                  attr = { class = "btn btn-primary unit-btn spaceline" },
                  image = { attr = { class = "icon-large" }, static = image},
                  content = function()
                    -- ui.heading { level = 3, content = _ "AREA " .. area.id }
                    if area.unit.image then
                      slot.put(area.unit.image)
                    else
                      ui.image { attr = { class = "icon-large" }, static = "png/discussion.png" }
                    end
                    ui.heading { level = 2, content = _ "" .. area.unit.name }
                  end
                }
              end
            }
          else
            ui.heading { attr = { class = "spaceline" }, level = 2, content = _ "Area Tematica: " .. area.name }
ui.heading { level = 3, content = _ "Raises a problem or issue that concerns this topic, and proposes a solution."}
            ui.container {
              attr = { class = "col-md-6 col-md-offset-3" },
              content = function()              
                ui.link {
                  module = "wizard_private",
                  view = "page1",
                  params = { area_id = area.id },
                  attr = { class = "btn btn-primary unit-btn text-center spaceline" },
                  --image = {attr = { class = "img-unit" }, static = image},
                  content = function()
                    if area.unit.image then
                      slot.put(area.unit.image)
                    else
                      ui.image { attr = { class = "icon-large" }, static = "png/discussion.png" }
                    end
                    ui.heading { level = 2, content = _ "" .. area.unit.name }				                                    
                  end
                }
              end
            }                
              end
            else
            ui.container {
              attr = { class = "col-md-6" },
              content = function()               
                  ui.link {
                    module = "area",
                    view = "show",
                    id = area.id,
                    attr = { class = "label label-info-u spaceline" },
                    --image = {attr = { class = "img-unit" }, static = image},
                    content = function()
                      --  ui.heading { level = 3, content = _ "AREA " .. area.id }
                      if area.unit.image then
                        slot.put(area.unit.image)
                      else
                        ui.image { attr = { class = "icon-large" }, static = "png/documentation.png" }
                      end
                      ui.heading { level = 2, content = area.unit.name }				                               
                    end
                  }
                end
              }              
            end
            ui.container {
              attr = { class = "col-md-12 text-center" },
              content = function() 
            --          end }
            --        end }
 --           ui.tag {attr = { class = "h2 spaceline-bottom" },content = _ "Issues:" }
            if not create then
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "admission" },
                text = _("#{count} new", { count = area.issues_new_count })
              }
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area_private",
                view = "show",
                id = area.id,
                params = { state = "discussion" },
                text = _("#{count} in discussion", { count = area.issues_discussion_count })
              }
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area_private",
                view = "show",
                id = area.id,
                params = { state = "verification" },
                text = _("#{count} in verification", { count = area.issues_frozen_count })
              }
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area_private",
                view = "show",
                id = area.id,
                params = { state = "voting" },
                text = _("#{count} in voting", { count = area.issues_voting_count })
              }
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area_private",
                view = "show",
                id = area.id,
                params = { state = "finished" },
                text = _("#{count} finished", { count = area.issues_finished_count })
              }
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area_private",
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