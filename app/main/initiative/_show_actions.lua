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
      attr = { class = "row spaceline spaceline-bottom well" },
      content = function()
        ui.container {
          attr = { class = "col-md-4" },
          content = function()
            ui.heading {
              level = 3,
              attr = { class = "spaceline spaceline-bottom" },
              content = _ "As initiator you can also do: "
            }
          end
        }
        ui.container {
          attr = { class = "col-md-8 text-right" },
          content = function()
            if initiator and initiator.accepted and not initiative.issue.fully_frozen and not initiative.issue.closed and not initiative.revoked then
              ui.link {
                attr = { class = "action btn btn-primary large_btn" },
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
                  attr = { class = "btn btn-primary large_btn" },
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
                attr = { class = "btn btn-primary large_btn" },
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
                      class = "btn btn-primary large-btn",
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
                attr = { class = "btn btn-primary large_btn" },
                text = _ "change discussion URL",
                module = "initiative",
                view = "edit",
                id = initiative.id
              }
              slot.put(" ")
              ui.link {
                attr = { class = "btn btn-primary large_btn" },
                content = _ "Revoke initiative",
                module = "initiative",
                view = "revoke",
                id = initiative.id,
                image = { attr = { class = "col-md-3 thumb img-responsive" }, static = "png/cross.png" },
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
            end
          }
        end
      }
    end
  end
end