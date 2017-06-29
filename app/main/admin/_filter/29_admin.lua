if not app.session.member.admin then
  slot.put_into('error', 'Access denied: you are not an admin.')
  execute.view{
    module = "index",
    view   = "login",
    params = {
      redirect_module = request.get_module(),
      redirect_view = request.get_view(),
      redirect_id = param.get_id_cgi(),
      redirect_params = param.get_all_cgi()
    }
  }
else
  execute.inner()
end
