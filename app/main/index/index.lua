slot.set_layout("custom")

if not app.session.member_id then
  execute.view { module = "index", view = "_index_public" }
else
  execute.view { module = "index", view = "_index_member" }
end