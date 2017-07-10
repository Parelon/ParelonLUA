slot.set_layout("custom")

local initiative = Initiative:by_id(param.get_id())
local issue_id = param.get("issue_id", atom.integer) or 0
local area = Area:by_id(param.get("area_id", atom.integer))
local policy_id = param.get("policy_id", atom.integer) or 0
local issue_title = param.get("issue_title", atom.string) or ""
local issue_brief_description = param.get("issue_brief_description", atom.string) or ""
local issue_keywords = param.get("issue_keywords", atom.string)
local problem_description = param.get("problem_description", atom.string) or ""
local aim_description = param.get("aim_description", atom.string) or ""
local initiative_title = param.get("initiative_title", atom.string) or ""
local initiative_brief_description = param.get("initiative_brief_description", atom.string) or ""
local draft = param.get("draft", atom.string) or ""
local technical_areas = param.get("technical_areas", atom.string)
local proposer1 = param.get("proposer1", atom.boolean) or false
local proposer2 = param.get("proposer2", atom.boolean) or false
local proposer3 = param.get("proposer3", atom.boolean) or false
local resource = param.get("resource", atom.string)
local sociallink = param.get("sociallink", atom.strin)
local archivecloud = param.get("archivecloud", atom.string)

-- trace di controllo sui valori dei parametri
trace.debug("issue_id: " .. tostring(issue_id))
trace.debug("area_id: " .. tostring(area_id))
trace.debug("policy_id: " .. tostring(policy_id))
trace.debug("issue_title: " .. issue_title)
trace.debug("issue_brief_description: " .. issue_brief_description)
trace.debug("issue_keywords: " .. (issue_keywords and issue_keywords or "none"))
trace.debug("problem_description: " .. problem_description)
trace.debug("aim_description: " .. aim_description)
trace.debug("initiative_title: " .. initiative_title)
trace.debug("initiative_brief_description: " .. initiative_brief_description)
trace.debug("draft: " .. draft)
trace.debug("technical_areas: " .. (technical_areas and technical_areas or "none"))
trace.debug("proposer1: " .. tostring(proposer1))
trace.debug("proposer2: " .. tostring(proposer2))
trace.debug("proposer3: " .. tostring(proposer3))
trace.debug("resource: " .. (resource and resource or "none"))
trace.debug("sociallink: " .. (sociallink and sociallink or "none"))
trace.debug("archivecloud: " .. (archivecloud and archivecloud or "none"))

ui.title(
  function()
    execute.view {
      module = "wizard",
      view = "_page3_title",
      params = { area = area }
    }
  end
)

ui.form {
  method = "post",
  attr = { id = 'page3' },
  module = 'wizard',
  view = 'page12',
  params = {
    issue_id = issue_id,
    area_id = area.id,
    policy_id = policy_id,
    issue_title = issue_title,
    issue_brief_description = issue_brief_description,
    issue_keywords = issue_keywords,
    problem_description = problem_description,
    aim_description = aim_description,
    initiative_title = initiative_title,
    initiative_brief_description = initiative_brief_description,
    draft = draft,
    technical_areas = technical_areas,
    proposer1 = proposer1,
    proposer2 = proposer2,
    proposer3 = proposer3,
    resource = resource,
    sociallink = sociallink,
    archivecloud = archivecloud
  },         
  content = function()
    execute.view {
      module = "wizard",
      view = "_page3_initiative_title",
      params = { initiative_title = initiative_title }
    }

    execute.view {
      module = "wizard",
      view = "_page3_initiative_abstract",
      params = { initiative_brief_description = initiative_brief_description }
    }

    execute.view {
      module = "wizard",
      view = "_page3_initiative_draft",
      params = { draft = draft }
    }

--    execute.view {
--      module = "wizard",
--      view = "_page3_initiative_media",
--      params = { resource = resource, sociallink = sociallink, archivecloud = archivecloud }
--    }

    execute.view {
      module = "wizard",
      view = "_page3_initiative_keywords",
      params = { technical_areas = technical_areas }
    }
  end
}


--	ROUTING BACK
ui.form {
  method = "post",
  attr = { class = "inline-block", id = "page3_back" },
  module = 'wizard',
  view = 'page2',
  params = {
    issue_id = issue_id,
    area_id = area.id,
    policy_id = policy_id,
    issue_title = issue_title,
    issue_brief_description = issue_brief_description,
    issue_keywords = issue_keywords,
    problem_description = problem_description,
    aim_description = aim_description,
    initiative_title = initiative_title,
    initiative_brief_description = initiative_brief_description,
    draft = draft,
    technical_areas = technical_areas,
    proposer1 = proposer1,
    proposer2 = proposer2,
    proposer3 = proposer3,
    resource = resource,
    sociallink = sociallink,
    archivecloud = archivecloud
  }
}

