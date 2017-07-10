local issue = param.get("issue", "table")

for i,initiative in ipairs(issue:get_reference_selector("initiatives"):exec()) do
  
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
              local span = 2
              ui.container {
                attr = { class = "col-xs-12 col-sm-6 col-md-offset-1 col-md-" .. span .. "" },
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
                  end
                end
              }

              ui.container {
                attr = { class = "col-md-4 col-sm-offset-1 col-xs-11 col-sm-10 spaceline" },
                content = function()
                  ui.link {
                    content = function()
                      local name
                      if initiative.name_highlighted then
                        name = encode.highlight(initiative.name_highlighted)
                      else
                        name = encode.html(initiative.shortened_name)
                      end
                      ui.heading {
                        level = 3,
                        content = function()
                          local class = ""
                          if initiative.revoked then
                            class = "revoked"
                          end
                          if for_details then
                            ui.tag { tag = "strong", attr = { class = class }, content = name }
                          else
                            ui.tag { tag = "strong", attr = { class = class }, content = "p" .. initiative.id .. ": " .. name }
                          end
                        end
                      }
                    end,
                    module = "initiative",
                    view = "show",
                    id = initiative.id
                  }
                end
              }
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