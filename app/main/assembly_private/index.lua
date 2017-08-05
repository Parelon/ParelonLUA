slot.set_layout("custom")

ui.title(function()
    execute.view {
      module = "assembly_private",
      view = "_title"
    }
  end
)

execute.view {
  module = "assembly",
  view = "_filters"
}

ui.container {
  attr = { class = "row text-center" },
  content = function()
    ui.container {
      attr = { class = "col-lg-6 col-md-12 col-sm-12 col-xs-12 spaceline spaceline-bottom" },
      content = function()
        execute.view {
          module = "assembly_private",
          view = "_summary",
          params = { list = "proposals" }
        }
      end
    }
    ui.container {
      attr = { class = "col-lg-6 col-md-12 col-sm-12 col-xs-12 spaceline spaceline-bottom" },
      content = function()
        execute.view {
          module = "assembly_private",
          view = "_summary",
          params = { list = "voted" }
        }
      end
    }
  end
}
