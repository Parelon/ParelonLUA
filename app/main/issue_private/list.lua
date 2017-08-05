slot.set_layout("custom")

local issues_selector = Issue:new_selector()

ui.title(
  function()
    execute.view {
      module = "issue_private",
      view = "_list_title"
    }
  end
)

execute.view {
  module = "issue_private",
  view = "_list",
  params = { issues_selector = issues_selector }
}

