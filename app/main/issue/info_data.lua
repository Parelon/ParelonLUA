local issue = param.get("issue", "table")

ui.container {
  attr = { class = "col-md-5 spaceline" },
  content = function()
    ui.heading {
      level = 3,
      content = _("Unit '#{name}'", {name = issue.area.unit.name})
    }
    ui.heading {
      level = 3,
      content = _("Area '#{name}'", { name = issue.area.name })
    }
    ui.heading {
      level = 3,
      content = _("Policy '#{name}'", {name = issue.policy.name})
    }
    ui.heading {
      level = 3,
      content = function()
        ui.tag { content = _ "Issue created at:" }
        ui.tag { tag = "strong", content = "  " .. format.timestamp(issue.created) }
      end
    }
    --                slot.put("<br>")
    --                ui.heading {
    --                    level = 3,
    --                    attr = { class = "spaceline" },
    --                    content = function()
    --                        ui.tag { content = _ "Time limit to reach the next phase:" }
    --                        ui.tag { tag = "strong", content = "  " .. format.interval_text(issue.state_time_left, { mode = "time_left" }) }
    --                    end
    --                }
  end
}
if app.session.member then
  if issue.member_id and issue.member_id > 0 then
    execute.view { module = "member", view = "_info_data", id = issue.member_id, params = { module = "issue", view = "show_ext_bs", content_id = issue.id } }
  else
    ui.heading { level = 6, content = _ "No author for this issue" }
  end                                
end