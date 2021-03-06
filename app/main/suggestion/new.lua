slot.set_layout("custom")

local initiative_id = param.get("initiative_id")

ui.title(function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-3 col-sm-4 col-xs-12 text-center" },
          content = function()
            ui.link {
              attr = { class = "btn btn-primary fixclick btn-back" },
              module = "initiative",
              view = "show",
              id = initiative_id,
              image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
              content = _ "Back"
            }
          end
        }

        ui.container {
          attr = { class = "col-md-8 col-sm-7 col-xs-12 spaceline text-center well-inside " },
          content = function()
            ui.heading {
              level = 1,
              attr = { class = "fittext1 uppercase spaceline spaceline-bottom" },
              content = _ "Add new suggestion"
            }
          end
        }
        ui.container {
          attr = { class = "col-md-1 col-sm-1 hidden-xs text-center spaceline" },
          content = function()
            ui.field.popover {
              attr = {
                dataplacement = "left",
                datahtml = "true";
                datatitle = _ "Box di aiuto per la pagina",
                datacontent = _ "In questa pagina puoi proporre un emendamento. Se classificherai l'emendamento con un grado <i>deve/non deve</i> verrai aggiunto ai <i>Potenziali sostenitori</i> della proposta fino a quando non riterrai che il tuo emendamento sia stato accolto. Se classificherai <i>dovrebbe/non dovrebbe</i> verrai aggiunto ai <i>Sostenitori</i> della proposta.",
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
  end)

ui.container {
  attr = { class = "well" },
  content = function()
    ui.form {
      module = "suggestion",
      action = "add",
      params = { initiative_id = initiative_id },
      routing = {
        default = {
          mode = "redirect",
          module = "initiative",
          view = "show",
          id = initiative_id,
          params = { tab = "suggestions" }
        }
      },
      content = function()
        local supported = Supporter:by_pk(initiative_id, app.session.member.id) and true or false
        if not supported then
          ui.tag {
            tag = "p",
            attr = { class = "warning" },
            value = _ "You are currently not supporting this initiative directly. \n By adding suggestions 'SHOULD' to this initiative you will automatically become a supporter. \n By adding suggestions 'MUST' to this initiative you will automatically become a potential supporter."
          }
        end
        ui.field.select {
          label = _ "Degree",
          name = "degree",
          foreign_records = {
            { id = 1, name = _ "should" },
            { id = 2, name = _ "must" },
          },
          foreign_id = "id",
          foreign_name = "name"
        }
        ui.field.text { label = _ "Title (80 chars max)", attr = { maxlength = "80" }, name = "name" }
        ui.field.select { 
          label = _ "Wiki engine",
          name = "formatting_engine",
          foreign_records = {
            { id = "rocketwiki", name = "RocketWiki" },
            { id = "compat", name = _ "Traditional wiki syntax" }
          },
          attr = { id = "formatting_engine" },
          foreign_id = "id",
          foreign_name = "name",
          value = param.get("formatting_engine")
        }
        ui.container {
          attr = { class = "label label-info spaceline spaceline-bottom " },
          content = function()
            ui.link {
              text = _ "Syntax help",
              module = "help",
              view = "show",
              id = "wikisyntax",
              attr = { onClick = "this.href=this.href.replace(/wikisyntax[^.]*/g, 'wikisyntax_'+getElementById('formatting_engine').value)" }
            }
            slot.put("&nbsp;")
            ui.link {
              text = _ "(new window)",
              module = "help",
              view = "show",
              id = "wikisyntax",
              attr = { target = "_blank", onClick = "this.href=this.href.replace(/wikisyntax[^.]*/g, 'wikisyntax_'+getElementById('formatting_engine').value)" }
            }
          end
        }
--          end
--        }
        ui.field.text {
          label = _ "Description",
          name = "content",
          multiline = true,
          attr = { rows = "10" },
          value = param.get("content")
        }
        ui.submit {
          text = _ "Commit suggestion"
        }
      end
    }
  end
}
