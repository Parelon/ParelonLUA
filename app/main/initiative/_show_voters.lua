local initiative = param.get("initiative", "table")

--if initiative.issue.fully_frozen and initiative.issue.closed then
--  local members_selector = initiative.issue:get_reference_selector("direct_voters"):left_join("vote", nil, { "vote.initiative_id = ? AND vote.member_id = member.id", initiative.id }):add_field("direct_voter.weight as voter_weight"):add_field("coalesce(vote.grade, 0) as grade"):add_field("direct_voter.comment as voter_comment"):left_join("initiative", nil, "initiative.id = vote.initiative_id"):left_join("issue", nil, "issue.id = initiative.issue_id")

--  ui.container {
--    attr = { class = "row spaceline" },
--    content = function()
--      ui.container {
--        attr = { class = "col-md-3" },
--        content = function()
--          ui.heading {
--            level = 3,
--            attr = { class = "label label-warning-tbox" },
--            content = _ "Voters"
--          }
--        end
--      }
--    end
--  }

--  execute.view {
--    module = "member",
--    view = "_list",
--    params = {
--      initiative = initiative,
--      for_votes = true,
--      members_selector = members_selector,
--      paginator_name = "voter"
--    }
--  }
--end

if initiative.issue.fully_frozen and initiative.issue.closed and initiative.admitted then
  local class = initiative.winner and "admitted_info" or "not_admitted_info"
  ui.container {
    attr = { class = class },
    content = function()
      local max_value = initiative.issue.voter_count
      slot.put("&nbsp;")
      local positive_votes = initiative.positive_votes
      local negative_votes = initiative.negative_votes
      local sum_votes = initiative.positive_votes + initiative.negative_votes
      local function perc(votes, sum)
        if sum > 0 and votes > 0 then return " (" .. string.format("%.f", votes * 100 / sum) .. "%)" end
        return ""
      end

      slot.put(_ "Yes" .. ": <b>" .. tostring(positive_votes) .. perc(positive_votes, sum_votes) .. "</b>")
      slot.put(" &middot; ")
      slot.put(_ "Abstention" .. ": <b>" .. tostring(max_value - initiative.negative_votes - initiative.positive_votes) .. "</b>")
      slot.put(" &middot; ")
      slot.put(_ "No" .. ": <b>" .. tostring(initiative.negative_votes) .. perc(negative_votes, sum_votes) .. "</b>")
      slot.put(" &middot; ")
      slot.put("<b>")
      if initiative.winner then
        slot.put(_ "Approved")
      elseif initiative.rank then
        slot.put(_("Not approved (rank #{rank})", { rank = initiative.rank }))
      else
        slot.put(_ "Not approved")
      end
      slot.put("</b>")
    end
  }
end

ui.container {
  attr = { class = "content" },
  content = function()
    execute.view {
      module = "initiative",
      view = "_battles",
      params = { initiative = initiative }
    }
  end
}