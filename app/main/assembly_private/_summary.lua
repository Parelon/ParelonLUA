
ocal list = param.get("list")

-- Filtering interest
if list == 'voted' or list == 'proposals' then
  local selector = Issue:new_selector()
  
  if list == "voted" then
    selector:add_where({ "EXISTS(SELECT 1 FROM direct_voter WHERE direct_voter.issue_id = issue.id AND direct_voter.member_id = ?) OR (issue.closed NOTNULL AND EXISTS(SELECT 1 FROM delegating_voter WHERE delegating_voter.issue_id = issue.id AND delegating_voter.member_id = ?)) ", app.session.member_id, app.session.member_id })
    selector:join("direct_voter", nil, { "direct_voter.issue_id = issue.id AND direct_voter.member_id = ?", app.session.member_id })
  else
    selector:join("initiative", nil, "initiative.issue_id = issue.id")
    selector:join("current_draft", nil, { "current_draft.initiative_id = initiative.id AND current_draft.author_id = ?", app.session.member.id })
    selector:add_where("issue.closed ISNULL")
  end
  
  selector:add_group_by("issue.id")

  selector:limit(25)
  local headingID = "heading" .. list

  ui.container {
    attr = { class = "panel-group", id = "accordion", role = "tablist", ariamultiselectable = "true" },
    content = function()
      ui.container {
        attr = { class = "panel panel-default"},
        content = function()	  
          ui.container {
            attr = { class = "btn btn-primary full_btn ", role="tab", id=headingID},
            content = function()						                     
              ui.heading { 
                level = 3, attr = { datatoggle = "collapse", class = "panel-title", href = "#issue_" .. list, ariaexpanded = "true", ariacontrols = "issue_" .. list},  
              }
              ui.image { static = "png/arrow-down-icon.png" }

              if list == "voted" then
                ui.link {content = _ " LE TUE VOTAZIONI"}
              else
                ui.link {content = _ " LE TUE PROPOSTE"}
              end

            end
          }

          ui.container {
            attr = {
              id = "issue_" .. list,
              class = "panel-collapse collapse",
              role = "tabpanel",
              arialabelledby = headingID
            },
            content = function()
              ui.container {
                attr = { class="panel-body"},
                content = function()
                  ui.container {
                    attr = { class = "row" },
                    content = function()
--                      local issues = selector:exec()
--                      if #issues > 0 then
--                        for i, issue in ipairs(issues) do
                          execute.view {
                            module = "issue_private",
                            view = "_list",
                            params = {
                              issues_selector = selector,
                              no_filter = true
                            }
                          }                      
--                        end
--                      else
--                        ui.heading{ level = 4, content = "Nothing to show" }
--                      end
                    end
                  }
                end
              }   
            end
          } 					                    
        end
      }
    end 
  }
end