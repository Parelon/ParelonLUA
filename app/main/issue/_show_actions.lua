local issue = param.get("issue", "table")

if app.session.member and not issue.closed then
  ui.container {
    attr = { class = "row text-center" },
    content = function()
      ui.container {
        attr = { class = "col-md-8 col-md-offset-1 label label-warning-tbox spaceline" },
        content = function()
          ui.tag { tag = "h3", content = _ "SUPPORT THE ISSUE" }
        end
      }
    end
  }                                            
  ui.container {
    attr = { class = "row" },
    content = function()
      ui.container {
        attr = { class = " col-md-12 well-inside paper" },
        content = function()
          if not issue.closed and not issue.fully_frozen and issue.state ~= "voting" then
            if issue.member_info.own_participation then
              ui.container {
                attr = { class = "col-md-4 col-md-offset-2 spaceline" },
                content = function()
                  ui.image { attr = { style = "height: 50px" }, static = "png/thumb_up.png" }
                  ui.tag { tag = "span", content = "  " }
                  ui.link {
                    attr = { class = "label label-danger" },
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
                attr = { class = "col-md-4 col-md-offset-2 spaceline"  },
                content = function()
                  ui.image { attr = { style = "height: 50px" }, static = "png/thumb_down.png" }
                  ui.tag { tag = "span", content = "  " }
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
            ui.container {
              attr = { class = "col-md-3 col-md-offset-3 text-right hidden-xs hidden-sm " },
              content = function()
                ui.field.popover {
                  attr = {
                    dataplacement = "bottom",
                    datahtml = "true";
                    datatitle = _ "Box di aiuto per la pagina",
                    datacontent = _("Puoi sostenere oppure ritirare il sostegno alla questione.<br /><i>Sostenere</i> la questione non vuol dire <i>votare sì</i>: vuol dire solo ritenere che il problema sollevato <i>merita</i> di essere discusso."),
                    datahtml = "true",
                    class = "text-center"
                  },
                  content = function()
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.image { attr = { class = "icon-medium" },static = "png/tutor.png" }
                        --								    ui.heading{level=3 , content= _"What you want to do?"}
                      end
                    }
                  end
                }
              end
            }
          elseif issue.state == 'voting' then
            ui.container {
              attr = { class = "row" },
              content = function()
                ui.container {
                  attr = { class = "col-md-7 col-sm-12 col-xs-12 spaceline label label-danger" },
                  content = function()
                    ui.heading { level = 2, content = "La proposta è passata alla fase di votazione: clicca sul pulsante per votare o cambiare il tuo voto" }
                  end
                }
                ui.container {
                  attr = { class =  "col-md-1 hidden-sm hidden-xs  spaceline3" },
                  content = function()
                    ui.image { attr = { class = "icon-medium" },static = "svg/arrow-right.svg" }
                  end
                }

                ui.container {
                  attr = { class = "col-md-4 col-sm-12 col-xs-12 " },
                  content = function()
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.container {
                          attr = { class = "col-md-12 text-center" },
                          content = function()
                            ui.image { static = "png/voting.png"}
                          end
                        }				
                        ui.container {
                          attr = { class = "col-md-12 text-center" },
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
  }
end
