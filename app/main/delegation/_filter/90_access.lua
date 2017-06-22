if not app.session.member_id then
    error('You must be logged in.')
end

execute.inner()