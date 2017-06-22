local member = app.session.member

execute.view {
  module = "index",
  view = "_notifications"
}

ui.container {
  attr = { class = "row-fluid" },
  content = function()
    ui.container {
      attr = { class = "span12 well text-center" },
      content = function()
        ui.container {
          attr = { class = "row-fluid" },
          content = function()
            ui.container {
              attr = { class = "span5 offset1 spaceline" },
              content = function()
                ui.heading {
                  level = 1,
                  content = function()
                    slot.put(_("Welcome <strong>#{realname}</strong>.", { realname = (member.realname ~= "" and member.realname or member.login) }))
                  end
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
  attr = { class = "offset5 span4 text-right spaceline " },
  content = function()
    ui.heading { level = 3, content = "La prima volta? clicca qui:" }
  end
}

ui.container {
  attr = { class = "span1 text-left spaceline" },
  content = function()
    ui.image { attr = { class = "arrow_medium" }, static = "svg/arrow-right.svg" }
  end
}
ui.container {
  attr = { class = "span1 text-left " },
  content = function()
    ui.field.popover {
      attr = {
        dataplacement = "left",
        datahtml = "true";
        datatitle = _ "Box di aiuto per la pagina",
        datacontent = _ "Se sei su queste pagine per la prima volta, BENVENUTO! Per poter comprendere e navigare nei contenuti di Parelon, in ogni box troverai l'icona di aiuto, che ti supporterà con suggerimenti e tutorial, anche video. In questa prima pagina trovi due pulsanti principali, Assemblea Pubblica e Assemblea Interna.".."<a href='https://www.parelon.com/it/caratterisitche/tutorial.html'>Tutorial</a>",
        class = "text-center"
      },
      content = function()
        ui.image { static = "png/tutor.png" }
      end
    }
  end
}

ui.container {
  attr = { class = "row-fluid spaceline" },
  content = function()
    ui.container {
      attr = { class = "span10 offset1 text-center" },
      content = function()
        ui.heading { level = 2, attr = { class = "uppercase" }, content = _ "Choose the assembly you want to participate:" }
      end
    }
  end
}

-- inizio icone
ui.container {
  attr = { class = "row-fluid" },
  content = function()
    ui.container {
      attr = { class = "span6 text-center" },
      content = function()
        ui.image {
          attr = { class = "img_assembly_small" },
          static = "parlamento_icon_small.png"
        }
      end
    }
    ui.container {
      attr = { class = "span6 text-center" },
      content = function()
        ui.image {
          attr = { class = "img_assembly_small" },
          static = "parlamento_icon_small.png"
        }
      end
    }
  end
}
--  fine icone

--  Bottoni
ui.container {
  attr = { class = "row-fluid text-center" },
  content = function()
    ui.container {
      attr = { class = "span6" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary btn-large large_btn fixclick" },
          module = "index",
          view = "homepage_bs",
          content = function()
            ui.heading { level = 3, content = _ "PUBLIC ASSEMBLY" }
          end
        }
      end
    }

    ui.container {
      attr = { class = "span6" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary btn-large large_btn fixclick" },
          module = "index",
          view = "homepage_private_bs",
          content = function()
            ui.heading { level = 3, content = _ "INTERNAL ASSEMBLY" }
          end
        }
      end
    }
  end
}
-- cruscotto di stato
execute.view { module = "index", view = "_dashboard" }