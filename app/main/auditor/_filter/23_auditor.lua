local module = request.get_module()
local view = request.get_view()
local action = request.get_action()

if not app.session.member.auditor and not app.session.member.admin then
  error('access denied')
else
  execute.inner()
end
