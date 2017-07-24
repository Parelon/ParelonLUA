local issue = param.get("issue", "table")

ui.container {
  attr = { class = "row text-center" },
  content = function()
    ui.tag {
      tag = "strong",
      attr = { class = "label label-warning text-center" },
      content = function()
        ui.heading {
          level = 1,
          content = (issue.title or _ "No title for the issue!")
        }
      end
    }
  end
}