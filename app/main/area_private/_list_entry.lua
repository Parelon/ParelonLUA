local area = param.get("area", "table")
local member = param.get("member", "table")
local create = param.get("create", atom.boolean) or false
    
    ui.container {
      attr = { class = "row well-inside text-center" },
      content = function()
            if create then
              if app.session.member.elected then
            ui.container {
             attr = { class = "col-md-8 col-md-offset-2" },
              content = function()
                ui.heading { attr = { class = "spaceline2" }, level = 2, content = _ "Area Tematica: "}
                execute.view { module = "area", view = "_head", params = { area = area, hide_unit = true, show_content = true, member = member, create = create } }
              end
            }
          else
            ui.container {
             attr = { class = "col-md-8 col-md-offset-2" },
              content = function()
                ui.heading { attr = { class = "spaceline2" }, level = 2, content = _ "Unità territoriale o tavolo di lavoro: " .. area.unit.name }
                ui.heading { attr = { class = "spaceline2" }, level = 2, content = _ "Area Tematica: "}
                execute.view { module = "area", view = "_head", params = { area = area, hide_unit = true, show_content = true, member = member, create = create } }
              end
            }
            ui.container {
              attr = { class = "col-md-8 col-md-offset-2 " },
              content = function() 
                ui.link {
                  module = "wizard",
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
                    ui.heading { level = 4, content = _ "Raises a problem or issue that concerns this topic, and proposes a solution."}

                  end
                }
              end
            }                
              end
            else             
            end
            ui.container {
              attr = { class = "col-md-12 text-center" },
              content = function() 
            --          end }
            --        end }
 --           ui.tag {attr = { class = "h2 spaceline-bottom" },content = _ "Issues:" }
            if not create then
            ui.container {
              attr = { class = "col-md-2 label spaceline2" },
              content = function()               
                  ui.heading { attr = { class = "spaceline" }, level = 3, content = _ "Unità territoriali o tavoli di lavoro: "}
                  ui.link {
                    module = "area",
                    view = "show",
                    id = area.id,
                    attr = { class = "spaceline" },
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
              
              

            ui.container {
             attr = { class = "col-md-10" },
              content = function()
                ui.heading { attr = { class = "spaceline2" }, level = 2, content = _ "Area Tematica: "}
                execute.view { module = "area", view = "_head", params = { area = area, hide_unit = true, show_content = true, member = member, create = create } }
              end
            }
            ui.container {
             attr = { class = "col-md-12" },
              content = function()
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
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "discussion" },
                text = _("#{count} in discussion", { count = area.issues_discussion_count })
              }
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "verification" },
                text = _("#{count} in verification", { count = area.issues_frozen_count })
              }
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "voting" },
                text = _("#{count} in voting", { count = area.issues_voting_count })
              }
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "finished" },
                text = _("#{count} finished", { count = area.issues_finished_count })
              }
              ui.link {
                attr = { class = "btn btn-primary btn-large btn_margin fixclick spaceline" },
                module = "area",
                view = "show",
                id = area.id,
                params = { state = "canceled" },
                text = _("#{count} canceled", { count = area.issues_canceled_count })
              }
              end
            }
          end
        end
      }
    end
  }