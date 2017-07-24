local id = param.get_id()
if id then
  local unit = Unit:by_id(id)
  if not unit.public then
    request.redirect {
      module = "unit_private",
      view = request.get_view(),
      id = id,
      params = request.get_param_strings()
    }
  else
    execute.inner()
  end
else
  execute.inner()
end