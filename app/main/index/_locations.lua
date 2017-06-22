if app.session.member then
  local member = app.session.member
  local lastLogin = member:get_login_data()
  if lastLogin and lastLogin.geolat and lastLogin.geolng and lastLogin.login_time then

    ui.container{attr = {class = "row-fluid spaceline" },content = function()
        ui.container{ attr = { class  = "span12 alert location_data2 text-center" }, content = function()
            ui.container{attr = {class = "row-fluid" },content = function()

                ui.container{ attr = { class  = "span9 text-center" }, content = function()
                    ui.container{attr = {class = "row-fluid" },content = function()

                        ui.container{ attr = { class  = "span12 text-left" }, content = function()
                            ui.heading{level=4,content=function()
                                ui.tag{
                                  content= _("Your last login was on #{last_login_date} at #{last_login_time}", {
                                      last_login_date = format.date(lastLogin.login_time),
                                      last_login_time = format.time(lastLogin.login_time)
                                    })
                                }
                                slot.put("&nbsp;")
                                ui.tag{ tag="span", attr = { id = "last_location"}, content="" }
                                ui.script{ script = 'getLastLocation('..lastLogin.geolat..','..lastLogin.geolng..',"last_location", "'..  _"from " ..'");'}
                              end }
                          end }

                      end }

                    ui.container{attr = {class = "row-fluid" },content = function()
                        ui.container{ attr = { class  = "span12 text-right" }, content = function()
                            ui.heading{level=6,content=function()
                                slot.put(_"You didn't logged in from this location? Report it immediatly:")
                                ui.image{ attr = { class="arrow_small"}, static="svg/arrow-right.svg"}
                              end }
                          end }
                      end }

                  end }

                ui.container{ attr = { class  = "span3 text-right" }, content = function()
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

    ui.container{attr = {class = "row-fluid spaceline" },content = function()
        ui.container{ attr = { class  = "span12 alert location_data2 text-center" }, content = function()
            ui.container{attr = {class = "row-fluid" },content = function()

                ui.container{ attr = { class  = "span9 text-center" }, content = function()
                    ui.container{attr = {class = "row-fluid" },content = function()

                        ui.container{ attr = { class  = "span12 text-left" }, content = function()
                            ui.heading{level=4,content=function()
                                if lastLogin and lastLogin.login_time then
                                  ui.tag{ content= _("This is your first connection") }
                                end
                              end }
                          end }

                      end }

                    ui.container{attr = {class = "row-fluid" },content = function()
                        ui.container{ attr = { class  = "span12 text-right" }, content = function()
                            ui.heading{level=6,content=function()
                                slot.put(_"You didn't logged in from this location? Report it immediatly:")
                                ui.image{ attr = { class="arrow_small"}, static="svg/arrow-right.svg"}
                              end }
                          end }
                      end }

                  end }

                ui.container{ attr = { class  = "span3 text-right" }, content = function()
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
  end
end