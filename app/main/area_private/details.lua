local area = Area:by_id(param.get_id())
local members_selector = area:get_reference_selector("members"):add_where("member.active")
local delegations_selector = area:get_reference_selector("delegations"):join("member", "truster", "truster.id = delegation.truster_id AND truster.active"):join("member", "trustee", "trustee.id = delegation.trustee_id AND trustee.active")

if app.session:has_access("all_pseudonymous") then
  ui.container {
    attr = { class = "row" },
    content = function()
      ui.link {
        text = _ "Participants" .. " (" .. tostring(members_selector:count()) .. ")",
        icon = { static = "icons/16/group.png" },
        module = "member",
        view = "_list",
        params = { members_selector = members_selector },
        attr = { class = "col-md-2 btn btn-primary text-center fixclick" }
      }
    end
  }
  ui.container {
    attr = { class = "row" },
    content = function()
      ui.link {
        text = _ "Delegations" .. " (" .. tostring(delegations_selector:count()) .. ")",
        icon = { static = "icons/16/table_go.png" },
        module = "delegation",
        view = "_list",
        params = { delegations_selector = delegations_selector },
        attr = { class = "col-md-2 btn btn-primary text-center fixclick" }
      }
    end
  }
end