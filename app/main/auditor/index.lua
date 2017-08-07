slot.set_layout("custom")

local show = param.get("show", atom.string)

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
              module = "index",
              view = "index",
              image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
              content = _ "Back"
            }
          end
        }
        ui.tag {
          tag = "strong",
          attr = { class = "col-md-9 text-center spaceline spaceline-bottom" },
          content = function()
            ui.heading { level = 1, attr = { class = "uppercase" }, content = _ "Auditor Panel" }
          end
        }
      end
    }
  end
)

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-offset-1 col-md-2 text-center" },
              content = function()
                ui.link {
                  attr = { class = "btn btn-primary btn-large fixclick" },
                  module = "auditor",
                  view = "member_edit",
                  content = _ "Register new member"
                }
              end
            }

            ui.container {
              attr = { class = "col-md-offset-1 col-md-2 text-center" },
              content = function()
                ui.link {
                  attr = { class = "btn btn-primary btn-large fixclick" },
                  module = "auditor",
                  view = "index",
                  params = { show = "my_users" },
                  content =  _ "List my members"
                }
              end
            }

            ui.container {
              attr = { class = " col-md-2 text-center" },
              content = function()
                ui.link {
                  attr = { class = "btn btn-primary btn-large fixclick" },
                  module = "auditor",
                  view = "index",
                  content =  _ "List all members"
                }
              end
            }

            if app.session.member.admin then
              ui.container {
                attr = { class = " col-md-2 text-center" },
                content = function()
                  ui.link {
                    attr = { class = "btn btn-primary btn-large fixclick" },
                    module = "auditor",
                    view = "index",
                    params = { show = "auditors" },
                    content =  _ "List auditors"
                  }
                end
              }

              ui.container {
                attr = { class = " col-md-2 text-center" },
                content = function()
                  ui.link {
                    attr = { class = "btn btn-primary btn-large fixclick" },
                    module = "auditor",
                    view = "index",
                    params = { show = "admins" },
                    content =  _ "List admins"
                  }
                end
              }
            end
          end
        }
      end
    }
  end
}

local members_selector = Member:new_selector()


if show == "my_users" then
  members_selector:add_where { "creator_id = ?", app.session.member_id }
elseif app.session.member.admin then
  if show == "auditors" then
    members_selector:add_where { "auditor = ?", true }
  elseif show == "admins" then
    members_selector:add_where { "admin = ?", true }
  end
end

members_selector:add_order_by { "id" }
local members = members_selector:exec()

ui.container {
  attr = { class = "row"},
  content = function()
    ui.container {
      attr = { class = "text-center" },
      content = function()
        if #members == 0 then
          ui.heading { level = 5, content = _ "There are no users certified by you" }
        else
          ui.paginate {
            selector = members_selector,
            per_page = 30,
            content = function()
              ui.list {
                records = members,
                columns = {
                  {
                    field_attr = { style = "padding-left: 5px; padding-right: 5px; border-bottom: 1px solid black;", class = "text-center col-md-1" },
                    label = _ "Id",
                    label_attr = { style = "border-bottom: 2px solid black;", class = "text-center col-md-1" },
                    name = "id" 
                  },
                  {
                    field_attr = { style = "padding-left: 5px;padding-right: 5px;border-bottom: 1px solid black;", class = "text-center col-md-4" },
                    label = _ "Name",
                    label_attr = { style = "border-bottom: 2px solid black;", class = "text-center col-md-4" },
--                    name = "name",
                    content = function(record)
                      slot.put(record.identification)
                      if record.activated == nil then
                        slot.put("&nbsp;&nbsp;")
                        local result = Member:new_selector():add_where{"id = ?", record.id}:add_where("invite_code_expiry > now()"):optional_object_mode():exec();
                        if result ~= nil then
                          ui.heading {
                            level = 5,
                            attr = { class = "label label-success" },
                            content = _("invitation expires on #{date}", {date = format.date(record.invite_code_expiry)})
                          }
                        else
                          ui.heading {
                            level = 5,
                            attr = { class = "label label-warning" },
                            content = _"invitation expired: new code needed"
                          }
                        end
                      end
                    end
                  },
                  {
                    field_attr = { style = "padding-left: 5px;padding-right: 5px;border-bottom: 1px solid black;", class = "text-center col-md-3" },
                    label = _ "NIN",
                    label_attr = { style = "border-bottom: 2px solid black;", class = "text-center col-md-3" },
                    name = "nin"
                  },
                  {
                    field_attr = { style = "padding-left: 5px;padding-right: 5px;border-bottom: 1px solid black;", class = "text-center col-md-1" },
                    label = _ "State",
                    label_attr = { style = "border-bottom: 2px solid black;", class = "text-center col-md-1" },
                    content = function(record)
                      if not record.activated then
                        ui.field.text { value = _"not activated" }
                      elseif not record.active then
                        ui.field.text { value = _"inactive" }
                      else
                        ui.field.text { value = _"active" }
                      end
                    end
                  },
                  {
                    field_attr = { style = "padding-left: 5px;padding-right: 5px;border-bottom: 1px solid black;", class = "text-center col-md-1"},
                    label = _ "Flags",
                    label_attr = { style = "border-bottom: 2px solid black;", class = "text-center col-md-1" },
                    content = function(record)
                      local flags = ""
                      if record.admin then
                        flags = _ "admin"
                      end
                      if record.auditor then
                        if flags == "" then
                          flags = _ "auditor"
                        else
                          flags = flags .. ", " .. _ "auditor"
                        end
                      end
                      ui.field.text { value = flags }
                    end
                  },
                  {
                    field_attr = { style = "padding-left: 5px;padding-right: 5px;border-bottom: 1px solid black;", class = "text-center col-md-1" },
                    label = _ "Locked?",
                    label_attr = { style = "border-bottom: 2px solid black;", class = "text-center col-md-1" },
                    content = function(record)
                      if record.locked then
                        ui.field.text { value = _"Yes" }
                      else
                        ui.field.text { value = _"No" }
                      end
                    end
                  },
                  {
                    field_attr = { style = "padding-left: 5px;padding-right: 5px; border-bottom: 1px solid black;", class = "text-center col-md-1" },
                    label = _ "Actions",
                    label_attr = { style = "border-bottom: 2px solid black;", class = "text-center col-md-1" },
                    content = function(record)
                      if app.session.member.admin or (app.session.member.auditor and not record.admin and not record.auditor) then
                        ui.link {
                          attr = { class = "btn btn-primary btn-mini btn_mini_margin action admin_only" },
                          text = _ "Edit",
                          module = "auditor",
                          view = "member_edit",
                          id = record.id
                        }
                      end
                    end
                  }
                }
              }
            end
          }
        end
      end
    }
  end
}

