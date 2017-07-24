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
                      slot.put(_("Edit member: #{firstname} #{lastname}", { firstname = member.firstname, lastname = member.lastname }))
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
  attr = { class = "vertical well" },
  module = "auditor",
  action = "member_update",
  record = member,
  readonly = not app.session.member.admin and not app.session.member.auditor,
  id = id,
  routing = {
    default = {
      mode = "redirect",
      modules = "auditor",
      view = "index"
    }
  },
  content = function()
    ui.field.text { label = _ "Identification", name = "identification", attr = { placeholder = _"Full name" } }
    ui.field.text { label = _ "Notification email", name = "notify_email", attr = { placeholder = _"example@example.org" } }
    ui.field.text { label = _ "NIN", name = "nin", attr = { placeholder = _"XXXXXX00X00X000X" } }
    if id ~= 0 then
      ui.field.text { label = _ "Screen name", name = "name" }
      ui.field.text { label = _ "Login name", name = "login" }
    end

    if app.session.member.admin then
      ui.field.boolean { label = _ "Admin?", name = "admin" }
      ui.field.boolean { label = _ "Auditor?", name = "auditor" }
    end
    ui.field.boolean { label = _ "LQFB Access?", name = "lqfb_access", value = true } 
--      ui.field.boolean { label = _ "Elected?", name = "elected" }

    slot.put("<br />")

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
              value = member and member:has_voting_right_for_unit_id(unit.id) or app.session.member:has_voting_right_for_unit_id(unit.id)
            }
          end
        }
      }
    }
    slot.put("<br /><br />")

    if not member or not member.activated then
      ui.field.boolean { label = _ "Send invite?", name = "invite_member", value = true }
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