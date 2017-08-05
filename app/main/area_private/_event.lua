local create = param.get("create", atom.boolean)
local area = param.get("area", "table")

if app.session.member and not create then
  -- Get member checked events for initiative
  local checked_events = Event:new_selector():join("checked_event", nil, "checked_event.event_id = event.id"):add_where { "checked_event.member_id = ?", app.session.member.id }:exec()
  local checked_events_ids = {}
  for i, checked_event in ipairs(checked_events) do
    checked_events_ids[#checked_events_ids + 1] = checked_event.id
  end

  local chkids
  if #checked_events_ids == 0 then
    chkids = 0
  else
    chkids = table.concat(checked_events_ids, ", ")
  end
  -- Get member unchecked events for initiative
  local unchecked_events = Event:new_selector()
  :left_join("issue", nil, "event.issue_id = issue.id")
  :add_where { "issue.closed ISNULL AND issue.cleaned ISNULL" }
  :left_join("area", nil, "issue.area_id = area.id")
  :add_where { "event.occurrence > ? AND event.id NOT IN (" .. chkids .. ")", app.session.member.activated }
  :add_where { "area.id = ?", area.id }
  :exec()

  if #unchecked_events > 0 then
    ui.container {
      attr = { class = "event_star_out_box"},
      content = function()
        ui.container {
          attr = { class = "event_star_in_box" },
          content = function()
            if #unchecked_events == 1 and unchecked_events[1].event == "initiative_created_in_new_issue" then
              ui.container {
                attr = { class = "event_star_txt_box" },
                content = function()
                  ui.tag { tag = "span", attr = { class = "event_star_txt" }, content = _"New" }
                end
              }
              ui.image { attr = { class = "event_star" }, static = "svg/event_star_green.svg" }
            else
              ui.container {
                attr = { class = "event_star_txt_box" },
                content = function()
                  ui.tag { tag = "span", attr = { class = "event_star_txt" }, content = #unchecked_events .. " " .. _ "Events" }
                end
              }
              ui.image {
                attr = { class = "event_star" },
                static = "svg/event_star_red.svg"
              }
            end
          end
        }
      end
    }
  end
end