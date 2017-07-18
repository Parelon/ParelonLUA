local initiative = param.get("initiative", "table")
local issue = param.get("issue", "table")

local url = encode.url { base = request.get_absolute_baseurl(), module = "initiative", view = "show", params = { initiative_id = initiative.id } }

local return_view = "show"
local return_module = "issue"
local return_btn_txt = _ "Back"
local return_id = initiative.issue_id
if app.session.member_id ~= nil then
  if view == "homepage" then
    return_module = "index"
    return_view = "assembly_public"
    return_btn_txt = _ "Back to Assembly"
  elseif view == "area" then
    return_module = "area"
    return_view = "show"
    return_btn_txt = _ "Back to issue listing"
    return_id = issue.area_id
  elseif view == "area_private" then
    return_module = "area_private"
    return_view = "show"
    return_btn_txt = _ "Back to issue listing"
    return_id = issue.area_id
  end
end

ui.container {
  attr = { class = "row text-center" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 col-sm-5 col-xs-12" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary btn-back h2" },
          module = return_module,
          id = return_id,
          view = return_view,
          params = param.get_all_cgi(),
          image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
          content = _ "Back to previous page"
        }
      end
    }

    ui.container {
      attr = { class = "col-md-7 col-md-offset-1 col-sm-6 col-xs-12 spaceline" },
      content = function()
        ui.container {
          attr = { class = "label label-warning" },
          content = function()
            ui.heading { level = 1, attr = { class = "fittext1 uppercase" }, content = _ "Details for initiative I" .. initiative.id }
          end
        }
      end
    }
    ui.container {
      attr = { class = "col-md-1 text-right spaceline hidden-xs hidden-sm" },
      content = function()
        ui.field.popover {
          attr = {
            dataplacement = "left",
            datahtml = "true";
            datatitle = _ "Box di aiuto per la pagina",
            datacontent = _ "Ti trovi nei dettagli della PROPOSTA, con le informazioni integrali, in ogni box i tutor per le funzionalità specifiche<div class='spaceline'><iframe width='560' height='315' src='https://www.youtube.com/embed/5oiC5OhkmIk' frameborder='0' allowfullscreen></iframe></div>",
            class = "text-center"
          },
          content = function()
            ui.image { attr = { class = "icon-medium" }, static = "png/tutor.png" }
          end
        }
      end
    }
  end
}
ui.container {
  attr = { class = "row"},
  content = function()
    ui.container { 
      attr = {  id = "social_box", class = "col-md-4 col-xs-12 col-sm-12 spaceline3" }, 
      content = function() 
        slot.put('<div data-url="' .. url .. '" class="addthis_sharing_toolbox"></div>')
      end 
    }

    ui.container {
      attr = { class = "col-md-6 col-md-offset-1 col-xs-12 col-sm-12" },
      content = function()
        ui.heading { level = 6, attr = { class = "" }, content = _ "Issue link (copy the link and share to the web):" }
        slot.put("<input id='issue_url_box' type='text' value=" .. url .. ">")
      end
    }           
  end
}