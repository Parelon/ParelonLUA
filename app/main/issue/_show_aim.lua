local issue = param.get("issue", "table")

ui.container {
  attr = { class = "col-md-12" },
  content = function()
    ui.heading { level = 3, attr = { class = "label label-warning-tbox spaceline" }, content = _ "Aim description" }
  end
}
ui.container {
  attr = { class = "col-md-12 well-inside paper initiative_list_box" },
  content = function()
    ui.tag { content = issue.aim_description or _ "No description available" }
  end
}