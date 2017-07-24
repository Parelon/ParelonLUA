slot.set_layout("custom")

local filter = param.get("filter")
local id = param.get_id() or 0
local create = param.get("create", atom.boolean) or false

local member = app.session.member
areas_selector = Area:build_selector { active = true }
areas_selector:add_order_by("id")

if filter == "my_areas" then
  areas_selector:join("membership", nil, { "membership.area_id = area.id AND membership.member_id = ?", member.id })
else
  areas_selector:join("privilege", nil, { "privilege.unit_id = area.unit_id AND privilege.member_id = ? AND privilege.voting_right", member.id })
end

areas_selector:join("unit", nil, "unit.id = area.unit_id AND NOT unit.public AND unit.active")

if(id ~= 0) then
  areas_selector:add_where("area.unit_id = " .. tostring(id))
end

ui.title(
  function()
    execute.view { module = "unit_private", view = "_list_areas_title", params = { member = member }}
  end
)

execute.view { module = "unit_private", view = "_list_areas_partnership_filters", id = id, params = { filter = filter, create = create } }

execute.view { module = "unit_private", view = "_list_areas_unit_filters", id = id, params = { create = create, filter = filter, unit_selector = unit_selector } }
        
    ui.container {
      attr = { class = "well" },
      content = function()       
                execute.view {
                  module = "area_private",
                  view = "_list",
                  params = { areas_selector = areas_selector, member = app.session.member, create = create }
                }
      end
    }