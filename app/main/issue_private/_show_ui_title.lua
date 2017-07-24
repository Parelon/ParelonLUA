local issue = param.get("issue", "table")

local url = request.get_absolute_baseurl() .. "issue_private/show/" .. tostring(issue.id) .. ".html"
local titleWidth = "7"
local return_view = "show"
local return_module = "area_private"
local return_btn_txt = _ "Back to previous page"
if not app.session.member then
  titleWidth = "11"
end

if view == "homepage" then
  return_module = "index"
  return_view = "index"
  return_btn_txt = _ "Back to homepage"
elseif view == "area" then
  return_module = "area"
  return_view = "show"
  return_btn_txt = _ "Back to issue listing"
elseif view == "area_private" then
  return_module = "area_private"
  return_view = "show"
  return_btn_txt = _ "Back to issue listing"
end

ui.container {
  attr = { class = "row" },
  content = function()
    if app.session.member then
      ui.container {
        attr = { class = "col-md-3 col-sm-4 col-xs-12 text-center" },
        content = function()
          ui.link {
            attr = { class = "btn btn-primary fixclick btn-back" },
            module = return_module,
            id = issue.area.id,
            view = return_view,
            params = param.get_all_cgi(),
            image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
            content = return_btn_txt
          }
        end
      }
    end
    ui.container {
      attr = { class = "col-md-" .. titleWidth .. " col-sm-8 col-xs-12 text-center well-inside spaceline"},
      content = function()
        ui.container {
          content = function()
            ui.heading { attr = { class = "spaceline spaceline-bottom fittext1 uppercase "},level = 1,  content = _ "Details for issue Q" .. issue.id }
          end
        }
      end
    }

    ui.container {
      attr = { class = "col-md-1 hidden-xs hidden-sm text-right spaceline"},
      content = function()
        ui.field.popover {
          attr = {
            dataplacement = "bottom",
            datahtml = "true";
            datatitle = _ "Box di aiuto per la pagina",
            datacontent = _ "Ti trovi nei dettagli della QUESTIONE, con le informazioni integrali. Al box SOLUZIONI PROPOSTE puoi leggere la, o le PROPOSTE presentate per risolvere la QUESTIONE, o presentrare una tua PROPOSTA alternativa.<div class='spaceline'> <iframe width='560' height='315' src='https://www.youtube.com/embed/DPWS4mtPbnM' frameborder='0' allowfullscreen></iframe></div>",
            datahtml = "true",
            class = "text-center"
          },
          content = function()
            ui.image { attr = { class = "icon-medium" },static = "png/tutor.png" }
          end
        }
      end
    }
  end
}
ui.container {
  attr = {class = "row spaceline"},
  content = function()
    ui.container { 
      attr = { id = "social_box",  class = "col-md-4 col-xs-12 col-sm-12 text-center spaceline" }, 
      content = function() 
        slot.put('<div data-url="' .. url .. '" class="addthis_sharing_toolbox"></div>')
      end 
    }

    ui.container {
      attr = { class = "col-md-8 col-sm-12  col-xs-12" },
      content = function()

        ui.heading { level = 6, attr = { class = "" }, content = _ "Issue link (copy the link and share to the web):" }
        slot.put("<input id='issue_url_box' type='text' value=" .. url .. ">")
      end
    }           
  end
}