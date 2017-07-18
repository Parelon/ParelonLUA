slot.set_layout("custom")

if app.session and app.session.member then
  execute.view { module = "index", view = "_index_member" }
else
  execute.view { module = "index", view = "_index_public" }
end
