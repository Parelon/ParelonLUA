local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row text-center" },
  content = function()
    ui.tag {
      tag = "strong",
      attr = { class = "col-md-8 col-md-offset-2 label label-warning text-center" },
      content = function()
        ui.heading {
          level = 1,
          content = (issue.title or _ "No title for the issue!")
        }
      end
    }
  end
}