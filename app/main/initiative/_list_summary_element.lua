local initiative = param.get("initiative", "table")
local selected = param.get("selected", atom.boolean)
local for_details = param.get("for_details", "boolean") or false
local for_member

if app.session.member then
  for_member = param.get("for_member", "table") or app.session.member
end

local class = ""
if for_details then
end

local function round(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 " },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()

            ui.container {
              attr = { class = "col-md-1 col-xs-1 col-sm-1" },
              content = function()
                if initiative.revoked then
                  ui.container {
                    attr = { class = "vertical" },
                    content = function()
                      ui.image { attr = { class = "icon-small" }, static = "png/delete.png" }
                      slot.put(_ "Revoked by authors")
                    end
                  }
                elseif initiative.issue.fully_frozen and initiative.issue.closed or initiative.admitted == false then
                  ui.field.rank { attr = { class = "rank" }, value = initiative.rank, eligible = initiative.eligible }
                elseif app.session.member then
                  -- Get member checked events for initiative
                  local checked_events = Event:new_selector():join("checked_event", nil, "checked_event.event_id = event.id"):add_where { "checked_event.member_id = ?", for_member.id }:exec()

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
                  :add_where { "event.initiative_id = ? AND event.occurrence > ? AND event.id NOT IN (" .. chkids .. ")", initiative.id, app.session.member.activated }
                  :exec()
                  if #unchecked_events > 0 then
                    ui.container {
                      attr = { class = "event_star_out_box", style = "position: absolute; z-index: 1" },
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
                                attr = { class = "event_star", style = "z-index: 2" },
                                static = "svg/event_star_red.svg"
                              }
                            end
                          end
                        }
                      end
                    }
                    -- Check events
                    execute.action { module = "event", action = "check", params = { unchecked_events = unchecked_events, member_id = for_member.id } }
                  end
                end
              end
            }

            if for_details and app.session.member then
              ui.container {
                attr = { class = "col-md-6 col-xs-12 col-sm-6 text-center" },
                content = function()
                  ui.container {
                    attr = { class = "row" },
                    content = function()
                      local class
                      if initiative.revoked then
                        class = "revoked"
                      end
                      ui.heading {
                        level = 1,
                        attr = { class = class },
                        content = function()
                          local name = (initiative.title or _"No title given")
                          local class = ""
                          if initiative.name_highlighted then
                            name = encode.highlight(initiative.name_highlighted)
                          else
                            name = encode.html(initiative.shortened_name)
                          end
                          slot.put(name)
                        end
                      }
                    end
                  }
                  ui.container {
                    attr = { class = "row" },
                    content = function()
                      ui.container {
                        attr = { class = "col-md-12" },
                        content = function()
                          ui.tag 
                          {
                            tag="textarea",
                            attr = {
                              class = "h5 text-center paper",
                              disabled = "true",
                              style = "font-style: italic; width: 96%; border: unset; resize: unset;",
                              rows = "4",
                              maxlength = "300"
                            },
                            content = (initiative.brief_description or _"No abstract given")
                          }
                        end
                      }
                    end
                  }
                end
              }
            else
              ui.container {
                attr = { class = "col-md-6 col-xs-12 col-sm-6 text-center" },
                content = function()
                  ui.container {
                    attr = { class = "row" },
                    content = function()
                      local class
                      if initiative.revoked then
                        class = "revoked"
                      end
                      ui.heading {
                        level = 3,
                        attr = { class = class },
                        content = function()                         
                          local name = (initiative.title or _"No title given")
                          local class = ""
                          if initiative.name_highlighted then
                            name = encode.highlight(initiative.name_highlighted)
                          else
                            name = encode.html(initiative.shortened_name)
                          end
                          slot.put(name)
                        end
                      }
                    end
                  }
                  ui.container {
                    attr = { class = "row" },
                    content = function()
                      ui.container {
                        attr = { class = "col-md-12 col-sm-9 col-xs-8 spaceline" },
                        content = function()
                          ui.tag 
                          {
                            tag="textarea",
                            attr = {
                              class = "h5 text-justify paper",
                              disabled = "true",
                              style = "font-style: italic; width: 96%; border: unset; resize: unset;",
                              rows = "4",
                              maxlength = "300"
                            },
                            content = function()
                              if initiative.brief_description == "" then
                                slot.put(_"No abstract given")
                              else
                                slot.put(initiative.brief_description)
                              end
                            end
                          }            
                        end
                      }
                    end
                  }
                end
              }
            end

            ui.container {
              attr = { class = "col-xs-12 col-sm-6 col-md-3 spaceline" },
              content = function()
                if initiative.issue.fully_frozen and initiative.issue.closed then
                  if initiative.negative_votes and initiative.positive_votes then
                    local max_value = initiative.issue.voter_count

                    local a = initiative.positive_votes
                    local b = (max_value - initiative.negative_votes - initiative.positive_votes)
                    local c = initiative.negative_votes

                    local ap, bp, cp
                    if a > 0 then ap = round(a * 100 / max_value, 2) else ap = 0 end
                    if b > 0 then bp = round(b * 100 / max_value, 2) else bp = 0 end
                    if c > 0 then cp = round(c * 100 / max_value, 2) else cp = 0 end
                    ui.container {
                      attr = { class = "progress progress-striped active spaceline" },
                      content = function()
                        ui.container {
                          attr = { class = "progress_bar_txt" },
                          content = function()
                            ui.container { attr = { class = "text-center" }, content = ap .. "%" }
                          end
                        }
                        ui.container { attr = { class = "bar bar-success text-center", style = "width:" .. ap .. "%" }, content = "" }
                        ui.container { attr = { class = "bar bar-neutral text-center", style = "width:" .. bp .. "%" }, content = "" }
                        ui.container { attr = { class = "bar bar-danger text-center", style = "width:" .. cp .. "%" }, content = "" }
                      end
                    }
                    if for_details then
                      ui.heading { level = 6, attr = { class = "votes_count_txt" }, content = a .. " " .. _ "Yes" .. " / " .. c .. " " .. _ "No" }
                    end
                  else
                    slot.put("&nbsp;")
                  end
                else
                  local max_value = initiative.issue.population or 0
                  local quorum
                  if initiative.issue.accepted then
                    quorum = initiative.issue.policy.initiative_quorum_num / initiative.issue.policy.initiative_quorum_den
                  else
                    quorum = initiative.issue.policy.issue_quorum_num / initiative.issue.policy.issue_quorum_den
                  end

                  local a = (initiative.satisfied_supporter_count or 0)
                  local b = (initiative.supporter_count or 0) - (initiative.satisfied_supporter_count or 0)
                  local c = max_value - (initiative.supporter_count or 0)

                  local ap, bp, cp
                  if a > 0 then ap = round(a * 100 / max_value, 2) else ap = 0 end
                  if b > 0 then bp = round(b * 100 / max_value, 2) else bp = 0 end
                  if c > 0 then cp = round(c * 100 / max_value, 2) else cp = 0 end
                  ui.container {
                    attr = { class = "progress progress-striped active" },
                    content = function()
                      ui.container {
                        attr = { class = "progress_bar_txt" },
                        content = function()
                          ui.container { attr = { class = "text-center" }, content = ap .. "%" }
                        end
                      }
                      ui.container { attr = { class = "bar bar-success", style = "width:" .. ap .. "%" }, content = "" }
                      ui.container { attr = { class = "bar bar-neutral", style = "width:" .. bp .. "%" }, content = "" }
                      ui.container { attr = { class = "bar bar-white", style = "width:" .. cp .. "%" }, content = "" }
                    end
                  }
                  if for_details then
                    local supp_txt
                    local pot_supp_txt

                    if a == 1 then
                      supp_txt = _ "Supporter"
                    else
                      supp_txt = _ "Supporters"
                    end

                    if b == 1 then
                      pot_supp_txt = _ "Potential supporter"
                    else
                      pot_supp_txt = _ "Potential supporters"
                    end

                    ui.heading { level = 6, attr = { class = "votes_count_txt", style ="font-size: small;" }, content = a .. " " .. supp_txt }
                    ui.heading { level = 6, attr = { class = "votes_count_txt", style ="font-size: small;" }, content = "(" .. b .. " " .. pot_supp_txt .. ")" }
                  end
                end
              end
            }
            ui.container {
              attr = { class = "col-md-2 text-center" },
              content = function()
                ui.link {
                  attr = { class = "btn btn-primary btn-mini" },
                  module = "initiative",
                  view = "show",
                  id = initiative.id,
                  content = _ "Read"
                }
              end
            }
          end
        }
      end
    }
  end
}