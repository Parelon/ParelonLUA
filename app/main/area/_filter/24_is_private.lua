local id = param.get_id()
if id then
  local area = Area:by_id(id)
  if not area.unit.public then
    request.redirect {
      module = "area_private",
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