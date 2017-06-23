local type_id = param.get_id()
local state = param.get("state") or "any"
local scope = param.get("scope") or "all_units"
local orderby = param.get("orderby") or "event"
local desc = param.get("desc", atom.boolean) or false
local interest = param.get("interest") or "any"
local member = app.session.member
local ftl_btns = param.get("ftl_btns", atom.boolean) or false

ui.title(function()
    ui.container {
      attr = { class = "row-fluid" },
      content = function()
        ui.container {
          attr = { class = "span3 text-left" },
          content = function()
            ui.link {
              attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back" },
              module = "index",
              view = "index",
              params = { initiative_id = param.get_id() },
              image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
              content = _ "Back to previous page"
            }
          end
        }
        ui.container {
          attr = { class = "span8 text-center" },
          content = function()
            ui.heading {
              level = 1,
              content = function()
                slot.put(_("Welcome <strong>#{realname}.</strong>", { realname = (app.session.member.realname and app.session.member.realname or app.session.member.login) }))
              end
            }

            ui.heading { level = 6, content = _ "You are now inside the Digital Assembly for Public Affairs." }
            ui.heading { level = 6, content = _ "Here laws and measures for Region and his citizens are being discussed." }
          end
        }
        ui.container {
          attr = { class = "span1 text-center " },
          content = function()
            ui.field.popover {
              attr = {
                dataplacement = "left",
                datahtml = "true";
                datatitle = _ "Box di aiuto per la pagina",
                datacontent = _ "Choose by pressing one of the following buttons:",
                datahtml = "true",
                class = "text-center"
              },
              content = function()
                ui.image { static = "png/tutor.png" }
              end
            }
          end
        }
      end
    }
  end)

-- Right selector
local issues_selector_myinitiatives = Issue:new_selector()
execute.chunk {
  module = "issue",
  chunk = "_filters_ext",
  params = {
    state = state,
    orderby = orderby,
    desc = desc,
    scope = scope,
    interest = interest,
    selector = issues_selector_myinitiatives
  }
}

-- Left selector
local issues_selector_voted = Issue:new_selector()
execute.chunk {
  module = "issue",
  chunk = "_filters_ext",
  params = {
    state = state,
    orderby = orderby,
    desc = desc,
    scope = scope,
    interest = "voted",
    selector = issues_selector_voted
  }
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
              attr = { class = "span12" },
              content = function()
                ui.container {
                  attr = { class = "row-fluid" },
                  content = function()
                    ui.container {
                      attr = { class = "span12" },
                      content = function()
                        ui.heading { level = 2, content = _ "What you want to do?" }
                        ui.heading { level = 6, content = _ "Choose by pressing one of the following buttons:" }
                      end
                    }
                  end
                }
                ui.container {
                  attr = { class = "row-fluid text-center spaceline-bottom" },
                  content = function()

                    ui.container {
                      attr = { class = "span6 spaceline" },
                      content = function()
                        ui.link {
                          attr = { class = "btn btn-primary large_btn" },
                          module = "unit",
                          view = "show_ext",
                          params = { filter = "my_areas" },
                          content = function()
                            ui.heading { level = 3, content = _ "Homepage read new issues" }
                          end
                        }
                      end
                    }

                    ui.container {
                      attr = { class = "span6 spaceline" },
                      content = function()
                        ui.link {
                          attr = { class = "btn btn-primary large_btn" },
                          module = "unit",
                          view = "show_ext",
                          params = { create = true, filter = "my_areas" },
                          content = function()
                            ui.heading { level = 3, content = _ "Homepage write new issue" }
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

btns = {
  default_state = 'any',
  state = {
    {
      "any",
      "open",
      "admission",
      "discussion",
      "verification"
    },
    {
      "voting",
      "committee",
      "closed",
      "canceled"
    }
  },
  default_scope = "all_units",
  scope = {
    {
      "all_units",
      "my_units",
      "citizens"
    },
    {
      "electeds",
      "others"
    }
  }
}


--[[ui.container{attr={class="row-fluid"},content=function()
  ui.container{attr={class="span12 text-center"},content=function()
    execute.chunk{
      module = "issue" ,
      chunk = "_filters_btn2_bs" ,
      params = {
        state = state,
        orderby = orderby,
        desc = desc,
        scope = scope,
        btns = btns,
        ftl_btns = ftl_btns
      }
    }
  end }
end }]]

if not issues_selector_voted or not issues_selector_myinitiatives then
  return true
end

ui.container {
  attr = { class = "row-fluid" },
  content = function()
    ui.container {
      attr = { class = "span6" },
      content = function()
        ui.container {
          attr = { class = "row-fluid" },
          content = function()
            ui.container {
              attr = { class = "span12 text-center" },
              content = function()
                ui.image { static = "parlamento_icon_small.png" }
              end
            }
          end
        }
        ui.container {
          attr = { class = "row-fluid" },
          content = function()
            ui.container {
              attr = { class = "span12 well" },
              content = function()
                ui.container {
                  attr = { class = "row-fluid" },
                  content = function()
                    ui.container {
                      attr = { class = "span12 text-center" },
                      content = function()
                        ui.heading { level = 3, attr = { class = "uppercase" }, content = _ "Your Voting" }
                      end
                    }
                  end
                }
                ui.container {
                  attr = { class = "row-fluid" },
                  content = function()
                    execute.view {
                      module = "issue",
                      view = "_list_ext",
                      params = {
                        state = state,
                        orderby = orderby,
                        desc = desc,
                        scope = scope,
                        interest = interest,
                        list = "voted",
                        ftl_btns = ftl_btns,
                        for_member = member,
                        for_details = false,
                        selector = issues_selector_voted
                      }
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
      attr = { class = "span6" },
      content = function()
        ui.container {
          attr = { class = "row-fluid" },
          content = function()
            ui.container {
              attr = { class = "span12 text-center" },
              content = function()
                ui.image { static = "parlamento_icon_small.png" }
              end
            }
          end
        }
        ui.container {
          attr = { class = "row-fluid" },
          content = function()
            ui.container {
              attr = { class = "span12 well" },
              content = function()
                ui.container {
                  attr = { class = "row-fluid" },
                  content = function()
                    ui.container {
                      attr = { class = "span12 text-center" },
                      content = function()
                        ui.heading { level = 3, attr = { class = "uppercase" }, content = _ "Your Proposals" }
                      end
                    }
                  end
                }
                ui.container {
                  attr = { class = "row-fluid" },
                  content = function()
                    execute.view {
                      module = "issue",
                      view = "_list_ext",
                      params = {
                        state = state,
                        orderby = orderby,
                        desc = desc,
                        scope = scope,
                        interest = interest,
                        list = "proposals",
                        ftl_btns = ftl_btns,
                        for_member = member,
                        for_details = false,
                        selector = issues_selector_myinitiatives
                      }
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
