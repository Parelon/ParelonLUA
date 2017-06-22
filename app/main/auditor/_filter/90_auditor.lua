if not app.session.member.auditor then
  error('You are not and auditor.')
end

execute.inner()