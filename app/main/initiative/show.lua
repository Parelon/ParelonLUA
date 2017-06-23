local initiative = Initiative:by_id(param.get_id())
local issue = Issue:by_id(initiative.issue_id)
local area = Area:by_id(issue.area_id)
local unit = Unit:by_id(area.unit_id)

execute.view {
    module = "initiative",
    view = "_show",
    params = { initiative = initiative }
}
