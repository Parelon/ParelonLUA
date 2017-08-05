if app.session.member == nil then
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
