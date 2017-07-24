local initiative = param.get("initiative", "table")
local initiator = param.get("initiator", "table")

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-6" },
      content = function()
        ui.heading { level = 3, attr = { class = "label label-warning-tbox" }, content = _ "Full text" }
      end
    }
    ui.heading {
      level = 4,
      attr = { class = "col-md-6" },
      content = _("Latest draft created at #{date} #{time}", {
          date = format.date(initiative.current_draft.created),
          time = format.time(initiative.current_draft.created)
        })
    }
  end
}
ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well-inside paper" },
      content = function()
        local supporter

        if app.session.member_id then
          supporter = app.session.member:get_reference_selector("supporters"):add_where { "initiative_id = ?", initiative.id }:optional_object_mode():exec()
        end

        if supporter and not initiative.issue.closed then
          local old_draft_id = supporter.draft_id
          local new_draft_id = initiative.current_draft.id
          if old_draft_id ~= new_draft_id then
            ui.container {
              attr = { class = "draft_updated_info" },
              content = function()
                slot.put(_ "The draft of this initiative has been updated!")
                slot.put(" ")
                ui.link {
                  content = _ "Show diff",
                  module = "draft",
                  view = "diff",
                  params = {
                    old_draft_id = old_draft_id,
                    new_draft_id = new_draft_id
                  }
                }
                if not initiative.revoked then
                  slot.put(" ")
                  ui.link {
                    text = _ "Refresh support to current draft",
                    module = "initiative",
                    action = "add_support",
                    id = initiative.id,
                    routing = {
                      default = {
                        mode = "redirect",
                        module = "initiative",
                        view = "show",
                        id = initiative.id
                      }
                    }
                  }
                end
              end
            }
          end
        end

        if not show_as_head then
          local drafts_count = initiative:get_reference_selector("drafts"):count()

          execute.view {
            module = "draft",
            view = "_show",
            params = {
              draft = initiative.current_draft
            }
          }
          if initiator and initiator.accepted and not initiative.issue.half_frozen and not initiative.issue.closed and not initiative.revoked then
            ui.container {
              attr = { class = "row" },
              content = function()
                ui.link {
                  attr = { class = "col-md-offset-7 btn btn-primary col-md-2 text-center" },
                  content = _ "Edit draft",
                  module = "draft",
                  view = "new",
                  mode = "put",
                  params = {
                    draft_id = initiative.current_draft.id,
                    initiative_id = initiative.id,
                    area_id = initiative.issue.area_id,
                    unit_id = initiative.issue.area.unit_id,
                    area_name = initiative.issue.area.name,
                    unit_name = initiative.issue.area.unit.name
                  }
                }

                if drafts_count > 1 then
                  ui.link {
                    attr = { class = "btn btn-primary col-md-offset-1 col-md-2 text-center spaceline-bottom" },
                    mode = "redirect",
                    module = "draft",
                    view = "list",
                    params = { initiative_id = initiative.id },
                    text = _("List all revisions (#{count})", { count = drafts_count })
                  }
                end
              end
            }
          end
        end
      end
    }
  end
}