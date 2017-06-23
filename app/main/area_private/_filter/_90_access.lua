if not app.session.member then
  error('You are not logged in.')
else
  execute.inner()