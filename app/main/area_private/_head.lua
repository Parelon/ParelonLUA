local area = param.get("area", "table")
local member = param.get("member", "table")

local show_content = param.get("show_content", atom.boolean)

if app.session.member_id then
    area:load_delegation_info_once_for_member_id(app.session.member_id)
end

if not param.get("hide_unit", atom.boolean) then
    execute.view { module = "unit_private", view = "_head", params = { unit = area.unit, member = member } }
end

ui.container {
    attr = { class = "row spaceline" },
    content = function()
        ui.container {
            attr = { class = "label label-warning spaceline col-md-8 col-md-offset-2 h1" },
            content = function()
            -- area name
                ui.link {
                    module = "area_private",
                    view = "show",
                    id = area.id,
                    content = area.name
                }
            end
        }
	end
}
        if show_content then

 				 ui.container {
                attr = { class = "row spaceline" },
                content = function() 
                               -- actions (members with appropriate voting right only)
                    if member then

                        -- membership
                        local membership = Membership:by_pk(area.id, member.id)

                        if membership then

                            if app.session.member_id == member.id then
				            ui.container {
				                attr = { class = "row" },
				                content = function() end}
                                ui.tag { attr = { class = "label label-success margin_line spaceline" }, content = _ "You are participating in this area" }

                                ui.tag {
                                    content = function()
                                        slot.put("")
                                        ui.link {
														  attr = { class = "label label-inverse margin_line spaceline" },
                                            text = _ "Withdraw",
                                            module = "membership",
                                            action = "update",
                                            params = { area_id = area.id, delete = true },
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
                                        slot.put("")
                                    end
                                }
                            else
                                ui.tag { content = _ "Member is participating in this area" }
                            end

                        elseif app.session.member_id == member.id and member:has_voting_right_for_unit_id(area.unit_id) then
                            ui.link {
                                attr = { class = "btn btn-primary large_btn margin_line text-center spaceline" },
                                text = _ "Participate in this area",
                                module = "membership",
                                action = "update",
                                params = { area_id = area.id },
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

                        if app.session.member_id == member.id and app.session.member:has_voting_right_for_unit_id(area.unit_id) then

                            slot.put("")
                            if area.delegation_info.own_delegation_scope ~= "area" then
                                ui.link {
												attr = { class = "btn btn-primary large_btn margin_line text-center spaceline" }, 
												text = _ "Delegate area", 
												module = "delegation", 
												view = "show", 
												params = { area_id = area.id } }
                            else
                                ui.link {
												attr = { class = "btn btn-primary large_btn margin_line text-center spaceline" }, 
												text = _ "Change area delegation",
												module = "delegation", 
												view = "show", 
												params = { area_id = area.id } }
                            end
                            slot.put("")

		                         ui.link {
		                             attr = { class = "btn btn-primary large_btn margin_line text-center" },
		                             content = function()
		                                 slot.put(_ "Create new issue")
		                             end,
		                             module = "initiative",
		                             view = "new",
		                             params = { area_id = area.id }
		                         }
                        end
                    end
                end
            }

        else
            slot.put("<br />")
        end
    end
}
