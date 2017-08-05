local issue = param.get("issue", "table")

if app.session.member and not issue.closed then
  ui.container {
    attr = { class = "row text-center" },
    content = function()
      ui.container {
        attr = { class = "col-md-8 col-md-offset-1 label label-warning-tbox spaceline text-left" },
        content = function()
          ui.heading { level = 3, content = _ "Interest in the issue" }
        end
      }
    end
  }                                            
  ui.container {
    attr = { class = "row well-inside" },
    content = function()
--      ui.container {
--        attr = { class = " col-md-12 well-inside paper" },
--        content = function()
      if not issue.closed and not issue.fully_frozen and issue.state ~= "voting" then
        if issue.member_info.own_participation then
          ui.container {
            attr = { class = "col-md-5 spaceline spaceline spaceline-bottom" },
            content = function()
              ui.image { attr = { style = "height: 50px" }, static = "png/thumb_up.png" }
              slot.put("&nbsp;&nbsp;&nbsp;", _ "You are interested in this issue", "&nbsp;&nbsp;&nbsp;")
              ui.link {
                attr = { class = "label label-danger text-center " },
                in_brackets = true,
                text = _ "Withdraw",
                module = "interest",
                action = "update",
                params = { issue_id = issue.id, delete = true },
                routing = {
                  default = {
                    mode = "redirect",
                    module = request.get_module(),
                    view = request.get_view(),
                    id = param.get_id_cgi(),
                    params = param.get_all_cgi()
                  }
                }
              }
            end
          }
        elseif app.session.member:has_voting_right_for_unit_id(issue.area.unit_id) then
          ui.container {
            attr = { class = "col-md-5 spaceline"  },
            content = function()
              slot.put("&nbsp;&nbsp;&nbsp;", _ "You are not interested in this issue", "&nbsp;&nbsp;&nbsp;")

              ui.link {
                attr = { class = "label label-success" },
                text = _ "Add my interest",
                module = "interest",
                action = "update",
                params = { issue_id = issue.id },
                routing = {
                  default = {
                    mode = "redirect",
                    module = request.get_module(),
                    view = request.get_view(),
                    id = param.get_id_cgi(),
                    params = param.get_all_cgi()
                  }
                }
              }
            end
          }
        end

        ui.heading {
          level = 2,
          attr = { class = "col-md-6 col-md-offset-1 spaceline spaceline-bottom" },
          content = function()            
            slot.put( "<i>", _"Being interest", "</i> ", " ", _"in the issue doesn't mean", " <i>", _ "voting yes", "</i>: ", _ "it just means that the issue is", " <strong><i>", "worth", "</i></strong> ", _ "being discussed", ".")
          end
        }
      elseif issue.state == 'voting' then
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-6 col-sm-12 col-xs-12 spaceline " },
              content = function()
                ui.heading { level = 2, content = "La proposta è passata alla fase di votazione: clicca sul pulsante per votare o cambiare il tuo voto" }
              end
            }
            ui.container {
              attr = { class =  "col-md-2 hidden-sm hidden-xs spaceline" },
              content = function()
                ui.image { attr = { class = "icon-big" },static = "svg/arrow-right.svg" }
              end
            }

            ui.container {
              attr = { class = "col-md-4 col-sm-12 col-xs-12 spaceline" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-4 text-center" },
                      content = function()
                        ui.image { attr = { class = "icon-medium " },static = "png/voting.png"}
                      end
                    }				
                    ui.container {
                      attr = { class = "col-md-8 text-center" },
                      content = function()
                        ui.link {
                          attr = { id = "issue_see_det_" .. issue.id },
                          module = "vote",
                          view = "list",
                          id = issue.id,
                          params = { issue_id = issue.id },
                          content = function()
                            ui.heading { level = 2, attr = { class = "spaceline btn btn-large btn-primary" }, content = _ "Vote now" }
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
      else
        ui.heading { level = 3, content = _ "This issue is closed." }
      end
    end
  }
end
