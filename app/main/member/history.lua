local member = Member:by_id(param.get_id())

slot.set_layout("custom")

ui.title(
  function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-3 text-left" },
          content = function()
            ui.link {
              attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back" },
              module = "member",
              view = "show",
              id = member.id,
              image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
              content = _ "Back to previous page"
            }
          end
        }
        ui.tag {
          tag = "strong",
          attr = { class = "col-md-9 text-center spaceline spaceline-bottom" },
          content = function()
            ui.heading { level = 1, attr = { class = "uppercase" }, content = _("Member name history for '#{name}'", { name = member.name }) }
            end
          }
        end
      }
    end
  )

  ui.form {
    attr = { class = "vertical" },
    content = function()
      ui.field.text { label = _ "Current name", value = member.name }
      ui.field.text { label = _ "Current status", value = member.active and _ 'activated' or _ 'deactivated' }
    end
  }


  local entries = member:get_reference_selector("history_entries"):add_order_by("id DESC"):exec()

  ui.tag {
    tag = "table",
    content = function()
      ui.tag {
        tag = "tr",
        content = function()
          ui.tag {
            tag = "th",
            content = _("Name")
          }
          ui.tag {
            tag = "th",
            content = _("Status")
          }
          ui.tag {
            tag = "th",
            content = _("until")
          }
        end
      }
      for i, entry in ipairs(entries) do
        ui.tag {
          tag = "tr",
          content = function()
            ui.tag {
              tag = "td",
              content = entry.name
            }
            ui.tag {
              tag = "td",
              content = entry.active and _ 'activated' or _ 'deactivated',
            }
            ui.tag {
              tag = "td",
              content = format.timestamp(entry["until"])
            }
          end
        }
      end
    end
  }
  slot.put("<br />")
  ui.container {
    content = _("This member account has been created at #{created}", { created = format.timestamp(member.activated) })
  }
