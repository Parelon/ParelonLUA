slot.set_layout("custom")
local id = param.get_id() or 0
local member = Member:by_id(id) or nil

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-3 text-center" },
              content = function()
                ui.link {
                  attr = { class = "btn btn-primary btn-back fixclick" },
                  module = "auditor",
                  view = "index",
                  content = function()
                    ui.heading {
                      level = 5,
                      attr = { class = "" },
                      content = function()
                        ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
                        slot.put(_ "Back")
                      end
                    }
                  end
                }
              end
            }
            ui.container {
              attr = { class = "col-md-9 text-center spaceline well-inside" },
              content = function()
                ui.heading { level = 1, attr = { class = "uppercase spaceline" }, content = _ "Auditor Panel" .. " ID:" .. app.session.member_id }
                ui.heading {
                  level = 3,
                  attr = { class = "spaceline-bottom" },
                  content = function()
                    if id ~= 0 then
                      slot.put(_("Edit member: #{name}", { name = member.name and member.name or member.identification }))
                      slot.put(" (Id:" .. member.id .. ")")
                    else
                      slot.put(_ "Register new member")
                    end
                  end
                }
              end
            }
          end
        }
      end
    }
  end
}

local units_selector = Unit:new_selector()

--[[if member then
    units_selector:left_join("privilege", nil, { "privilege.member_id = ? AND privilege.unit_id = unit.id", member.id }):add_field("privilege.voting_right", "voting_right")
end]]

local units

if member then
  units = Unit:get_flattened_tree{member_id = member.id}
else
  units = Unit:get_flattened_tree{}
end

ui.form {
  attr = { class = "vertical" },
  module = "auditor",
  action = "member_update",
  id = member and member.id,
  record = member,
  readonly = not app.session.member.admin,
  routing = {
    ok = {
      mode = "redirect",
      module = "auditor",
      view = "index"
    },
    error = {
      mode = "redirect",
      module = "auditor",
      view = "member_edit",
      id = member and member.id
    }
  },
  content = function()
    ui.field.text { label = _ "Identification", name = "identification" }
    ui.field.text { label = _ "Notification email", name = "notify_email" }
    ui.field.text { label = _ "NIN", name = "nin" }
    if member and member.activated then
      ui.field.text { label = _ "Screen name", name = "name" }
      ui.field.text { label = _ "Login name", name = "login" }
    end
    ui.field.boolean { label = _ "Admin?", name = "admin" }
    ui.field.boolean { label = _ "LQFB Access?", name = "lqfb_access" }
    ui.field.boolean { label = _ "Auditor?", name = "auditor" }
--[[    ui.field.boolean { label = _ "Elected?", name = "elected" }]]

    slot.put("<br />")

    --[[for i, unit in ipairs(units) do
            ui.field.boolean {
                name = "unit_" .. unit.id,
                label = unit.name,
                value = unit.voting_right
            }
        end]]
    ui.list {
      records = units,
      columns = {
        {
          content = function(unit)
            for i = 1, unit.depth - 1 do
              slot.put("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
            end
            local style = ""
            if not unit.active then
              style = "text-decoration: line-through;"
            end
            ui.link {						          
              name = "unit_" .. unit.id,
              text = unit.name
            }
          end
        },
        {
          content = function(unit)
            ui.field.boolean {
              name = "unit_" .. unit.id,
              --label = unit.name,
              value = member and member:has_voting_right_for_unit_id(unit.id) or false
            }
          end
        }
      }
    }
    slot.put("<br /><br />")

    if not member or not member.activated then
      ui.field.boolean { label = _ "Send invite?", name = "invite_member" }
    end

    if member and member.activated then
      ui.field.boolean { label = _ "Lock member?", name = "locked" }
    end

    ui.field.boolean {
      label = _ "Member inactive?",
      name = "deactivate",
      readonly = member and member.active,
      value = member and member.active == false
    }

    slot.put("<br />")
    ui.submit { text = _ "Save" }
  end
}
