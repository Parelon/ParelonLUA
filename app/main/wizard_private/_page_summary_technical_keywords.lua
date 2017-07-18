local technical_areas = param.get("technical_areas", atom.string)

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 text-left paper" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function() 
                    ui.heading {
                      attr = { class = "label label-accordion" },
                      level = 3,
                      content = _ "COMPETENZE TECNICHE"
                    }
                  end
                }

                ui.container {
                  attr = { class = "col-md-12" },
                  content = function()
                    ui.tag {
                      tag = "textarea",
                      attr = {
                        id = "technical_areas",
                        name = "technical_areas",
                        class = "tagsinput",
                        style = "resize:none;"
                      },
                      content = technical_areas or ""
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
