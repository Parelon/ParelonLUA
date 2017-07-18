local initiative = param.get("initiative", "table")
local issue = param.get("issue", "table")
local initiator = param.get("initiator", "table")
local initiators_members_selector = initiative:get_reference_selector("initiating_members")
:add_field("initiator.accepted", "accepted")
:add_order_by("member.name")
if initiator and initiator.accepted then
  initiators_members_selector:add_where("initiator.accepted ISNULL OR initiator.accepted")
else
  initiators_members_selector:add_where("initiator.accepted")
end

local initiators = initiators_members_selector:exec()

if not issue.closed and not initiative.revoked then
  ui.container {
    attr = { class = "row" },
    content = function()
      ui.heading { level = 3, attr = { class = "col-md-11 col-xs-12 col-sm-12 label label-warning-tbox spaceline" }, content = "Azioni possibili" }
      ui.container {
        attr = { class = "col-md-1 text-center hidden-xs hidden-sm" },
        content = function()
          ui.field.popover {
            attr = {
              dataplacement = "bottom",
              datahtml = "true";
              datatitle = _ "Box di aiuto per la pagina",
              datacontent = _("Puoi sostenere, ignorare o proporre emendamenti alla proposta.<br /><i>Sostenere</i> la proposta vuol dire solo ritenere che per te la proposta <i>merita</i> di passare alla fase di votazione.<br />Emendare la proposta ti permette di proporre modifiche parziali da sottoporre al giudizio dell'assemblea. Se ritieni che il tuo emendamento <i>deve/non deve</i> essere accolto verrai identificato come sostenitore potenziale, altrimenti verrai identificato come sostenitore. Un SOSTENITORE partecipa attivamente alla promozione della PROPOSTA"),
              class = "text-center"
            },
            content = function()
              ui.container {
                attr = { class = "row" },
                content = function()
                  ui.image { attr = { class = "icon-medium" },static = "png/tutor.png" }
                end
              }
            end
          }
        end
      }
    end
  }

  if issue.state ~= "voting" then
    
    ui.container {
      attr = { class = "row text-center well-inside" },
      content = function()
        ui.container {
          attr = { class = "col-md-12" },
          content = function()
            ui.container {
              attr = { class = "row text-center" },
              content = function()
                ui.heading {
                  level = 1,
                  attr = { class = "col-md-3 spaceline spaceline-bottom" },
                  content = _"Actions: "
                }
                ui.container {
                  attr = { class = "vertical col-md-9 text-right" },
                  content = function()
                    ui.container {
                      attr = { class = "spaceline-bottom" },
                      content = function()
                        execute.view {
                          module = "supporter",
                          view = "_show_box",
                          params = { initiative = initiative }
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "row spaceline" },
                      content = function()
                        ui.container {
                          attr = { class = "col-md-12" },
                          content = function()
                            ui.link {
                              attr = { target="_blank", class = "btn btn-primary btn_size_fix fixclick text-center" },
                              module = "suggestion",
                              view = "new",
                              params = { initiative_id = initiative.id },
                              text = _ "New suggestion"
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
        }
      end
    }

    ui.container {
      attr = { class = "row spaceline spaceline-bottom well" },
      content = function()
        ui.container {
          attr = { class = "col-md-5" },
          content = function()
            ui.heading {
              level = 1,
              attr = { class = "spaceline spaceline-bottom" },
              content = _ "As initiator you can also do: "
            }
          end
        }
        ui.container {
          attr = { class = "col-md-7 text-right" },
          content = function()
            if initiator and initiator.accepted and not initiative.issue.fully_frozen and not initiative.issue.closed and not initiative.revoked then
              ui.link {
                attr = { class = "action btn btn-primary btn_xlarge h3 text-center" },
                content = function()
                  slot.put(_ "Invite initiator")
                end,
                module = "initiative",
                view = "add_initiator",
                params = { initiative_id = initiative.id }
              }
              if #initiators > 1 then
                slot.put(" ")
                ui.link {
                  attr = { class = "btn btn-primary btn_xlarge h3 text-center" },
                  content = function()
                    slot.put(_ "Remove initiator")
                  end,
                  module = "initiative",
                  view = "remove_initiator",
                  params = { initiative_id = initiative.id }
                }
              end
            end

            if initiator and initiator.accepted == false then
              slot.put(" ")
              ui.link {
                attr = { class = "btn btn-primary btn_xlarge h3 text-center" },
                text = _ "Cancel refuse of invitation",
                module = "initiative",
                action = "remove_initiator",
                params = {
                  initiative_id = initiative.id,
                  member_id = app.session.member.id
                },
                routing = {
                  ok = {
                    mode = "redirect",
                    module = "initiative",
                    view = "show",
                    id = initiative.id
                  }
                }
              }
            end

            if (initiative.discussion_url and #initiative.discussion_url > 0) then
              if initiative.discussion_url:find("^https?://") then
                if initiative.discussion_url and #initiative.discussion_url > 0 then
                  slot.put(" ")
                  ui.link {
                    attr = {
                      class = "btn btn-primary btn_xlarge h3 text-center",
                      target = "_blank",
                      title = _ "Discussion with initiators"
                    },
                    text = _ "Discuss with initiators",
                    external = initiative.discussion_url
                  }
                end
              else
                slot.put(encode.html(initiative.discussion_url))
              end
            end

            if initiator and initiator.accepted and not initiative.issue.half_frozen and not initiative.issue.closed and not initiative.revoked then
              slot.put(" ")
              ui.link {
                attr = { class = "btn btn-primary btn_xlarge h3 text-center" },
                text = _ "change discussion URL",
                module = "initiative",
                view = "edit",
                id = initiative.id
              }
              slot.put(" ")
              ui.link {
                attr = { class = "btn btn-primary btn_xlarge h3 text-center" },
                content = _ "Revoke initiative",
                module = "initiative",
                view = "revoke",
                id = initiative.id,
                image = { attr = { class = "col-md-3 thumb" }, static = "png/cross.png" },
                content = _ "Revoke initiative"
              }
            end
          end
        }
      end
    }
  else
    local direct_voter = issue.member_info.direct_voted
    local voteable = issue.state == 'voting' and
    app.session.member:has_voting_right_for_unit_id(issue.area.unit_id)

    local vote_comment_able = issue.closed and direct_voter

    if voteable then
      ui.container {
        attr = { class = "row" },
        content = function()
          ui.container {
            attr = { class = "col-md-12 well-inside paper" },
            content = function()
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
                    attr = { class = "col-md-1 hidden-sm hidden-xs spaceline3" },
                    content = function()
                      ui.image { static = "svg/arrow-right.svg", attr = { class = "icon-maxi" }}
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
            end
          }
        end
      }
    end
  end
end