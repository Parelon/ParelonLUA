local area = param.get("area", "table")
local member = param.get("member", "table")
local create = param.get("create", atom.boolean) or false

local show_content = param.get("show_content", atom.boolean)

if app.session.member_id then
  area:load_delegation_info_once_for_member_id(app.session.member_id)
end

ui.container {
  attr = { class = "row spaceline text-center" },
  content = function()
    ui.container {
      attr = { class = "col-md-2 label" },
      content = function()
--        if create then
        ui.image { attr = { class = "icon-large" }, static = "png/documentation.png" }
--        else
--          ui.image { static = "png/" .. area.unit.name .. ".png" }
--        end
        ui.heading { level = 2, content = area.unit.name }
      end
    }
    ui.container {
      attr = { class = "col-md-9" },
      content = function()
        ui.container {
          attr = { class = "row label label-warning spaceline" },
          content = function()
            ui.heading { attr = { class = "col-md-12" }, level = 3, content = area.name }
          end
        }
        ui.container {
          attr = { class = "row" },
          content = function()
            if member then
              -- membership
              ui.container {
                attr = { class = "col-md-7  col-sm-8" },
                content = function()
                  local membership = Membership:by_pk(area.id, member.id)
                  if membership then
                    if app.session.member_id == member.id and not create then
                      ui.tag { attr = { class = "label label-success" }, content = _ "You are participating in this area" }
                      slot.put(" ")
                      ui.tag {
                        content = function()
                          slot.put("")
                          ui.link {
                            attr = { class = "label label-inverse" },
                            text = _ "Withdraw",
                            module = "membership",
                            action = "update",
                            params = { area_id = area.id, delete = true },
                            routing = {
                              default = {
                                mode = "redirect",
                                module = request.get_module(),
                                view = request.get_view(),
                                id = param.get_id_cgi(),
                                params = param.get_all_cgi()
                              }
                            }
                          }
                          slot.put("")
                        end
                      }
                    else
                      ui.tag { content = _ "Member is participating in this area" }
                    end
                  elseif app.session.member_id == member.id and member:has_voting_right_for_unit_id(area.unit_id) and not create then
                    ui.link {
                      attr = { class = "btn btn-primary btn-large margin_line text-center" },
                      text = _ "Participate in this area",
                      module = "membership",
                      action = "update",
                      params = { area_id = area.id },
                      routing = {
                        default = {
                          mode = "redirect",
                          module = request.get_module(),
                          view = request.get_view(),
                          id = param.get_id_cgi(),
                          params = param.get_all_cgi()
                        }
                      }
                    }
                  end
                end
              }
              ui.container {
                attr = { class = "col-md-5 col-sm-4" },
                content = function()
                  if app.session.member_id == member.id and app.session.member:has_voting_right_for_unit_id(area.unit_id) and not create then
                    if area.delegation_info.own_delegation_scope ~= "area" then
                      ui.link {
                        text = _"Delegate area",
                        module = "delegation",
                        view = "show",
                        params = { area_id = area.id },
                        attr = { class = "btn btn-primary btn-large margin_line text-center" }
                      }
                    else
                      ui.link {
                        text = _"Change area delegation",
                        module = "delegation",
                        view = "show",
                        params = { area_id = area.id },
                        attr = { class = "btn btn-primary btn-large margin_line text-center" }
                      }
                    end
                    execute.view{ module = "delegation", view = "_info", params = { area = area, member = member } }
                  end
                end
              }
            end
          end
        }
      end
    }
    ui.container {
      attr = { class = { "col-md-1 spaceline" } },
      content = function()
        execute.view {
          module = "area",
          view = "_event",
          params = { create = create, area = area }
        }
      end
    }
  end
}
