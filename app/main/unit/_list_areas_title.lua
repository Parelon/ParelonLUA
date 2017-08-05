local member = param.get("member", "table")
ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 col-sm-4 col-xs-12" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary btn-back text-center" },
          module = "assembly",
          view = "index",
          content = _ "Back",
          image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6 col-sm-7 col-xs-12" },
      content = function()
        ui.container {
          attr = { class = "well-inside text-center" },
          content = function()
                ui.heading { attr = { class = "spaceline-bottom spaceline" }, level = 2, content = _ "Choose the thematic area" }
          end
        }
      end
    }

    ui.container {
      attr = { class = "col-md-3 col-sm-1 spaceline text-right hidden-xs" },
      content = function()
        ui.field.popover {
          attr = {
            dataplacement = "left",
            datahtml = "true";
            datatitle = _ "Box di aiuto per la pagina",
            datacontent = _ "Di default Parelon ti suggerisce le aree in cui sei iscritto, se è la prima volta che sei qui devi selezionare il pulsante TUTTE LE AREE per aderire a quelle di tuo interesse. <br />Una volta che ti sarai attivato, ti appare il sommario delle QUESTIONI sollevate e nel dettaglio la, o le varie PROPOSTE presentate per risolvere. <br />Puoi navigare nelle aree, interessarti, emendare e sostenere una o più PROPOSTE, o presentare una tua nuova QUESTIONE e PROPOSTA per quell' area selezionata.",
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