slot.set_layout("custom")

if not config.db_dump_dir then
  slot.put_into("error", "feature not enabled")
  execute.view {
    module = "admin",
    view = "index"
  }
else
  local file_list = extos.listdir(config.db_dump_dir)
  if file_list then      
    local tmp = {}
    for i, filename in ipairs(file_list) do
      if not filename:find("^%.") then
        tmp[#tmp + 1] = filename
      end
    end

    local file_list = tmp

    table.sort(file_list, function(a, b) return a > b end)

    ui.title(function()
        ui.container {
          attr = { class = "row text-left" },
          content = function()
            ui.container {
              attr = { class = "col-md-3" },
              content = function()
                ui.link {
                  attr = { class = "btn btn-primary btn-large large_btn fixclick btn-back" },
                  module = "admin",
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
                  content = _ "Download database dumps"
                }
              end
            }
          end
        }
      end)

    ui.list {
      records = file_list,
      columns = {
        {
          content = function(filename)
            slot.put(encode.html(filename))
          end
        },
        {
          content = function(filename)
            ui.link {
              content = _ "Download",
              module = "admin",
              view = "download_file",
              params = { filename = filename }
            }
          end
        }
      }
    }
  else
    slot.put_into("error", _ "There are not database dumps available.")
    execute.view {
      module = "admin",
      view = "index"
    }
  end
end
