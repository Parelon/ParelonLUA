local suggestion = param.get("suggestion", "table")
ui.container {
  attr = { class = "row well" },
  content = function()
    ui.form {
      record = suggestion,
      readonly = true,
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-8 col-md-offset-1 label label-warning" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    if suggestion.author then
                      ui.heading { attr = { class = "col-md-2" }, level = 5, content = _ "Author" }
                      ui.heading { attr = { class = "col-md-4" }, level = 2, content = suggestion.author.name }
                    end
                    ui.heading { attr = { class = "col-md-2" }, level = 5, content = _ "Title" }
                    ui.heading { attr = { class = "col-md-4" }, level = 2, content = suggestion.name }
                  end
                }
              end
            }
            ui.container {
              attr = { class = "col-md-1 text-right " },
              content = function()
                ui.field.popover {
                  attr = {
                    dataplacement = "left",
                    datahtml = "true";
                    datatitle = _ "Box di aiuto",
                    datacontent = _("Qui puoi esprimere la tua opinione, in merito all' emendamento presentato: <ol><li> OPINIONE DEI SOSTENITORI; sono le opinioni dei sostenitori, il colore va dal verde (positivo) al Rosso (negativo)</li><li>LA  MIA OPINIONE; hai 5 opzioni.</li></0l>"),
                    class = "text-center"
                  },
                  content = function()
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.image { attr = { class = "icon-medium" },static = "png/tutor.png" }
                        --								    ui.heading{level=3 , content= _"What you want to do?"}
                      end
                    }
                  end
                }
              end
            }
          end
        }
        ui.container {
          attr = { class = "row spaceline spaceline-bottom text-left" },
          content = function()
            ui.heading{attr = { class = "label label-warning-tbox" },level=3 , content= _"Suggestion content"}
            ui.container {
              attr = { class = "col-md-12 well-inside paper" },
              content = function()
                ui.container {
                  attr = { class = "spaceline spaceline-bottom" },
                  content = function()
                    slot.put(suggestion:get_content("html"))
                  end
                }

              end
            }
          end
        }
        execute.view {
          module = "suggestion",
          view = "_list_element",
          params = {
            suggestions_selector = Suggestion:new_selector():add_where { "id = ?", suggestion.id },
            initiative = suggestion.initiative,
            show_name = false,
            show_filter = false
          }
        }
      end
    }
  end
}