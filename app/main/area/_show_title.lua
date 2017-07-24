local area = param.get("area", "table")

ui.container {
  attr = { class = "row text-left" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 col-sm-4 col-xs-12" },
      content = function()
        if app.session.member then
          ui.container {
            attr = { class = "row" },
            content = function()
				  ui.link {
				    attr = { class = "btn btn-primary text-center fixclick btn-back" },
				    module = "unit",
				    view = "list_areas",
				    id = area.unit.id,
				    image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
				    content = _ "Back to previous page"
				  }
            end
          }
        end
      end
    }
    ui.container {
      attr = { class = "col-md-6 col-sm-7 col-xs-12 text-center well-inside"},
      content = function()
                ui.heading { attr = { class = "spaceline"},level = 3, content = _ "Ti trovi nell' area tematica:" }
            local area_id = area.id
            local name = area.name
                ui.heading { attr = { class = "spaceline-bottom"},level = 2, content = name }
                ui.container {
  attr = { class = "row" },
  content = function()
    ui.heading {
      level = 2, 
      attr = { class = "spaceline-bottom" }, 
      content = _ "Scegli la questione da esaminare:" }
  end
}
      end
    }
    ui.container {
      attr = { class = "col-md-3 col-sm-1 hidden-xs" },
      content = function()
        if app.session.member then
          ui.container {
            attr = { class = "row text-right spaceline" },
            content = function()
                ui.field.popover {
                  attr = {
                    dataplacement = "left",
                    datahtml = "true";
                    datatitle = _ "Box di aiuto per la pagina",
                    datacontent = _ "Sei nell'elenco delle QUESTIONI presentate per questa area tematica, puoi applicare i filtri per selezionare con maggior precisione quelle di tuo interesse, o scorrere le QUESTIONI ed entrare nei dettagli.",
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
        end
    }
    ui.container {
          attr = { class = "row text-center" },
          content = function()
        ui.container {
          attr = { class = "col-sm-6 col-md-6" },
          content = function()
                ui.link {
                  attr = { class = "btn btn-primary text-center fixclick btn-large" },
                  module = "area",
                  view = "details",
                  id = area.id,
                  content = _ "Details"
                }
          end
        }
          ui.container {
            attr = { class = "col-sm-6 col-md-6" },
            content = function()
                    ui.link {
                      attr = { class = "btn btn-primary text-center fixclick btn-large" },
                      module = "area",
                      view = "settings",
                      id = area.id,
                      content = _ "Settings"
                    }
            end
          }
      end
    }
  end
}