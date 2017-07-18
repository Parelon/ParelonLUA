local issue = param.get("issue", "table")

if app.session:has_access("all_pseudonymous") then

  ui.container { attr = { class = "label label-warning-tbox spaceline" }, content = _ "Interested members" }
  local interested_members_selector = issue:get_reference_selector("interested_members_snapshot"):join("issue", nil, "issue.id = direct_interest_snapshot.issue_id"):add_field("direct_interest_snapshot.weight"):add_where("direct_interest_snapshot.event = issue.latest_snapshot_event")
  ui.container {
    attr = { class = "row well" },
    content = function()
      execute.view {
        module = "member",
        view = "_list",
        params = {
          issue = issue,
          members_selector = interested_members_selector
        }
      }
    end
  }

  ui.container {
    attr = { class = "row" },
    content = function()
      ui.container {
        attr = { class = "col-md-12" },
        content = function()
          ui.heading { level = 3, attr = { class = "label label-warning-tbox spaceline" }, content = _ "Population members" }
        end
      }
    end
  }
  local population_members_selector = issue:get_reference_selector("population_members_snapshot"):join("issue", nil, "issue.id = direct_population_snapshot.issue_id"):add_field("direct_population_snapshot.weight"):add_where("direct_population_snapshot.event = issue.latest_snapshot_event")
  ui.container {
    attr = { class = "row well" },
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