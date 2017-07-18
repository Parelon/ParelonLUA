local id = param.get("area_id", atom.integer)
if id then
  local area = Area:by_id(id)
  if not unit.public then
    request.redirect {
      module = "wizard_private",
      view = request.get_view(),
      params = request.get_param_strings()
    }
  else
    execute.inner()
  end
else
  execute.inner()
end