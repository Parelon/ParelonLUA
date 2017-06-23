if app.session.member == nil or app.session.member.admin == false then
  error('Access denied: you are not an admin.')
  request.redirect{
    module = "index",  -- module name
    view   = "login",    -- view name
    params = {
      redirect_module = request.get_module(),
      redirect_view = request.get_view(),
      redirect_id = param.get_id()
    }
  }
else
  execute.inner()
end
