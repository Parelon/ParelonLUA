local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        ui.heading { level = 3, attr = { class = "label label-warning-tbox spaceline" }, content = _ "Aim description" }
      end
    }
  end
}

ui.container {
  attr = { class = "row well-inside paper" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 spaceline spaceline-bottom initiative_list_box" },
      content = function()
        ui.tag { content = issue.aim_description or _ "No aim given" }
      end
    }
  end
}