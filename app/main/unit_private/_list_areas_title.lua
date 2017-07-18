local member = param.get("member", "table")
ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 spaceline" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary btn-back text-center" },
          module = "assembly_private",
          view = "index",
          content = _ "Back to previous page",
          image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" }
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 text-center well-inside paper" },
              content = function()
                ui.heading { level = 1, content = _("#{realname}", { realname = member.realname and member.realname or member.login }) }
                ui.heading { level = 2, content = _ "CHOOSE THE THEMATIC AREA" }
              end
            }
          end
        }
      end
    }

    ui.container {
      attr = { class = "col-md-3  spaceline text-right hidden-xs" },
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