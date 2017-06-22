slot.set_layout("custom")

local type_id = param.get_id()
local state = param.get("state") or "any"
local scope = param.get("scope") or "all_units"
local orderby = param.get("orderby") or "event"
local desc = param.get("desc", atom.boolean) or false
local interest = param.get("interest") or "any"
local member = app.session.member
local ftl_btns = param.get("ftl_btns", atom.boolean) or false


local issues_selector = param.get("issues_selector", "table")
local member = param.get("for_member", "table") or app.session.member
local for_member = param.get("for_member", "table")
local for_state = param.get("for_state")
local for_unit = param.get("for_unit", atom.boolean)
local for_area = param.get("for_area", atom.boolean)

if for_state == "open" then
    issues_selector:add_where("issue.closed ISNULL")
elseif for_state == "closed" then
    issues_selector:add_where("issue.closed NOTNULL")
end

ui.add_partial_param_names {
    "filter",
    "filter_open",
    "filter_voting",
    "filter_interest",
    "issue_list"
}
local filters = execute.load_chunk {
    module = "issue",
    chunk = "_filters.lua",
    params = {
        member = member,
        for_member = for_member,
        state = for_state,
        for_unit = for_unit,
        for_area = for_area
    }
}


-- Right selector
--[[local issues_selector_myinitiatives = Issue:new_selector()
execute.chunk {
    module = "issue",
    chunk = "_filters_ext",
    params = {
        state = state,
        orderby = orderby,
        desc = desc,
        scope = scope,
        interest = interest,
        selector = issues_selector_myinitiatives
    }
}

if selector then 
  issues_selector_myinitiatives = selector
  selector = nil
else
  slot.put_into("error", "No selector returned from filter")
end
--]]

-- Left selector
--[[local issues_selector_voted = Issue:new_selector()
execute.chunk {
    module = "issue_private",
    chunk = "_filters_ext",
    params = {
        state = state,
        orderby = orderby,
        desc = desc,
        scope = scope,
        interest = "voted",
        selector = issues_selector_voted
    }
}

if selector then
  issues_selector_voted = selector
  selector = nil
else
  slot.put_into("error", "No selector returned from filter")
end
--]]


btns = {
    default_state = 'any',
    state = {
        {
            "any",
            "open",
            "admission",
            "discussion",
            "verification"
        },
        {
            "voting",
            "committee",
            "closed",
            "canceled"
        }
    },
    default_scope = "all_units",
    scope = {
        {
            "all_units",
            "my_units",
            "citizens"
        },
        {
            "electeds",
            "others"
        }
    }
}


ui.container {
    attr = { class = "row" },
    content = function()
        ui.container {
            attr = { class = "col-md-12 text-center" },
            content = function()
                execute.chunk {
                    module = "issue_private",
                    chunk = "_filters_btn2_bs",
                    params = {
                        state = state,
                        orderby = orderby,
                        desc = desc,
                        scope = scope,
                        btns = btns,
                        ftl_btns = ftl_btns
                    }
                }
            end
        }
    end
}

if not issues_selector_voted or not issues_selector_myinitiatives then
    return true
end

            ui.container {
                attr = { class = "well" },
                content = function()

                    for i, issue in ipairs(issues) do

                        execute.view {
                            module = "issue",
                            view = "_show",
                            params = {
                                issue = issue,
                                for_listing = true,
                                for_member = for_member
                            }
                        }
                    end
                end
            }
