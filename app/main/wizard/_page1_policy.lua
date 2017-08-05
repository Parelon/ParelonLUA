local area = param.get("area", "table")
local selectedId = param.get("policy_id", atom.integer) or 0;
trace.debug("selectedId: " .. tostring(selectedId))
local area_policies = AllowedPolicy:get_policy_by_area_id(area.id)
local policies = {}

for i, policy in ipairs(area_policies) do  
  policies[i] = { id = policy.policy_id, name = Policy:by_id(policy.policy_id).name }
end

ui.container {
  attr = { class = "well" },
  content = function()
    ui.container {
      attr = { class = "row well-inside" },
      content = function()
        --valore selezionato
        ui.field.hidden {
          html_name = "policy_id",
          attr = { id = "policy_id" },
          value = selectedId
        }
        ui.heading { level = 2, attr = { class = "uppercase text-center spaceline" }, content = _ "How much time does your proposal need to be examined?" }
        --radio-button group
        ui.field.parelon_group_radio {
          id = "policy_id",
          out_id = "policy_id",
          elements = policies,
          selected = selectedId,
          attr = { class = "parelon-checkbox spaceline" },
          label_attr = { class = "parelon-label spaceline" }
        }
      end
    }
  end
}