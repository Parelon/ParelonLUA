Resource = mondelefant.new_class()
Resource.table = 'resource'
Resource.primary_key = { "id" }

Resource:add_reference {
  mode = 'm1',
  to = "Initiative",
  this_key = 'initiative_id',
  that_key = 'id',
  ref = 'initiative',
}

function Resource:by_initiative_id(initiative_id)
  return self:new_selector():add_where { "initiative_id = ? AND type NOT LIKE 'video'", initiative_id }:exec()
end

function Resource:get_video_by_initiative_id(initiative_id)
  return self:new_selector():add_where { "initiative_id = ? AND type LIKE 'video'", initiative_id }:optional_object_mode():exec()
end

function Resource:by_initiative_id_and_type(initiative_id, resource_type)
  return self:new_selector():add_where { "initiative_id = ? AND type = ?", initiative_id, resource_type }:exec()
end

function Resource:count(initiative_id)
  return self:new_selector():add_where{ "initiative_id = ? AND type NOT LIKE 'video'", initiative_id }:count()
end

function Resource:count_by_type(initiative_id, resource_type)
  return self:new_selector():add_where{ "initiative_id = ? AND type = ? AND type NOT LIKE 'video'", initiative_id, resource_type }:count()
end
