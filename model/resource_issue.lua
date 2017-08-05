ResourceIssue = mondelefant.new_class()
ResourceIssue.table = 'resource_issue'
ResourceIssue.primary_key = { "id" }

ResourceIssue:add_reference {
    mode = 'm1',
    to = "Issue",
    this_key = 'issue_id',
    that_key = 'id',
    ref = 'issue',
}

function ResourceIssue:by_issue_id(issue_id)
    return self:new_selector():add_where { "issue_id = ?", issue_id }:exec()
end

function ResourceIssue:by_issue_id_and_type(issue_id, resource_type)
    return self:new_selector():add_where { "issue_id = ? AND type = ?", issue_id, resource_type }:exec()
end

function ResourceIssue:count(issue_id)
    return self:new_selector():add_where{ "issue_id = ?", issue_id }:count()
end

function ResourceIssue:count_by_type(issue_id, resource_type)
    return self:new_selector():add_where{ "issue_id = ? AND type = ?", issue_id, resource_type }:count()
end

function ResourceIssue:get_video_by_issue_id(issue_id)
  return self:new_selector():add_where { "issue_id = ? AND type LIKE 'video'", issue_id }:optional_object_mode():exec()
end
