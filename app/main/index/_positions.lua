if config.use_positions then
  ui.script { static = "js/position.js" }

  local member = app.session.member
  local curLogin = member:get_login_data('last')

-- Demo data start
--------------------------------------------------------------------------
  if curLogin == nil or not curLogin.geolat or not curLogin.geolng or not curLogin.login_time  then
    curLogin = { member_id = member.id, geolat = "41.87499810", geolng = "12.51125750", login_time = atom.timestamp:load("2013-07-10 18:05:55") }
  end
--------------------------------------------------------------------------
-- Stop demo data

  if curLogin and curLogin.geolat and curLogin.geolng and curLogin.login_time then
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-12 alert location_data text-center" },
          content = function()
            ui.container {
              attr = { class = "row" },
              content = function()
                ui.container {
                  attr = { class = "col-md-9 text-center" },
                  content = function()
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.container {
                          attr = { class = "col-md-6 text-left" },
                          content = function()
                            ui.heading {
                              level = 4,
                              content = function()
                                slot.put(_("Welcome <strong>#{realname}</strong>.", { realname = (member.realname ~= "" and member.realname or member.login) }))
                                ui.tag { tag = "col-md-", attr = { id = "current_location" }, content = "posizione corrente" }
                                ui.script { script = 'getLocation("current_location", " ' .. _ "You're connected from" .. '");' }
                            end
                            }                          end
                        }
                        ui.container {
                          attr = { class  = "col-md-4 text-right" },
                          content = function()
                            ui.heading {
                              level=6,
                              content = function()
                                slot.put(_"If it is not so, press here:")
                                ui.image{ attr = { class="arrow_small"}, static = "svg/arrow-right.svg" }
                              end
                            }                            
                          end
                        }
                        ui.container {
                          attr = { class = "col-md-2" },
                          content = function()
                            ui.anchor
                            {
                              attr = { href = "#", class = "btn btn-primary fixclick", disabled = "true" },
                              content=function()
                                ui.heading{level=3 ,content= _"Correct your position"}
                              end
                            }
                          end 
                        }
                      end
                    }
                  end
                }
                ui.script{script = "jQuery('.fittext_report').fitText(1.0, {minFontSize: '19px', maxFontSize: '28px'}); " }
              end
            }
          end
        }
      end
    }
  end

  if lastLogin and lastLogin.geolat and lastLogin.geolng and lastLogin.login_time then
    ui.container {
      attr = {class = "row spaceline" },
      content = function()
        ui.container {
          attr = { class  = "col-md-12 alert location_data2 text-center" },
          content = function()
            ui.container {
              attr = {class = "row" },
              content = function()
                ui.container {
                  attr = { class  = "col-md-9 text-center" },
                  content = function()
                    ui.container { 
                      attr = {class = "row" },
                      content = function()
                        ui.container {
                          attr = { class  = "col-md-12 text-left" },
                          content = function()
                            ui.tag {
                              tag = "col-md-",
                              attr = { class = "col-md-12", id = "last_location"},
                              content =
                              _("Your last login was on #{last_login_date} at #{last_login_time}", {
                                  last_login_date = format.date(lastLogin.login_time),
                                  last_login_time = format.time(lastLogin.login_time)
                                  } )
                            }
                            ui.script{ script = 'getLastLocation('..lastLogin.geolat..','..lastLogin.geolng..',"last_location", "'..  _"from " ..'");'}
                          end
                        }
                      end
                    }

                    ui.container {
                      attr = {class = "row" },
                      content = function()
                        ui.container {
                          attr = { class  = "col-md-12 text-right" },
                          content = function()
                            ui.heading {
                              level = 6,
                              content = function()
                                slot.put(_"You didn't logged in from this location? Report it immediatly:")
                                ui.image{ attr = { class="arrow_small"}, static="svg/arrow-right.svg"}
                              end
                            }
                          end
                        }
                      end
                    }
                  end
                }

                ui.container{ attr = { class  = "col-md-3 text-right" }, content = function()
                    ui.anchor{
                      attr = {
                        href = "#",
                        class = "btn btn-primary fixclick",
                        onclick = "alert('Dato sospetto segnalato! (Non implementato)' );"
                      },
                      content=function()
                        ui.heading{level=3, content= _"Report suspect data"}
                      end
                    }
                    ui.script{script = "jQuery('.fittext_report').fitText(1.0, {minFontSize: '19px', maxFontSize: '28px'}); " }
                  end }
              end }
          end }
      end }
  else

    ui.container{attr = {class = "row spaceline" },content = function()
        ui.container{ attr = { class  = "col-md-12 alert location_data2 text-center" }, content = function()
            ui.container{attr = {class = "row" },content = function()
                ui.container{ attr = { class  = "col-md-9 text-center" }, content = function()
                    ui.container{attr = {class = "row" },content = function()
                        ui.container{ attr = { class  = "col-md-12 text-left" }, content = function()
                            ui.heading{level=4,content=function()
                                if lastLogin and lastLogin.login_time then
                                  ui.tag{ content= _("This is your first connection") }
                                end
                              end }
                          end }

                      end }

                    ui.container{attr = {class = "row" },content = function()
                        ui.container{ attr = { class  = "col-md-12 text-right" }, content = function()
                            ui.heading{level=6,content=function()
                                slot.put(_"You didn't logged in from this location? Report it immediatly:")
                                ui.image{ attr = { class="arrow_small"}, static="svg/arrow-right.svg"}
                              end }
                          end }
                      end }

                  end }

                ui.container{ attr = { class  = "col-md-3 text-right" }, content = function()
                    ui.anchor{
                      attr = {
                        href = "#",
                        class = "btn btn-primary fixclick",
                        disabled = "true"
                      },
                      content=function()
                        ui.heading{level=3, content= _"Report suspect data"}
                      end
                    }
                    ui.script{script = "jQuery('.fittext_report').fitText(1.0, {minFontSize: '19px', maxFontSize: '28px'}); " }
                  end
                }
              end
            }
          end 
        }
      end
    }
  end
end