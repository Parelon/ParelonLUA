local for_details = param.get("for_details", atom.boolean) or false
local init_ord = param.get("init_ord") or "event"
local list = param.get("list")

local initiatives = Initiative:new_selector()
:reset_fields()
:add_where { "initiative.issue_id = ?", tonumber(param.get_id()) }
:add_field("initiative.issue_id")
:add_field("initiative.id")
:add_field("initiative.name")
:add_field("initiative.polling")
:add_field("initiative.discussion_url")
:add_field("initiative.created")
:add_field("initiative.revoked")
:add_field("initiative.revoked_by_member_id")
:add_field("initiative.suggested_initiative_id")
:add_field("initiative.admitted")
:add_field("initiative.supporter_count")
:add_field("initiative.informed_supporter_count")
:add_field("initiative.satisfied_supporter_count")
:add_field("initiative.satisfied_informed_supporter_count")
:add_field("initiative.positive_votes")
:add_field("initiative.negative_votes")
:add_field("initiative.direct_majority")
:add_field("initiative.indirect_majority")
:add_field("initiative.schulze_rank")
:add_field("initiative.better_than_status_quo")
:add_field("initiative.worse_than_status_quo")
:add_field("initiative.reverse_beat_path")
:add_field("initiative.multistage_majority")
:add_field("initiative.eligible")
:add_field("initiative.winner")
:add_field("initiative.rank")
:add_field("initiative.text_search_data")
:add_field("initiative.harmonic_weight")
:add_field("initiative.final_suggestion_order_calculated")
:add_field("initiative.title")
:add_field("initiative.brief_description")
:add_field("initiative.competence_fields")
:add_field("initiative.author_type")
:add_field("max(event.id)", "last_event_id")
:left_join("event", nil, "event.initiative_id = initiative.id")
:add_group_by("initiative.issue_id")
:add_group_by("initiative.id")
:add_group_by("initiative.name")
:add_group_by("initiative.polling")
:add_group_by("initiative.discussion_url")
:add_group_by("initiative.created")
:add_group_by("initiative.revoked")
:add_group_by("initiative.revoked_by_member_id")
:add_group_by("initiative.suggested_initiative_id")
:add_group_by("initiative.admitted")
:add_group_by("initiative.supporter_count")
:add_group_by("initiative.informed_supporter_count")
:add_group_by("initiative.satisfied_supporter_count")
:add_group_by("initiative.satisfied_informed_supporter_count")
:add_group_by("initiative.positive_votes")
:add_group_by("initiative.negative_votes")
:add_group_by("initiative.direct_majority")
:add_group_by("initiative.indirect_majority")
:add_group_by("initiative.schulze_rank")
:add_group_by("initiative.better_than_status_quo")
:add_group_by("initiative.worse_than_status_quo")
:add_group_by("initiative.reverse_beat_path")
:add_group_by("initiative.multistage_majority")
:add_group_by("initiative.eligible")
:add_group_by("initiative.winner")
:add_group_by("initiative.rank")
:add_group_by("initiative.text_search_data")
:add_group_by("initiative.harmonic_weight")
:add_group_by("initiative.final_suggestion_order_calculated")
:add_group_by("initiative.title")
:add_group_by("initiative.brief_description")
:add_group_by("initiative.competence_fields")
:add_group_by("initiative.author_type")

if init_ord == "supporters" then
  initiatives:add_order_by("supporter_count DESC")
elseif init_ord == "event" then
  initiatives:add_order_by("last_event_id DESC")
end

if list == "proposals" then
  initiatives:join("current_draft", nil, { "current_draft.initiative_id = initiative.id AND current_draft.author_id = ?", app.session.member_id })
end

if list == "voted" then
  initiatives:join("vote", nil, { "vote.initiative_id = initiative.id AND vote.issue_id = ?", tonumber(param.get_id()) })
end

slot.put("<hr/>")
for i, initiative in ipairs(initiatives:exec()) do
  execute.view {
    module = "initiative",
    view = "_list_summary_element",
    params = {
      for_details = for_details,
      initiative = initiative
    }
  }
  slot.put("<hr/>")
end
