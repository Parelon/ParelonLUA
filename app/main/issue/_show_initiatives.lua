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
      attr = { class = "col-md-12 col-md-offset-0 text-center col-xs-12 col-sm-12 paper" },
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
        ui.container {
          attr = { class = "col-md-12" },
          content = function()
            ui.container {
              attr = { class = "row spaceline spaceline-bottom text-center" },
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
                  view = "show_ext_bs",
                  params = { state = state, orderby = orderby, desc = desc, interest = interest, scope = scope, view = view, ftl_btns = ftl_btns, init_ord = "supporters" },
                  content = function()
                    ui.heading { level = 3, attr = { class = "btn btn-primary btn-large fixclick " }, content = _ "ORDER BY NUMBER OF SUPPORTERS" }
                  end
                }

                ui.link {
                  attr = { class = "col-md-6 col-xs-12 col-sm-6 text-center" .. btnb },
                  module = "issue",
                  id = issue.id,
                  view = "show_ext_bs",
                  params = { state = state, orderby = orderby, desc = desc, interest = interest, scope = scope, view = view, ftl_btns = ftl_btns, init_ord = "event" },
                  content = function()
                    ui.heading { level = 3, attr = { class = "btn btn-primary btn-large fixclick" }, content = _ "ORDER BY LAST EVENT DATE" }
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
          attr = { class = "col-md-12 initiative_list_box" },
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
      attr = { class = "row" },
      content = function()
        ui.link {
          attr = { class = "col-md-2 btn btn-primary btn-create spaceline-bottom fixclick" },
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
          view = "page_bs7",
          content = function()
            ui.container {
              attr = { class = "row" },
              content = function()
                ui.container {
                  attr = { class = "col-md-3 col-xs-2 col-sm-2" },
                  content = function()
                    ui.image { attr = { class = "pen_paper icon-medium" }, static = "svg/pen_paper.svg" }
                  end
                }
                ui.container {
                  attr = { class = "col-md-9 col-xs-10 col-sm-10" },
                  content = function()
                    ui.heading { level = 3, attr = { class = "text-center" }, content = _ "Create your own alternative initiative" }
                  end
                }
              end
            }
          end
        }

        if #issue.initiatives > 1 then
          ui.link {
            attr = { class = "col-md-3 col-md-offset-9 btn btn-primary btn-large large_btn fixclick text-center" },
            module = "initiative",
            view = "compare",
            params = { issue_id = param.get_id() },
            image = { static = "png/diff.png" },
            content = _ "Compare initiatives"
          }
        end
      end
    }
  end
}