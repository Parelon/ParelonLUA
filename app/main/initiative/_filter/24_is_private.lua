local id = param.get_id()
if id then
  local initiative = Initiative:by_id(id)
  if not initiative.issue.area.unit.public and not app.session.member then
    slot.put_into('error', _'You need to log in.')
    request.redirect{
      module = "index",
      view   = "login",
      params = {
        redirect_module = request.get_module(),
        redirect_view = request.get_view(),
        redirect_id = param.get_id()
      }
    }
  else
    execute.inner()
  end
else
  execute.inner()
end