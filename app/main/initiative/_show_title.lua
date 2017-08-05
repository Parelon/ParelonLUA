local initiative = param.get("initiative", "table")
local initiator = param.get("initiator", "table")

local title_class = ""
local title_size = "col-md-10 col-md-offset-1"

if initiator and initiator.accepted == nil and not initiative.issue.half_frozen and not initiative.issue.closed then
  ui.container{
    attr = { class = "initiator_invite_info" },
    content = function()
      slot.put(_"You are invited to become initiator of this initiative.")
      slot.put("&nbsp;")
      ui.link{
        attr = { class = "btn btn-primary btn_xlarge h3 text-center" },
        image  = { static = "icons/16/tick.png" },
        text   = _"Accept invitation",
        module = "initiative",
        action = "accept_invitation",
        id     = initiative.id,
        routing = {
          default = {
            mode = "redirect",
            module = "initiative",
            view = "show",
            id = initiative.id
          }
        }
      }
      slot.put(" ")
      ui.link{
        attr = { class = "btn btn-primary  btn_xlarge h3 text-center" },
        image  = { static = "icons/16/cross.png" },
        text   = _"Refuse invitation",
        module = "initiative",
        action = "reject_initiator_invitation",
        params = {
          initiative_id = initiative.id,
          member_id = app.session.member.id
        },
        routing = {
          default = {
            mode = "redirect",
            module = "initiative",
            view = "show",
            id = initiative.id
          }
        }
      }
    end
  }
end

if initiative.revoked then
  title_class = " revoked"
  title_size = "col-md-10"
end

ui.container {
  attr = { class = "row text-center" },
  content = function()
    if initiative.revoked then
      ui.container {
        attr = { class = "col-md-1 spaceline spaceline-bottom" },
        content = function()
          ui.container {
            attr = { class = "vertical" },
            content = function()
              ui.image { attr = { class = "icon-mid" }, static = "png/delete.png" }
              ui.container{ content = _ "Revoked by authors" }
            end
          }
        end
      }
    elseif initiative.issue.fully_frozen and initiative.issue.closed or initiative.admitted == false then
      ui.container {
        attr = { class = "col-md-1 spaceline spaceline-bottom" },
        content = function()
          ui.field.rank { attr = { class = "rank" }, value = initiative.rank, eligible = initiative.eligible }
        end
      }
    end                                   

    ui.container {
      attr = { class = title_size .. " row spaceline spaceline-bottom" },
      content = function()
        ui.container {
          attr = { class = "label label-warning text-center" .. title_class },
          content = function()
            ui.heading {
              level = 1,
              content = (initiative.name or _ "No title for the initiative")
            }
          end
        }
      end
    }

    ui.container {
      attr = { class = "col-md-1 spaceline spaceline-bottom hidden-xs hidden-sm text-right spaceline spaceline-bottom" },
      content = function()
        ui.field.popover {
          attr = {
            dataplacement = "bottom",
            datahtml = "true";
            datatitle = _ "Box di aiuto per la pagina",
            datacontent = _ "La barra delle fasi la trovi in testa alle questioni ed alle proposte, tienila d' occhio, in quanto ti avvisa quando puoi emendare o votare la proposta. ",
            class = "text-center spaceline spaceline-bottom"
          },
          content = function()
            ui.container {
              attr = { class = "row" },
              content = function()
                ui.image { attr = { class = "icon-medium spaceline spaceline-bottom" }, static = "png/tutor.png" }
              end
            }
          end
        }
      end
    }
  end
}

-- initiative not admitted info
if initiative.admitted == false then
  local policy = initiative.issue.policy
  ui.container {
    attr = { class = "not_admitted_info" },
    content = _("This initiative has not been admitted! It failed the quorum of #{quorum}.", { quorum = format.percentage(policy.initiative_quorum_num / policy.initiative_quorum_den) })
  }
end

-- initiative revoked info
if initiative.revoked then
  ui.container {
    attr = { class = "revoked_info" },
    content = function()
      slot.put(_("This initiative has been revoked at #{revoked}", { revoked = format.timestamp(initiative.revoked) }))
      local suggested_initiative = initiative.suggested_initiative
      if suggested_initiative then
        slot.put("<br /><br />")
        slot.put(_("The initiators suggest to support the following initiative:"))
        slot.put(" ")
        ui.link {
          content = _("Issue ##{id}", { id = suggested_initiative.issue.id }) .. ": " .. encode.html(suggested_initiative.name),
          module = "initiative",
          view = "show",
          id = suggested_initiative.id
        }
      end
    end
  }
end