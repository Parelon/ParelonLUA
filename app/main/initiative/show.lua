--local initiative = Initiative:by_id(param.get_id())
--local issue = initiative.issue
--local area = issue.area
--local unit = area.unit

--execute.view {
--    module = "initiative",
--    view = "_show_bs"
--}

slot.set_layout("custom")

local initiative = Initiative:by_id(param.get_id())

initiative:load_everything_for_member_id(app.session.member_id)

local issue = initiative.issue

local initiator
if app.session.member_id then
  initiator = Initiator:by_pk(initiative.id, app.session.member.id)
end

if app.session.member_id then
  issue:load_everything_for_member_id(app.session.member_id)
end

local initiators_members_selector = initiative:get_reference_selector("initiating_members")
:add_field("initiator.accepted", "accepted")
:add_order_by("member.name")
if initiator and initiator.accepted then
  initiators_members_selector:add_where("initiator.accepted ISNULL OR initiator.accepted")
else
  initiators_members_selector:add_where("initiator.accepted")
end

local initiators = initiators_members_selector:exec()

local initiatives_selector = initiative.issue:get_reference_selector("initiatives")

local class = "initiative_head"

if initiative.polling then
  class = class .. " polling"
end

app.html_title.title = initiative.name
app.html_title.subtitle = _("Initiative ##{id}", { id = initiative.id })

--[[local state = param.get("state")
local orderby = param.get("orderby") or ""
local desc = param.get("desc", atom.boolean)
local interest = param.get("interest")
local scope = param.get("scope")
local view = param.get("view")
local ftl_btns = param.get("ftl_btns", atom.boolean)
local init_ord = param.get("init_ord") or "supporters"]]

local function round(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

ui.title(
  function()
    execute.view {
      module = "initiative",
      view = "_show_ui_title",
      params = { initiative = initiative, issue = issue, initiator = initiator }
    }
  end
)

ui.container {
  attr = { class = "well" },
  content = function()

    execute.view {
      module = "initiative",
      view = "_show_title",
      params = { initiative = initiative}
    }

    execute.view {
      module = "initiative",
      view = "_show_phasebar",
      params = { issue = initiative.issue }

    }
    if app.session.member_id then
      execute.view {
        module = "initiative",
        view = "_show_actions",
        params = { initiative = initiative, issue = issue, initiator = initiator }
      }
    end

    execute.view {
      module = "initiative",
      view = "_show_draft",
      params = { initiative = initiative, initiator = initiator }
    }

    execute.view {
      module = "initiative",
      view = "_show_attachments",
      params = { initiative = initiative, initiator = initiator }
    }

    execute.view {
      module = "initiative",
      view = "_show_suggestions",
      params = { initiative = initiative }
    }

    if app.session:has_access("authors_pseudonymous") then
      execute.view {
        module = "initiative",
        view = "_show_initiators",
        params = { initiative = initiative, initiators = initiators }
      }
    end

    execute.view {
      module = "initiative",
      view = "_show_issue",
      params = { issue = issue }
    }

    if app.session:has_access("all_pseudonymous") then
      execute.view {
        module = "initiative",
        view = "_show_voters",
        params = { initiative = initiative }
      }

      execute.view {
        module = "initiative",
        view = "_show_supporters",
        params = { initiative = initiative, issue = issue }
      }

      execute.view {
        module = "initiative",
        view = "_show_potential_supporters",
        params = { initiative = initiative, issue = issue }
      }

      execute.view {
        module = "initiative",
        view = "_show_population",
        params = { issue = issue }
      }
    end
    
    execute.view {
      module = "initiative",
      view = "_details",
      params = {
        initiative = initiative,
        members_selector = members_selector
      }
    }
  end
}
