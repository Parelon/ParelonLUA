local initiative = param.get("initiative", "table")

ui.container {
  attr = { class = "row spaceline" },
  content = function()
    ui.container {
      attr = { class = "col-md-12" },
      content = function()
        if not show_as_head then
          execute.view {
            module = "suggestion",
            view = "_list",
            params = {
              initiative = initiative,
              suggestions_selector = initiative:get_reference_selector("suggestions"),
              tab_id = param.get("tab_id")
            }
          }
        end
      end
    }
  end
}