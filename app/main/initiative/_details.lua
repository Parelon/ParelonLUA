local initiative = param.get("initiative", "table")

--execute.view { module = "issue", view = "_details", params = { issue = initiative.issue } }
ui.form {
  record = issue,
  readonly = true,
  attr = { class = "text-left" },
  content = function()
    ui.container {
      attr = { class = "row spaceline" },
      content = function()
        ui.container {
          attr = { class = "col-md-12" },
          content = function()
            ui.heading { level = 3, attr = { class = "label label-warning-tbox spaceline" }, content = _ "Details" }
          end
        }

        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 well-inside paper" },
              content = function()
                ui.field.text {
                  attr = { class = "label" },
                  label = _ "Created at",
                  value = format.timestamp(initiative.created)
                }
                if initiative.revoked then
                  ui.field.text {
                    label = _ "Revoked at",
                    value = format.timestamp(initiative.revoked)
                  }
                end
                if initiative.admitted ~= nil then
                  ui.field.boolean { label = _ "Admitted", name = "admitted" }
                end
                if initiative.issue.fully_frozen and initiative.polling then
                  ui.field.text { label = _ "Admitted", value = "Implicitly admitted" }
                end
                if initiative.issue.closed then
                  ui.field.boolean { label = _ "Direct majority", value = initiative.direct_majority }
                  ui.field.boolean { label = _ "Indirect majority", value = initiative.indirect_majority }
                  ui.field.text { label = _ "Schulze rank", value = tostring(initiative.schulze_rank) .. " (" .. _("Status quo: #{rank}", { rank = initiative.issue.status_quo_schulze_rank }) .. ")" }
                  local texts = {}
                  if initiative.reverse_beat_path then
                    texts[#texts + 1] = _ "reverse beat path to status quo (including ties)"
                  end
                  if initiative.multistage_majority then
                    texts[#texts + 1] = _ "possibly instable result caused by multistage majority"
                  end
                  if #texts == 0 then
                    texts[#texts + 1] = _ "none"
                  end
                  ui.field.text {
                    label = _ "Other failures",
                    value = table.concat(texts, ", ")
                  }
                  ui.field.boolean { label = _ "Eligible as winner", value = initiative.eligible }
                end
              end
            }
          end
        } 
      end
    }
  end
}