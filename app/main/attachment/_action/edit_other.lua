local caller = param.get("caller", atom.string)
local url_type = param.get("type", atom.string)
local link = param.get("link", atom.string)
local Archive_type = "https://drive.google.com"
--local open_data_type = "https://dati1 dati2 dati3 dati4 "
local play_list_type = "https://www.youtube.com"
local social_type = "https://www.facebook.com"
local id = param.get_id()

if caller == "issue" then
  local issue = Issue:by_id(id)
  if issue.member_id == app.session.member_id and issue.created and not issue.half_frozen and not issue.closed then
    local resources = ResourceIssue:by_issue_id(issue.id)
    for i,resource in ipairs(resources) do
      resource:destroy()
    end
    if link ~= "" then
      for url in link:gmatch("([^\n]*)") do
        if string.find(url, Archive_type) then
          local resource = ResourceIssue:new()
          resource.issue_id = issue.id
          resource.url = url
          resource.type = "archive_url"
          resource:save()
          -- elseif string.find(url, open_data_type) then
          --   local resource = ResourceIssue:new()
          --   resource.issue_id = issue.id
          --   resource.url = url
          --   resource.type = "open_data_url"
          --   resource:save()
        elseif string.find(url, play_list_type) then
          local resource = ResourceIssue:new()
          resource.issue_id = issue.id
          resource.url = url
          resource.type = "playlist_video_url"
          resource:save()
        elseif  string.find(url, social_type) then
          local resource = ResourceIssue:new()
          resource.issue_id = issue.id
          resource.url = url
          resource.type = "social_url"
          resource:save()
        end
      end
    end
    slot.put_into("notice", _"Attachments updated")
    return true
  else
    slot.put_into("error", _"You must be an initiator to update the URL.")
    return false
  end
else
  local initiative = Initiative:by_id(id)
  local initiator = Initiator:by_pk(initiative.id, app.session.member_id)
  if initiator and initiator.accepted and not initiative.half_frozen and not initiative.closed and not initiative.revoked then
    local resources = Resource:by_initiative_id(initiative.id)
    for i,resource in ipairs(resources) do
      resource:destroy()
    end
    if link ~= "" then
      for url in link:gmatch("([^\n]*)") do
        if string.find(url, Archive_type) then
          local resource = Resource:new()
          resource.initiative_id = initiative.id
          resource.url = url
          resource.type = "archive_url"
          resource:save()
          -- elseif string.find(url, open_data_type) then
          --   local resource = Resource:new()
          --   resource.initiative_id = initiative.id
          --   resource.url = url
          --   resource.type = "open_data_url"
          --   resource:save()
        elseif string.find(url, play_list_type) then
          local resource = Resource:new()
          resource.initiative_id = initiative.id
          resource.url = url
          resource.type = "playlist_video_url"
          resource:save()
        elseif  string.find(url, social_type) then
          local resource = Resource:new()
          resource.initiative_id = initiative.id
          resource.url = url
          resource.type = "social_url"
          resource:save()
        end
      end
    end
    slot.put_into("notice", _"Attachments updated")
    return true
  else
    slot.put_into("error", _"You must be an initiator to update the URL.")
    return false
  end
end