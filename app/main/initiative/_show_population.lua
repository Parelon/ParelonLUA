local issue = param.get("issue", "table")

local population_members_selector = issue:get_reference_selector("population_members_snapshot"):join("issue", nil, "issue.id = direct_population_snapshot.issue_id"):add_field("direct_population_snapshot.weight"):add_where("direct_population_snapshot.event = issue.latest_snapshot_event")

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-10" },
      content = function()
        ui.heading { level = 3, attr = { class = "label label-warning-tbox" }, content = _ "Population members" }
      end
    }
    ui.container {
      attr = { class = "row" },
      content = function()
        execute.view {
          module = "member",
          view = "_list",
          params = {
            issue = issue,
            members_selector = population_members_selector
          }
        }
      end
    }
  end
}