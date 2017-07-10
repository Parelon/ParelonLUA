local area = param.get("area", "table")

ui.container {
  attr = { class = "row text-left" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 col-sm-3 col-xs-12 pull-left" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary text-center fixclick btn-back" },
          module = "assembly",
          view = "index",
          image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
          content = _ "Back to previous page"
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6 col-sm-9 col-xs-12 text-center well-inside paper" },
      content = function()
        ui.container {
          attr = { class = "row spaceline" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 text-center" },
              content = function()
                ui.heading { level = 3, content = _ "Ti trovi nell' area tematica:" }
              end
            }
            local area_id = area.id
            local name = area.name
            ui.container {
              attr = { class = "col-md-12 text-center" },
              content = function()
                ui.heading { level = 5, content = name }
              end
            }
          end
        }
      end
    }
    ui.container {
      attr = { class = "col-md-1 text-center " },
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
    ui.container {
      attr = { class = "col-md-2 col-sm-2 col-xs-12" },
      content = function()
        if app.session.member then
          ui.container {
            attr = { class = "row" },
            content = function()
              ui.container {
                attr = { class = "col-md-12 col-sm-12 col-xs-12 pull-right" },
                content = function()
                  ui.link {
                    attr = { class = "btn btn-primary text-center fixclick btn-back" },
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

        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 col-sm-12 col-xs-12 pull-right" },
              content = function()
                ui.link {
                  attr = { class = "btn btn-primary text-center fixclick btn-back" },
                  module = "area",
                  view = "details",
                  id = area.id,
                  content = _ "Details"
                }
              end
            }
          end
        }

      end
    }
  end
}
ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 text-center spaceline" },
      content = function()
        ui.heading { level = 2, attr = { class = "label label-warning" }, content = _ "Scegli la questione da esaminare:" }
      end
    }
  end
}