if not app.session.member then
    slot.put_into("error", "You must be logged in before you can vote.")
    request.redirect {
        module = "index",
        view = "login"
    }
end