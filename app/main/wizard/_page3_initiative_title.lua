ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()

        ui.container {
          attr = { class = "panel panel-default"},
          content = function()	  

            ui.container {
              attr = {
                class = "row",
                role = "tab",
                id = "headingInitiativeTitle"
              },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    ui.container {
                      attr = { class = "col-md-2 col-sm-3 text-center hidden-xs" },
                      content = function()                        
                        if param.get("concat", atom.boolean) then
                          ui.tag {
                            tag = "a",
                            attr = {
                              id = "initiativeTitleBack",
                              class = "btn btn-primary btn-wizard hidden-xs",
                              style = "display: none;",
                              target = "_blank",
                              onclick = "collapseAll(); $('#issue_keywords').collapse('show');"
                            },
                            content = _"Back"
                          }
                        else
                          slot.put("&nbsp;")
                        end
                      end
                    }

                    ui.container {
                      attr = { class = "col-md-8 col-sm-6" },
                      content = function()
                        ui.heading { 
                          level = 3,
                          attr = {
                            datatoggle = "collapse",
                            class = "label label-accordion panel-title btn",
                            href = "#initiative_title",
                            ariaexpanded = "true",
                            ariacontrols = "initiative_title",
                            onclick = "collapseAll(); $('#initiative_title').collapse('show')"
                          },
                          content = function()
                            ui.container {
                              attr = { class = "row" },
                              content = function()
                                ui.container {
                                  attr = { class = "col-md-10 col-xs-7" },
                                  content = function() 
                                    ui.image { static = "png/arrow-down-icon.png" }
                                    slot.put(_ "Title")
                                  end
                                }
                                ui.container {
                                  attr = { class = "col-md-2 col-sm-3 col-xs-5" },
                                  content = function() 
                                    ui.image { attr = { class = "icon-medium" },static = "svg/arrow-right.svg" }
                                  end
                                }
                              end
                            }
                          end
                        }
                      end
                    }

                    ui.container {
                      attr = { class = " col-md-2 text-center hidden-xs" },
                      content = function()
                        local style = ""
                        if param.get("concat", atom.boolean) then
                          style = "display: none;"
                        end
                        ui.tag {
                          tag = "a",
                          attr = {
                            id = "initiativeTitleNext",
                            style = style,
                            class = "btn btn-primary btn-wizard",
                            target = "_blank",
                            onclick = "collapseAll(); $('#initiative_abstract').collapse('show');"
                          },
                          content = _"Next"
                        }
                      end
                    }
                  end
                }
              end
            }

            local class = "panel-collapse collapse"
            if not param.get("concat", atom.boolean) then
              class = class .. " in"
            end

            ui.container {
              attr = {
                id = "initiative_title",
                class = class,
                role = "tabpanel",
                arialabelledby = "headingInitiativeTitle"
              },
              content = function()
                ui.container {
                  attr = { class="panel-body"},
                  content = function()
                    -- Descrizione del problema
                    ui.container {
                      attr = { class = "row" },
                      content = function()
                        ui.container {
                          attr = { class = "col-md-12" },
                          content = function()
                            ui.field.text {
                              name = "initiative_title",
                              label = _"Give your solution a title" .. ":",
                              value = param.get("initiative_title", atom.string) or ""
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
  end
}
ui.script { script = "$('#initiative_title').on('hide.bs.collapse', function() { $('#initiativeTitleNext').hide();});" }
ui.script { script = "$('#initiative_title').on('show.bs.collapse', function() { $('#initiativeTitleNext').show();});" }
if param.get("concat", atom.boolean) then
  ui.script { script = "$('#initiative_title').on('hide.bs.collapse', function() { $('#initiativeTitleBack').hide();});" }
  ui.script { script = "$('#initiative_title').on('show.bs.collapse', function() { $('#initiativeTitleBack').show();});" }
end