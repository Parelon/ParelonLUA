if not app.session.member then
  error('You are not logged in.')
end

execute.inner();