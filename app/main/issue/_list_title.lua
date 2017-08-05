ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-3" },
      content = function()
        ui.link {
            attr = { class = "btn btn-primary fixclick btn-back h2" },
            module = "index",
            view = "index",
            image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
            content = _ "Back"
          }
      end
    }
    ui.container {
      attr = { class = "col-md-9 text-center spaceline spaceline-bottom" },
      content = function()
        ui.heading {
          level = 1,
          content = _ "List of issues with updates you might want to read "
        }
      end
    }
  end
}