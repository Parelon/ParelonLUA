-- TODO: rename in show.lua

slot.set_layout("custom")

local create = param.get("create", atom.boolean) or false
local area = Area:by_id(param.get_id())
local state = param.get("state") or "any"
local scope = param.get("scope") or "all_units"
local orderby = param.get("orderby") or "creation_date"
local desc = param.get("desc", atom.boolean) or false
local interest = param.get("interest") or "any"
local member = app.session.member
--local ftl_btns = param.get("ftl_btns", atom.boolean) or false

app.html_title.title = area.name
app.html_title.subtitle = _("Area")

ui.title(function()
    execute.view {
      module = "area_private",
      view = "_show_title",
      params = { area = area }
    }
  end
)

execute.view {
  module = "area_private",
  view = "_show_state_filters",
  params = { area = area, create = create, state = state }
}


local selector = area:get_reference_selector("issues")

execute.chunk {
  module = "issue_private",
  chunk = "_filters_ext",
  params = {
    state = state,
    orderby = orderby,
    desc = desc,
    interest = interest,
    selector = selector
  }
}

-- Category, used for routing
local category

-- This holds issue-oriented description text for shown issues
local issues_desc

if state == "admission" then
  issues_desc = Issue:get_state_name_for_state('admission')
elseif state == "development" then
  issues_desc = _ "Development"
elseif state == "discussion" then
  issues_desc = Issue:get_state_name_for_state('discussion')
elseif state == "voting" then
  issues_desc = Issue:get_state_name_for_state('voting')
elseif state == "verification" then
  issues_desc = Issue:get_state_name_for_state('verification')
elseif state == "committee" then
  issues_desc = _"Committee"
elseif state == "closed" then
  issues_desc = _ "Closed"
elseif state == "canceled" then
  issues_desc = _ "Canceled"
elseif state == "finished" then
  issues_desc = _ "Finished"
elseif state == "finished_with_winner" then
  issues_desc = _ "Finished (with winner)"
elseif state == "finished_without_winner" then
  issues_desc = _ "Finished (without winner)"
elseif state == "open" then
  issues_desc = _ "Open"
elseif state == "any" then
  issues_desc = _ "Any"
else
  issues_desc = _ "Unknown"
end

--[[if state == "development" or state == "verification" or state == "discussion" or state == "voting" or state == "committee" then
  btns = {
    default_state = 'development',
    state = { { "discussion", "verification", "voting", "committee" } },
    default_interest = 'any',
    interest = { { "any", "not_interested", "interested", "initiated" }, { "supported", "potentially_supported", "voted" } }
  }
elseif state == "closed" or state == "canceled" or state == "finished" then
  btns = {
    default_state = 'closed',
    default_interest = 'any',
    interest = { { "any", "not_interested", "interested", "initiated" }, { "supported", "potentially_supported", "voted" } }
  }
elseif state == "admission" then
  btns = {
    default_state = 'admission',
    default_interest = 'any',
    interest = { { "any", "not_interested", "interested", "initiated" }, { "supported", "potentially_supported", "voted" } }
  }
end

if state == "development" then
  execute.chunk {
    module = "issue_private",
    chunk = "_filters_btn2_bs",
    id = area.id,
    params = {
      state = state,
      orderby = orderby,
      desc = desc,
      interest = interest,
      btns = btns,
      ftl_btns = ftl_btns
    }
  }
end]]

execute.view {
  module = "area_private",
  view = "_show_order_filters",
  params = { area = area, state = state, orderby = orderby, desc = desc }
}


ui.container {
  attr = { id = "issues_box", class = "row spaceline" },
  content = function()
    execute.view {
      module = "issue_private",
      view = "_list",
      params = {
        state = state,
        orderby = orderby,
        desc = desc,
        interest = interest,
        scope = scope,
        ftl_btns = ftl_btns,
        issues_selector = selector,
        view = "area",
        member = member
      }
    }
  end
}