execute.view {
  module = "index",
  view = "_notifications"
}

local member = app.session.member;

execute.view {
  module = "index",
  view = "_positions"
}

ui.title(
  function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-5 col-md-offset-1 col-xs-12 col-sm-12 well-inside text-center" },
              content = function()
                    ui.heading {
                      attr = { class = "spaceline spaceline-bottom" },
                      level = 1,
                      content = function()
                        slot.put(_("Welcome <strong>#{realname}</strong>.", { realname = (member.realname ~= "" and member.realname or member.login) }))
                      end
                    }
              end
            }
            ui.container {
              attr = { class = "col-md-6 spaceline hidden-xs hidden-sm" },
              content = function()
                ui.container {
                  attr = { class = "col-md-7 text-right spaceline" },
                  content = function()
                    ui.heading { level = 3, content = _"The first time? click here:"}
                  end
                }
                ui.container {
                  attr = { class = "col-md-3 text-left" },
                  content = function()
                    ui.image { attr = { class = "arrow_big" }, static = "svg/arrow-right.svg" }
                  end
                }
                ui.container {
                  attr = { class = "col-md-2 text-center " },
                  content = function()
                    ui.field.popover {
                      attr = {
                        dataplacement = "left",
                        datahtml = "true";
                        datatitle = _ "Box di aiuto per la pagina",
                        datacontent = _ "<p class='spaceline-bottom'>Se sei su queste pagine per la prima volta, BENVENUTO! Per poter comprendere e navigare nei contenuti di Parelon, in ogni box troverai l'icona di aiuto, che ti supporterà con suggerimenti e tutorial, anche video. In questo breve tutorial, i primi passi su Parelon.</p><br>".."<iframe width='560' height='315' src='https://www.youtube.com/embed/videoseries?list=PLLVi3WpqQgKQY0SARzvwvhNr46NkuIDWm' frameborder='0' allowfullscreen></iframe>".." Se vuoi vedere tutti i tutorial sia testuali che video vai qui:<br><a class ='btn btn-primary large_btn fixclick spaceline spaceline-bottom'  href='https://www.parelon.com/?project=primo-accesso&lang=it' target='_blank'><h3>Vai ai Tutorial</h3></a>",
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
          end
        }
    ui.container {
      attr = { class = "row spaceline" },
      content = function()
        ui.heading {
          level = 2,
          attr = { class = "col-md-8 text-right spaceline" },
          content = function()
            slot.put(_ "You are an auditor. This means that you can manage members in the Auditor Panel")
          end
        }
        ui.container {
          attr = { class = "col-md-3 col-md-offset-1" },
          content = function()
            ui.link {
              module = "auditor",
              view = "index",
              attr = { class = "btn btn btn-primary xlarge_btn" },
              content = _ "Auditor Panel"
            }
          end
        }
      end
    }
  end
)
-- inizio icone
ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-6 col-lg-6 text-center hidden-xs hidden-sm" },
      content = function()
        ui.image {
          attr = { class = "img_assembly_small" },
          static = "parlamento_icon_small.png"
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6 col-lg-6 text-center hidden-xs hidden-sm" },
      content = function()
        ui.image {
          attr = { class = "img_assembly_small" },
          static = "work_table.png"
        }
      end
    }
  end
}
ui.container {
  attr = { class = "row text-center" },
  content = function()
    ui.container {
      attr = { class = "hidden-md hidden-lg col-sm-2 col-xs-2 spaceline" },
      content = function()
        ui.image {
          attr = { class = "icon-medium" },
          static = "parlamento_icon_small.png"
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6 col-lg-6 col-sm-10 col-xs-10 spaceline" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary btn-large fixclick" },
          module = "assembly",
          view = "index",
          content = function()
            ui.heading { level = 3, content = _ "Assemblea Pubblica" }
          end
        }
      end
    }				
    ui.container {
      attr = { class = "hidden-md hidden-lg col-sm-2 col-xs-2 spaceline" },
      content = function()
        ui.image {
          attr = { class = "icon-medium" },
          static = "icon_green.png"
        }
      end
    }
    ui.container {
      attr = { class = "col-md-6 col-lg-6 col-sm-10 col-xs-10 spaceline" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary btn-large fixclick" },
          module = "assembly_private",
          view = "index",
          content = function()
            ui.heading { level = 3, content = _ "Tavoli di lavoro" }
          end
        }
      end
    }
  end
}
--  fine icone Bottoni

-- cruscotto di stato
execute.view {
  module = "index",
  view = "_dashboard"
}