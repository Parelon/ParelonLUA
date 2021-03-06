local initiative = param.get("initiative", "table")
local issue = param.get("issue", "table")

local members_selector = initiative:get_reference_selector("supporting_members_snapshot"):join("issue", nil, "issue.id = direct_supporter_snapshot.issue_id"):join("direct_interest_snapshot", nil, "direct_interest_snapshot.event = issue.latest_snapshot_event AND direct_interest_snapshot.issue_id = issue.id AND direct_interest_snapshot.member_id = member.id"):add_field("direct_interest_snapshot.weight"):add_where("direct_supporter_snapshot.event = issue.latest_snapshot_event"):add_where("NOT direct_supporter_snapshot.satisfied"):add_field("direct_supporter_snapshot.informed", "is_informed")

if issue.fully_frozen then
  ui.container {
    attr = { class = "row spaceline" },
    content = function()
      ui.container {
        attr = { class = "col-md-10" },
        content = function()
          ui.heading {
            level = 3,
            attr = { class = "label label-warning-tbox" },
            content = _ "Potential supporters (before begin of voting)"
          }
        end
      }
    end
  }
else
  ui.container {
    attr = { class = "row spaceline" },
    content = function()
      ui.container {
        attr = { class = "col-md-10" },
        content = function()
          ui.heading {
            level = 3,
            attr = { class = "label label-warning-tbox" },
            content = _ "Potential supporters"
          }
        end
      }
    end
  }
end

ui.container {
  attr = { class = "row" },
  content = function()
    execute.view {
      module = "member",
      view = "_list",
      params = {
        initiative = initiative,
        members_selector = members_selector,
        paginator_name = "potential_supporters"
      }
    }
  end
}
