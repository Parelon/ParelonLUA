ui.container {
  attr = { class = "row" },
  content = function()                
    ui.container {
      attr = { class = "col-md-3 text-center hidden-xs col-sm-4" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary fixclick btn-back" },
          module = "index",
          view = "index",
          image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
          content = _ "Back"
        }
      end
    }
    ui.container {
      attr = { class = "spaceline spaceline-bottom col-md-6 well-inside paper text-center col-xs-12 col-sm-8" },
      content = function()
        ui.heading {attr = { class = "spaceline" },
          level = 1,
          content = function()
            slot.put(_("Welcome <strong>#{realname}</strong>.", { realname = (app.session.member.realname and app.session.member.realname or app.session.member.login) }))
          end
        }
        ui.heading {level = 6, content = _ "You are in the Public Assembly" }
      end
    }
    --[[ mobile button-back ]]
    ui.container {
      attr = { class = "col-md-12 text-center hidden-sm hidden-md hidden-lg" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary fixclick btn-back" },
          module = "index",
          view = "index",
          image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
          content = _ "Back"
        }
      end
    }
    --[[ End mobile button-back ]]
    ui.container {
      attr = { class = "col-md-3 col-sm-12 hidden-xs text-right" },
      content = function()
        ui.field.popover {
          attr = {
            dataplacement = "left",
            datahtml = "true";
            datatitle = _ "Box di aiuto per la pagina",
            datacontent = _ "<h3 class='spaceline-bottom'>Video tutorial</h3><iframe width='560' height='315' src='https://www.youtube.com/embed/OfUpzqDV7Pc' frameborder='0' allowfullscreen></iframe>",
            datahtml = "true",
            class = "text-center"
          },
          content = function()
            ui.image { attr = { class = "icon-medium " },static = "png/tutor.png" }
          end
        }
      end
    }
  end
}