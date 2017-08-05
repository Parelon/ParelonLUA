local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row" },
  content = function()                              
    ui.container {
      attr = { class = "col-md-10 col-xs-12 col-sm-12" },
      content = function()
        ui.heading { level = 1, attr = { class = "label label-warning-tbox spaceline"}, content = _ "Proposed solutions" }
      end
    }
  end
}
ui.container {
  attr = { class = "well" },
  content = function()
    ui.container {
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-12 text-center" },
          content = function()
            if #issue.initiatives > 1 then
              ui.tag {
                tag = "p",
                content = _("#{count} solutions have been proposed to solve this problem.", {count = #issue.initiatives})
              }
              ui.tag {
                tag = "p",
                content = _"Read the solutions, support the ones you like or propose a better solution."
              }
            else
              ui.tag {
                tag = "p",
                content = _("1 solution has been proposed to solve this problem.", {count = #issue.initiatives})
              }
              ui.tag {
                tag = "p",
                content = _"Read the solution, support it or propose a better solution."
              }
            end
--        if issue.state == 'admission' then
--          ui.tag {
--            tag = "p",
--            content = _("Almeno una proposta tra quelle presentate deve raggiungere il quorum di sostenitori entro #{days} affinche' la questione venga ammessa alla fase successiva.", {days = format.interval_text(issue.state_time_left)})          
--          }
--        end
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
      attr = { class = "row" },
      content = function()
        ui.container {
          attr = { class = "col-md-1 h3 spaceline spaceline-bottom" },
          content = _"Order by"
        }

        local btna, btnb = "", ""
        if init_ord == "supporters" then
          btna = "active"
        end
        if init_ord == "event" then
          btnb = "active"
        end

        ui.container {
          attr = { class = "col-md-3 col-xs-12 col-sm-3 text-center col-md-offset-1" },
          content = function()
            ui.link {
              attr = { class = "h3 btn btn-primary btn-large fixclick " .. btna },
              module = "issue",
              id = issue.id,
              view = "show",
              params = { state = state, orderby = orderby, desc = desc, interest = interest, scope = scope, view = view, ftl_btns = ftl_btns, init_ord = "supporters" },
              content = _ "By popularity"
            }
          end
        }

        ui.container {
          attr = { class = "col-md-3 col-xs-12 col-sm-3 col-md-offset-2 text-center" },
          content = function()
            ui.link {
              attr = { class = "h3 btn btn-primary btn-large fixclick " .. btnb },
              module = "issue",
              id = issue.id,
              view = "show",
              params = { state = state, orderby = orderby, desc = desc, interest = interest, scope = scope, view = view, ftl_btns = ftl_btns, init_ord = "event" },
              content = _ "By most recent event"
            }
          end
        }
      end
    }

    ui.container {
      attr = { class = "row spaceline" },
      content = function()
        ui.container {
          attr = { class = "well-inside" },
          content = function()
            execute.view {
              module = "initiative",
              view = "_list_summary",
              id = issue.id,
              params = {
                for_details = true,
                init_ord = init_ord
              }
            }
          end
        }
      end
    }

    ui.container {
      attr = { class = "row spaceline" },
      content = function()
        if app.session.member then
          ui.link {
            attr = { class = "col-md-3 btn btn-primary  fixclick text-center" },
            module = "wizard",
            params = {
              issue_id = issue.id,
              area_id = issue.area.id,
              area_name = issue.area.name,
              unit_id = issue.area.unit.id,
              unit_name = issue.area.unit.name,
              policy_id = issue.policy_id,
              issue_title = issue.title,
              issue_brief_description = issue.brief_description,
              issue_keywords = issue_keywords,
              problem_description = issue.problem_description,
              aim_description = issue.aim_description
            },
            view = "page3",
            content = function()
              ui.container {
                attr = { class = "row", style = "display: flex" },
                content = function()
                  ui.container {
                    attr = { class = "col-md-2 col-xs-2 col-sm-2" },
                    content = function()
                      ui.image { attr = { class = "pen_paper icon-large" }, static = "svg/pen_paper.svg" }
                    end
                  }
                  slot.put("&nbsp;")
                  ui.heading { level = 4, attr = { class = "col-md-10 col-xs-10 col-sm-10 text-center" }, content = _ "Propose a solution" }
                end
              }
            end
          }
        end

        if #issue.initiatives > 1 then
          ui.link {
            attr = { class = "col-md-3 btn btn-primary btn-large large_btn fixclick text-center" },
            module = "initiative",
            view = "compare",
            params = { issue_id = issue.id },
            content = function()
              ui.container {
                attr = { class = "row", style = "display: flex" },
                content = function()
                  ui.container {
                    attr = { class = "col-md-2 col-xs-2 col-sm-2" },
                    content = function()
                      ui.image { attr = { class = "pen_paper icon-medium" }, static = "png/diff.png" }
                    end
                  }
                  slot.put("&nbsp;")
                  ui.heading { level = 4, attr = { class = "col-md-10 col-xs-10 col-sm-10 text-center" }, content = _ "Compare initiatives" }
                end
              }
            end
          }
        end
      end
    }
  end
}