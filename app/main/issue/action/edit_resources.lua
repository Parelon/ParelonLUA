local issue = Issue:by_id(param.get("issue_id"))
local url = param.get("link", atom.string)


if issue.member_id == app.session.member_id and issue.accepted and not issue.half_frozen and not issue.closed then
    if url == "" or string.find(url, "https://") then
        local resource = Resource_issue:all_resources_by_type(issue.id, "archive_url")
        resource.url = url
        resource:save()
        slot.put_into("notice", _"Archive url changed")
        return true
    else
        slot.put_into("error", _"Wrong archive URL: only URL in the format \"https:\/\/...\" are acceptable.")
        return false
    end
else
    slot.put_into("error", _"You must be an initiator to update the URL.")
    return false
end
