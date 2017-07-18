local initiative = param.get("initiative", "table") or Initiative:by_id(param.get_id())

--local initiative = param.get("initiative", "table")
local supporter = Supporter:by_pk(initiative.id, app.session.member.id)

local partial = {
  routing = {
    default = {
      mode = "redirect",
      module = "initiative",
      view = "show_support",
      id = initiative.id
    }
  }
}

local routing = {
  default = {
    mode = "redirect",
    module = request.get_module(),
    view = request.get_view(),
    id = param.get_id_cgi(),
    params = param.get_all_cgi()
  }
}

if not initiative.issue.fully_frozen and not initiative.issue.closed then
  if supporter then
    ui.container {
      attr = { class = "row spaceline text-right" },
      content = function()
        if not supporter:has_critical_opinion() then
          ui.container {
            attr = { class = "col-md-9" },
            content = function()
              ui.image {
                attr = { style = "height: 70px" },
                static = "png/thumb_up.png"
              }
              if initiative.issue.closed then
                slot.put("&nbsp;&nbsp;&nbsp;", _ "You were supporter", "&nbsp;&nbsp;&nbsp;")
              else
                slot.put("&nbsp;&nbsp;&nbsp;", _ "You are supporter", "&nbsp;&nbsp;&nbsp;")
              end
            end
          }
        else
          ui.container {
            attr = { class = "col-md-9 potential_supporter" },
            content = function()
              ui.image {
                static = "thumb_up.png"
              }
              if initiative.issue.closed then
                slot.put("&nbsp;&nbsp;&nbsp;",_ "You were potential supporter", "&nbsp;&nbsp;&nbsp;")
              else
                slot.put("&nbsp;&nbsp;&nbsp;",_ "You are potential supporter", "&nbsp;&nbsp;&nbsp;")
              end
            end
          }
        end
        ui.link {
          attr = { class = "col-md-3 label label-inverse fixclick text-center" },
          text = _ "Withdraw",
          module = "initiative",
          action = "remove_support",
          id = initiative.id,
          routing = routing,
          partial = partial
        }
      end
    }
    --slot.put(") ")
  elseif not initiative.revoked and app.session.member:has_voting_right_for_unit_id(initiative.issue.area.unit_id) then
    ui.container {
      attr = { class = "row spaceline spaceline-bottom" },
      content = function()
        ui.container {
          attr = { class = "col-md-12" },
          content = function()
            local params = param.get_all_cgi()
            params.dyn = nil
            ui.link {
              attr = { class = "btn btn-primary btn_size_fix fixclick h3 text-center" },
              text = _ "Support this initiative",
              module = "initiative",
              action = "add_support",
              id = initiative.id,
              routing = routing,
              partial = partial
            }
          end
        }
      end
    }
  end
end

if not initiative.issue.closed then
  local ignored_initiative = IgnoredInitiative:by_pk(app.session.member.id, initiative.id)
  ui.container {
    attr = { class = "row" },
    content = function()
      ui.container {
        attr = { class = "col-md-12" },
        content = function()
          if ignored_initiative then
            slot.put("&nbsp;&nbsp;&nbsp;", _ "You don't want updates", "&nbsp;&nbsp;&nbsp;")
            ui.link {
              attr = { class = "text-center btn btn-primary btn_size_fix fixclick h3" },
              text = _ "Receive updates",
              module = "initiative",
              action = "update_ignore",
              id = initiative.id,
              params = { delete = true },
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
          else
            ui.link {
              attr = { class = "text-center btn btn-primary btn_size_fix fixclick h3" },
              text = _ "Mute updates",
              module = "initiative",
              action = "update_ignore",
              id = initiative.id,
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
    end
  }
end

