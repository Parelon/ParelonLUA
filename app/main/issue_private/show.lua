slot.set_layout("custom")

local issue_id = param.get_id()
local issue = Issue:by_id(issue_id)
local state = param.get("state")
local orderby = param.get("orderby") or ""
local desc = param.get("desc", atom.boolean)
local interest = param.get("interest")
local scope = param.get("scope")
local view = param.get("view")
local ftl_btns = param.get("ftl_btns", atom.boolean)
local init_ord = param.get("init_ord") or "supporters"

if not issue.area.unit.public then
  request.redirect {
    module = "issue_private",
    view = "show",
    id = param.get_id(),
    params = param.get_all_cgi()
  }
else
  local function round(num, idp)
    return tonumber(string.format("%." .. (idp or 0) .. "f", num))
  end

  if app.session.member_id then
    issue:load_everything_for_member_id(app.session.member_id)
  end

  if not app.html_title.title then
    app.html_title.title = _("Issue ##{id}", { id = issue.id })
  end

  ui.title(function()
      execute.view {
        module = "issue_private",
        view = "_show_ui_title",
        params = { issue = issue }
      }
    end
  )

  ui.container {
    attr = { class = "row" },
    content = function()
      ui.container {
        attr = { class = "col-md-12 well-blue" },
        content = function()
          execute.view {
            module = "issue_private",
            view = "_show_title",
            params = { issue = issue }
          }

          execute.view {
            module = "issue_private",
            view = "_show_state",
            params = { issue = issue }
          }

          execute.view {
            module = "issue_private",
            view = "_show_description",
            params = { issue = issue }
          }

          execute.view {
            module = "issue_private",
            view = "_show_keywords",
            params = { issue = issue }
          }

          execute.view {
            module = "issue_private",
            view = "_show_aim",
            params = { issue = issue }
          }

          execute.view {
            module = "issue_private",
            view = "_show_resources",
            params = { issue = issue }
          }

          if app.session.member_id then
            execute.view {
              module = "issue_private",
              view = "_show_actions",
              params = { issue = issue }
            }
          end

          execute.view {
            module = "issue_private",
            view = "_show_initiatives",
            params = { issue = issue }
          }

          if app.session:has_access("authors_pseudonymous") then
            execute.view {
              module = "issue_private",
              view = "_show_initiators",
              params = { issue = issue }
            }
          end

          if app.session:has_access("all_pseudonymous") then
            execute.view {
              module = "issue_private",
              view = "_show_population",
              params = { issue = issue }
            }
          end
          
          execute.view {
            module = "issue_private",
            view = "_details",
            params = { issue = issue }
          }
        end
      }
    end
  }

  ui.script { static = "js/jquery.quorum_bar.js" }
  ui.script { script = "jQuery('#quorum_box').quorum_bar(); " }

end