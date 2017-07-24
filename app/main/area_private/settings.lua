local area = Area:by_id(param.get_id())
local membership = Membership:by_pk(area.id, app.session.member.id)

if membership then
  ui.container {
    attr = { class = "row" },
    content = function()
      ui.container {
        attr = { class = "col-md-12" },
        content = function()
          ui.tag { attr = { class = "label label-success margin_line spaceline" }, content = _ "You are participating in this area" }    
          ui.tag {
            content = function()
              slot.put("")
              ui.link {
                attr = { class = "label label-inverse margin_line spaceline" },
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
            end
          }
        end
      }
    end
  }
elseif app.session.member:has_voting_right_for_unit_id(area.unit_id) then
  ui.link {
    attr = { class = "btn btn-primary large_btn margin_line text-center spaceline" },
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

if app.session.member then
  area:load_delegation_info_once_for_member_id(app.session.member.id)
end

if app.session.member:has_voting_right_for_unit_id(area.unit_id) then
  ui.container {
    attr = { class = "row" },
    content = function()
      ui.container {
        attr = { class = "col-md-12 col-sm-12 col-xs-12 pull-right" },
        content = function()
          if area.delegation_info.own_delegation_scope ~= "area" then
            ui.link {
              attr = { class = "btn btn-primary large_btn margin_line text-center spaceline" }, 
              text = _ "Delegate area", 
              module = "delegation", 
              view = "show", 
              params = { area_id = area.id } }
          else
            ui.link {
              attr = { class = "btn btn-primary large_btn margin_line text-center spaceline" }, 
              text = _ "Change area delegation",
              module = "delegation", 
              view = "show", 
              params = { area_id = area.id } }
          end
        end
      }
    end
  }
end

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 col-sm-12 col-xs-12 pull-right" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary large_btn margin_line text-center spaceline" }, 
          text = _ "Close"
        }
      end
    }
  end
}