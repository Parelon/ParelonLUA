slot.set_layout("custom")

local id = param.get_id()

local area = Area:by_id(id) or Area:new()

ui.title(function()
    ui.container {
      attr = { class = "row text-left" },
      content = function()
        ui.container {
          attr = { class = "col-md-3" },
          content = function()
            ui.link {
              attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back" },
              module = "admin",
              view = "area_list",
              id = area.unit_id,
              image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
              content = _ "Back"
            }
          end
        }
        ui.heading {
          level = 1,
          attr = { class = "col-md-9 text-center spaceline spaceline-bottom" },
          content = function()
            ui.tag {
              tag = "strong",
              content = _ "Create / edit area"
            }
          end
        }
      end
    }
  end)

ui.form {
  attr = { class = "vertical" },
  record = area,
  module = "admin",
  action = "area_update",
  routing = {
    default = {
      mode = "redirect",
      module = "admin",
      view = "area_list",
      params = { unit_id = area.unit_id }
    }
  },
  id = id,
  content = function()
    policies = Policy:build_selector { active = true }:exec()
    local def_policy = {
      {
        id = "-1",
        name = _ "No default"
      }
    }
    for i, record in ipairs(policies) do
      def_policy[#def_policy + 1] = record
    end

    ui.field.hidden { name = "unit_id", value = area.unit_id }
    ui.field.text { label = _ "Unit", value = area.unit.name, readonly = true }
    ui.field.text { label = _ "Name", name = "name" }
    ui.field.text { label = _ "Description", name = "description", multiline = true }
    ui.field.select {
      label = _ "Default Policy",
      name = "default_policy",
      value = area.default_policy and area.default_policy.id or "-1",
      foreign_records = def_policy,
      foreign_id = "id",
      foreign_name = "name"
    }
    ui.multiselect {
      label = _ "Policies",
      name = "allowed_policies[]",
      foreign_records = policies,
      foreign_id = "id",
      foreign_name = "name",
      connecting_records = area.allowed_policies or {},
      foreign_reference = "id",
    }
    slot.put("<br /><br />")
    ui.field.boolean { label = _ "Active?", name = "active" }
    ui.submit { text = _ "Save" }
  end
}
