local initiative = Initiative:by_id(param.get("initiative_id"))
local video_url = param.get("link", atom.string)

local initiator = Initiator:by_pk(initiative.id, app.session.member_id)
if initiator and initiator.accepted and not initiative.issue.half_frozen and not initiative.issue.closed and not initiative.revoked then
  if video_url == "" then
    local video = Resource:get_video_by_initiative_id(initiative.id)
    if video ~= nil then
      video:destroy()
    end
  elseif string.find(video_url, "https://www.youtube.com/watch") then
    local resource = Resource:get_video_by_initiative_id(initiative.id)
    if resource == nil then
      resource = Resource:new()
      resource.initiative_id = initiative.id
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
