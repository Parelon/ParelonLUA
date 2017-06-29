local suggestion = param.get("suggestion", "table")
ui.container {
    attr = { class = "row" },
    content = function()
          ui.form {
              attr = { class = "text-center" },
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
                                      attr = { class = "col-md-6" },
                                      content = function()
                                          if suggestion.author then
                                              suggestion.author:ui_field_text { label = _ "Author" }
                                          end
                                      end
                                  }
                                  ui.container {
                                      attr = { class = "col-md-6" },
                                      content = function()
                                          ui.field.text { label = _ "Title", name = "name" }
                                      end
                                  }
                              end
                          }
                          ui.container {
                              attr = { class = "col-md-1 col-md-offset-1 text-right " },
                              content = function()
                                  ui.field.popover {
                                      attr = {
                                          dataplacement = "left",
                                          datahtml = "true";
                                          datatitle = _ "Box di aiuto",
                                          datacontent = _("Qui puoi esprimere la tua opinione, in merito all' emendamento presentato: <ol><li> OPINIONE DEI SOSTENITORI; sono le opinioni dei sostenitori, il colore va dal verde (positivo) al Rosso (negativo)</li><li>LA  MIA OPINIONE; hai 5 opzioni.</li></0l>"),
                                          datahtml = "true",
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
                          ui.heading{attr = { class = "label label-warning-tbox" },level=3 , content= _"Suggestion"}
                          ui.container {
                              attr = { class = "col-md-12 well-inside paper" },
                              content = function()
                                  slot.put(suggestion:get_content("html"))
                              end
                          }
                      end
                  }
                  ui.container {
                      attr = { class = "row spaceline spaceline-bottom text-left" },
                      content = function()
                          ui.heading{attr = { class = "label label-warning-tbox" },level=3 , content= _"Versione originale"}                      
                          ui.container {
                              attr = { class = "col-md-12 well-inside paper" },
                              content = function()
                                  slot.put(suggestion:get_content("html"))
                                  
                                  
                        ui.tag { tag = "p", attr = { class = "initiative_brief_description initiative_list_box" }, content = initiative_brief_description or _ "No description available" }                                  
                                  
                                  
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
