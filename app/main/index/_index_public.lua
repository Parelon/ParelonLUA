if config.motd_public then
  local help_text = config.motd_public
  ui.container {
    attr = { class = "wiki motd" },
    content = function()
      slot.put(format.wiki_text(help_text))
    end
  }
end

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-offset-2 col-md-8 well-title" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12" },
              content = function()
                ui.heading {
                  level = 1,
                  content = "Parlamento Elettronico Online"
                }
              end
            }
          end
        }
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12" },
              content = function()
                ui.heading {
                  level = 5,
                  content = function()
                    ui.tag { attr = { class = "pull-right" }, tag = "small", content = "Versione 1.0" }
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
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        slot.put("<hr/>")
      end
    }
  end
}

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-6 well" },
      content = function()
        execute.view {  module = 'index', view = 'login', params = { module = 'index', view = 'index', id = param.get_id() } }
      end
    }

    ui.container {
      attr = { id = "registration-info", class = "col-md-6 text-center" },
      content = function()
        ui.container {
          attr = { class = "row spaceline2" },
          content = function()
            ui.container {
              attr = { class = "col-md-12" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.tag {
                      attr = { class = "col-md-12" },
                      content = function()
                        ui.tag { tag = "p", content = _ "Possiedi gia' un codice di invito? Clicca qui:" }
                      end
                    }
                  end
                }
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { id = "registration", class = "col-md-12" },
                      content = function()
                        ui.link {
                          attr = { class = "btn btn-primary btn-large fixclick" },
                          module = "index",
                          view = "register",
                          content = function()
                            ui.heading { level = 3, content = "Registrati" }
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
          attr = { class = "row spaceline2" },
          content = function()
            ui.container {
              attr = { class = "col-md-12" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.tag {
                      attr = { class = "col-md-12" },
                      content = function()
                        ui.tag { tag = "p", content = _ "Hai smarrito la password? Clicca qui:" }
                      end
                    }
                  end
                }
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { id = "lost_password", class = "col-md-12 spaceline-bottom" },
                      content = function()
                        ui.link {
                          attr = { class = "btn btn-primary btn-large fixclick spaceline-bottom" },
                          module = 'index',
                          view = 'reset_password',
                          content = function()
                            ui.heading {level = 3, content = "Ripristina" }
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
      end
    }
  end
}