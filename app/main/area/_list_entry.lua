local area = param.get("area", "table")
local member = param.get("member", "table")

local create = param.get("create", atom.boolean) or false

ui.container {
  attr = { class = "row spaceline" },
  content = function()   
    ui.container {
      attr = { class = "well-inside paper" },
      content = function()
        ui.container {
          attr = { class = "row text-center" },
          content = function()			
            execute.view { module = "area", view = "_head", params = { area = area, hide_unit = true, show_content = true, member = member } }
          end
        }			        
        ui.container {
          attr = { class = "row text-center" },
          content = function()
            ui.container {
              attr = { class = "col-md-4 col-md-offset-4 label label-warning spaceline spaceline-bottom" },
              content = function()
                ui.tag { attr = { class = "h1" },content = _ "Issues:" }
              end
            }
          end
        }						        
        ui.container {
          attr = { class = "row text-center spaceline-bottom" },
          content = function()
            ui.container {
              attr = { class = "col-lg-2 col-md-4 col-sm-6 col-xs-12" },
              content = function()						        
                ui.link {
                  attr = { class = "btn btn-primary large_btn margin_line text-center spaceline" },
                  module = "area",
                  view = "show",
                  id = area.id,
                  params = { tab = "open", filter = "new" },
                  text = _("#{count} new", { count = area.issues_new_count })
                }
              end
            }
            ui.container {
              attr = { class = "col-lg-2 col-md-4 col-sm-6 col-xs-12" },
              content = function()						        
                ui.link {
                  attr = { class = "btn btn-primary large_btn margin_line text-center spaceline spaceline-bottom" },
                  module = "area",
                  view = "show",
                  id = area.id,
                  params = { tab = "open", filter = "accepted" },
                  text = _("#{count} in discussion", { count = area.issues_discussion_count })
                }
              end
            }
            ui.container {
              attr = { class = "col-lg-2 col-md-4 col-sm-6 col-xs-12" },
              content = function()	
                ui.link {
                  attr = { class = "btn btn-primary large_btn margin_line text-center spaceline spaceline-bottom" },
                  module = "area",
                  view = "show",
                  id = area.id,
                  params = { tab = "open", filter = "half_frozen" },
                  text = _("#{count} in verification", { count = area.issues_frozen_count })
                }
              end
            }
            ui.container {
              attr = { class = "col-lg-2 col-md-4 col-sm-6 col-xs-12" },
              content = function()	
                ui.link {
                  attr = { class = "btn btn-primary large_btn margin_line text-center spaceline spaceline-bottom" },
                  module = "area",
                  view = "show",
                  id = area.id,
                  params = { tab = "open", filter = "frozen" },
                  text = _("#{count} in voting", { count = area.issues_voting_count })
                }
              end
            }
            ui.container {
              attr = { class = "col-lg-2 col-md-4 col-sm-6 col-xs-12" },
              content = function()	
                ui.link {
                  attr = { class = "btn btn-primary large_btn margin_line text-center spaceline spaceline-bottom" },
                  module = "area",
                  view = "show",
                  id = area.id,
                  params = { tab = "closed", filter = "finished" },
                  text = _("#{count} finished", { count = area.issues_finished_count })
                }
              end
            }
            ui.container {
              attr = { class = "col-lg-2 col-md-4 col-sm-6 col-xs-12" },
              content = function()	
                ui.link {
                  attr = { class = "btn btn-primary large_btn margin_line text-center spaceline spaceline-bottom" },
                  module = "area",
                  view = "show",
                  id = area.id,
                  params = { tab = "closed", filter = "canceled" },
                  text = _("#{count} canceled", { count = area.issues_canceled_count })
                }
              end
            }
          end
        }
      end
    }
  end
}