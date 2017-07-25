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
  attr = { class = "row well" },
  content = function() 
    ui.container {
      attr = { class = "text-center spaceline spaceline-bottom" },
      content = function()
        if #issue.initiatives == 1 then
          content = _ "initiative"
        else
          content = _ "initiatives"
        end

        ui.tag {
          content = function()
            if issue.state == 'admission' then
              slot.put(_("Vi sono attualmente #{count} proposte per risolvere la questione sollevata.<br />Leggi le proposte, decidi a quale dare il tuo sostegno o presenta una proposta alternativa <br /> Almeno una proposta tra quelle presentate deve raggiungere il quorum di sostenitori entro #{days} affinche' la questione venga ammessa alla fase successiva.", { count = #issue.initiatives, days = format.interval_text(issue.state_time_left) }))
            else
              slot.put(_("Vi sono attualmente #{count} proposte per risolvere la questione sollevata.<br />Leggi le proposte, decidi a quale dare il tuo sostegno o presenta una proposta alternativa.", { count = #issue.initiatives }))
            end
          end
        }
      end
    }

    ui.container {
      attr = { class = "row spaceline" },
      content = function()
        local btna, btnb = "", ""
        if init_ord == "supporters" then btna = " active"
        end
        if init_ord == "event" then btnb = " active"
        end

        ui.link {
          attr = { class = "col-md-6 col-xs-12 col-sm-6 text-center" .. btna },
          module = "issue",
          id = issue.id,
          view = "show",
          params = { state = state, orderby = orderby, desc = desc, interest = interest, scope = scope, view = view, ftl_btns = ftl_btns, init_ord = "supporters" },
          content = function()
            ui.heading { level = 3, attr = { class = "btn btn-primary btn-large fixclick " }, content = _ "ORDER BY NUMBER OF SUPPORTERS" }
          end
        }

        ui.link {
          attr = { class = "col-md-6 col-xs-12 col-sm-6 text-center" .. btnb },
          module = "issue",
          id = issue.id,
          view = "show",
          params = { state = state, orderby = orderby, desc = desc, interest = interest, scope = scope, view = view, ftl_btns = ftl_btns, init_ord = "event" },
          content = function()
            ui.heading { level = 3, attr = { class = "btn btn-primary btn-large fixclick" }, content = _ "ORDER BY LAST EVENT DATE" }
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
                  ui.heading { level = 4, attr = { class = "col-md-10 col-xs-10 col-sm-10 text-center" }, content = _ "Propose your solution" }
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