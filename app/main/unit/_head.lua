local unit = param.get("unit", "table")
local member = param.get("member", "table")

local show_content = param.get("show_content", atom.boolean)

if app.session.member_id then
  unit:load_delegation_info_once_for_member_id(app.session.member_id)
end

ui.container {
  attr = { class = "row" },
  content = function()
    execute.view { module = "delegation", view = "_info", params = { unit = unit, member = member } }
  end
}
ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-6 col-md-offset-3 col-xs-12 label label-warning text-center h1" },
      content = function()
        if not config.single_unit_id then
          ui.link {
            module = "unit",
            view = "show",
            id = unit.id,
            content = unit.name
          }
        else
          ui.link {
            module = "unit",
            view = "show",
            id = unit.id,
            content = config.instance_name .. " &middot; " .. _ "LiquidFeedback"
          }
        end
      end
    }
  end
}
if show_content then
  ui.container {
    attr = { class = "content row" },
    content = function()
      if member and member:has_voting_right_for_unit_id(unit.id) then
        if app.session.member_id == member.id then
          ui.container {
            attr = { class = "col-md-4 col-md-offset-1 label label-success text-center spaceline spaceline-bottom" },
            content = function()                            
              ui.tag { 
                content = _ "You have voting privileges for this unit" }	
            end
          }	
          slot.put("")
          if unit.delegation_info.first_trustee_id == nil then
            ui.container {
              attr = { class = "col-md-4 col-md-offset-1 text-center" },
              content = function()
                ui.link { 
                  attr = { class = "btn btn-primary large_btn margin_line text-center spaceline  spaceline-bottom" },												
                  text = _ "Delegate unit", 
                  module = "delegation", 
                  view = "show", 
                  params = { unit_id = unit.id } }
              end
            }
          else
            ui.container {
              attr = { class = "col-md-4 col-md-offset-1 text-center" },
              content = function()
                ui.link {
                  attr = { class = "btn btn-primary large_btn margin_line text-center spaceline  spaceline-bottom" }, 
                  text = _ "Change unit delegation", 
                  module = "delegation", view = "show", 
                  params = { unit_id = unit.id } }
              end
            }
          end
        else
          ui.tag { 
            attr = { class = "btn btn-primary large_btn margin_line text-center spaceline-bottom" },
            content = _ "Member has voting privileges for this unit" }
        end
      end
    end
  }
else
  slot.put("<hr/>")
end

