local issue = param.get("issue", "table")
local initiative_limit = param.get("initiative_limit", atom.integer)
local for_member = param.get("for_member", "table")
local for_listing = param.get("for_listing", atom.boolean)
local for_initiative = param.get("for_initiative", "table")
local for_initiative_id = for_initiative and for_initiative.id or nil
local state = param.get("state")
local orderby = param.get("orderby") or ""
local desc = param.get("desc", atom.boolean)
local interest = param.get("interest")
local scope = param.get("scope")
local view = param.get("view")
local ftl_btns = param.get("ftl_btns", atom.boolean)


local direct_voter
if app.session.member_id then
  direct_voter = issue.member_info.direct_voted
end

local voteable = app.session.member_id and issue.state == 'voting' and
app.session.member:has_voting_right_for_unit_id(issue.area.unit_id)

local vote_comment_able = app.session.member_id and issue.closed and direct_voter

local vote_link_text
if voteable then
  vote_link_text = direct_voter and _ "Change vote" or _ "Vote now"
elseif vote_comment_able then
  vote_link_text = direct_voter and _ "Update voting comment"
end


-- Uncomment the following to use svgz instead of svg
local svgz = ""
--local svgz = "z"
ui.container {
  attr = { class = "well-blue" },
  content = function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "label label-warning", style = "width:100%;" },
          content = function()
            ui.container {
              attr = { class = "col-md-1" },
              content = function()
              end
            }        
            ui.container {
              attr = { class = "col-md-2 text-right" },
              content = function()
                ui.heading {level = 5, content = "Questione o Problema N° " .. issue.id .. " : " }
              end
            }
            ui.container {
              attr = { class = "col-md-8 text-center" },
              content = function()
                ui.heading {level = 1, content = (issue.title and issue.title or _ "No title for this issue") }
              end
            }
          end
        }
      end
    }

    ui.container {
      attr = { class = "row well-inside" },
      content = function()
        local image = issue.state
        if issue.state == "finished_without_winner" or issue.state == "finished_with_winner" then
          image = "finished"
        elseif issue.state == "canceled_no_initiative_admitted" then
          image = "delete"
        end
        ui.container {
          attr = { class = "col-md-2 col-sm-3 col-xs-4" },
          content = function()
            ui.image { attr = { class = "icon-big label-notice spaceline spaceline-bottom" }, static = "png/" .. image ..".png" }
          end
        }
        ui.container {
          attr = { class = "col-md-10 col-sm-9 col-xs-8 spaceline" },
          content = function()
            ui.tag 
            {
              tag="textarea",
              attr = {
                class = "h5 text-justify paper",
                disabled = "true",
                style = "font-style: italic; width: 96%; border: unset; resize: unset;",
                rows = "2",
                maxlength = "140"
              },
              content = (issue.brief_description or _"Issue without abstract")
            }            
          end
        }
      end
    }

    ui.container {
      attr = { class = "row spaceline" },
      content = function()
        ui.container {
          attr = { class = "col-md-12" },
          content = function()
            local content = #issue.initiatives .. _ " INITIATIVES TO RESOLVE THE ISSUE"
            --end
            ui.heading { level = 3, attr = { class = "label label-warning-tbox" }, content = content }
          end
        }
        ui.container {
          attr = { class = "row spaceline-bottom" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 well-inside paper", style = "max-height:500px; overflow:auto;" },
              content = function()
                local initiatives_selector = issue:get_reference_selector("initiatives")
                local highlight_string = param.get("highlight_string")
                if highlight_string then
                  initiatives_selector:add_field({ '"highlight"("initiative"."name", ?)', highlight_string }, "name_highlighted")
                end
                execute.view {
                  module = "initiative",
                  view = "_list_summary",
                  id = issue.id,
                  params = {
                    initiatives_selector = initiatives_selector,
--                    highlight_initiative = for_initiative,
--                    highlight_string = highlight_string,
--                    no_sort = true,
--                    limit = (for_listing or for_initiative) and 5 or nil,
--                    hide_more_initiatives = true,
                    for_member = for_member,
                    for_details = false -- must be FALSE
                  }
                }
              end
            }
          end
        }
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.link {
              attr = { id = "issue_see_det_" .. issue.id, class = "col-md-12 text-center" },
              module = "issue_private",
              view = "show",
              id = issue.id,
              params = {
                view = "area",
                state = state,
                orderby = orderby,
                desc = desc,
                interest = interest,
                scope = scope,
                view = view,
                ftl_btns = ftl_btns
              },
              content = function()
                ui.heading { level = 3, attr = { class = "btn btn-primary large_btn" }, content = _ "Read" }
              end
            }
          end
        }
      end
    }   
  end
}
ui.container {
  attr = { class = "row" },
  content = function()
    slot.put("<hr/>")    
  end
}


