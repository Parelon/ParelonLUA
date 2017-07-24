local id = param.get_id()
if id then
  local issue = Issue:by_id(id)
  if not issue.area.unit.public then
    request.redirect {
      module = "issue_private",
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