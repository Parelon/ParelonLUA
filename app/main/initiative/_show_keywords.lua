local initiative = param.get("initiative", "table")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        ui.heading {
          level = 3,
          attr = { class = "label label-warning-tbox spaceline" },
          content = _ "Keywords"
        }
      end
    }
  end
}
--ui.container {
--  attr = { class = "row" },
--  content = function()
ui.container {
  attr = { class = "well-inside" },
  content = function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-12 spaceline spaceline-bottom" },
          content = function()
            local keywords = Keyword:by_issue_id(initiative.issue.id)
            if #keywords > 0 then
              for i,k in ipairs(keywords) do
                ui.tag {
                  tag = "span",
                  attr = { class = "btn btn-primary btn-large fixclick filter_btn nowrap" },
                  content = function()
                    ui.heading { level = 5, attr = { class = "uppercase" }, content = k.name }
                  end
                }
              end
            else
              ui.heading { level = 4, attr = { class = "uppercase" }, content = _ "No keywords given" }
            end                
          end
        }
      end
    }
  end
}
--  end
--}