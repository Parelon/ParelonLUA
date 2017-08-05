ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-3 text-left" },
      content = function()
        ui.link {
          attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back" },
          module = "index",
          view = "index",
          image = { attr = { class = "arrow_medium" }, static = "svg/arrow-left.svg" },
          content = _ "Back"
        }
      end
    }
    ui.heading {
      level = 1,
      attr = { class = "col-md-9 text-center spaceline spaceline-bottom" },
      content = function()
        ui.tag {
          tag = "strong",
          content = _ "Admin menu"
        }
      end
    }
  end
}