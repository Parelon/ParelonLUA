if not app.session.member.admin then
  error('Access denied: you are not an admin.')
end

execute.inner()
