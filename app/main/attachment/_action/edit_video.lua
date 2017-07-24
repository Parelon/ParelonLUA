local id = param.get_id()
local video_url = param.get("link", atom.string)
local caller = param.get("caller", atom.string)

if caller == "initiative" then
  local initiative = Initiative:by_id(id)
  local initiator = Initiator:by_pk(id, app.session.member_id)
  if initiator and initiator.accepted and not initiative.issue.half_frozen and not initiative.issue.closed and not initiative.revoked then
    if video_url == "" then
      local video = Resource:get_video_by_initiative_id(id)
      if video ~= nil then
        video:destroy()
      end
    elseif string.find(video_url, "https://www.youtube.com/watch") then
      local resource = Resource:get_video_by_initiative_id(id)
      if resource == nil then
        resource = Resource:new()
        resource.initiative_id = id
        resource.type = "video"
      end
      resource.url = video_url
      resource:save()
      slot.put_into("notice", _"Video url changed")
      return true
    else
      slot.put_into("error", _"Wrong video url: only video url in the format \"https:\/\/www.youtube.com/v=...\" are acceptable.")
      return false
    end
  else
    slot.put_into("error", _"You must be an initiator to update the video url.")
    return false
  end
else
  local issue = Issue:by_id(id)
  if issue.member == app.session.member and not issue.half_frozen and not issue.closed then
    if video_url == "" then
      local video = ResourceIssue:get_video_by_initiative_id(id)
      if video ~= nil then
        video:destroy()
      end
    elseif string.find(video_url, "https://www.youtube.com/watch") then
      local resource = ResourceIssue:get_video_by_initiative_id(id)
      if resource == nil then
        resource = Resource:new()
        resource.initiative_id = id
        resource.type = "video"
      end
      resource.url = video_url
      resource:save()
      slot.put_into("notice", _"Video url changed")
      return true
    else
      slot.put_into("error", _"Wrong video url: only video url in the format \"https:\/\/www.youtube.com/v=...\" are acceptable.")
      return false
    end
  else
    slot.put_into("error", _"You must be an initiator to update the video url.")
    return false
  end
end
