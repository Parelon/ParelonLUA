slot.set_layout("custom")

local issue_id = param.get("issue_id", atom.integer) or 0
local area = Area:by_id(param.get("area_id", atom.integer))
local policy_id = param.get("policy_id", atom.integer) or 0
local issue_title = param.get("issue_title", atom.string) or ""
local issue_brief_description = param.get("issue_brief_description", atom.string) or ""
local issue_keywords = param.get("issue_keywords", atom.string) or ""
local problem_description = param.get("problem_description", atom.string) or ""
local aim_description = param.get("aim_description", atom.string) or ""
local initiative_title = param.get("initiative_title", atom.string) or ""
local initiative_brief_description = param.get("initiative_brief_description", atom.string) or ""
local draft = param.get("draft", atom.string) or ""
local technical_areas = param.get("technical_areas", atom.string) or ""
local proposer1 = param.get("proposer1", atom.boolean) or false
local proposer2 = param.get("proposer2", atom.boolean) or false
local proposer3 = param.get("proposer3", atom.boolean) or false
local resource = param.get("resource", atom.string)
local sociallink = param.get("sociallink", atom.string)
local archivecloud = param.get("archivecloud", atom.string)

-- trace di controllo sui valori dei parametri
trace.debug("issue_id: " .. tostring(issue_id))
trace.debug("area_id: " .. tostring(area_id))
trace.debug("policy_id: " .. tostring(policy_id))
trace.debug("issue_title: " .. issue_title)
trace.debug("issue_brief_description: " .. issue_brief_description)
trace.debug("issue_keywords: " .. issue_keywords)
trace.debug("problem_description: " .. problem_description)
trace.debug("aim_description: " .. aim_description)
trace.debug("initiative_title: " .. initiative_title)
trace.debug("initiative_brief_description: " .. initiative_brief_description)
trace.debug("draft: " .. draft)
trace.debug("technical_areas: " .. tostring(technical_areas))
trace.debug("proposer1: " .. tostring(proposer1))
trace.debug("proposer2: " .. tostring(proposer2))
trace.debug("proposer3: " .. tostring(proposer3))
trace.debug("resource: " .. (resource and resource or "none"))

ui.title(
  function()
    execute.view {
      module = "wizard",
      view = "_page1_title",
      params = { area = area }
    }
  end
)

ui.form {
  method = "post",
  attr = { id = "page1" },
  module = 'wizard',
  view = 'page2',
  params = {
--    issue_id = issue_id,
    area_id = area.id,
--    policy_id = policy_id,
    issue_title = issue_title,
    issue_brief_description = issue_brief_description,
    issue_keywords = issue_keywords,
    problem_description = problem_description,
    aim_description = aim_description,
    initiative_title = initiative_title,
    initiative_brief_description = initiative_brief_description,
    draft = draft,
    technical_areas = technical_areas,
--    proposer1 = proposer1,
--    proposer2 = proposer2,
--    proposer3 = proposer3,
--    resource = resource,
--    archivecloud = archivecloud,
--    sociallink = sociallink
  },
  content = function()
    execute.view {
      module = "wizard",
      view = "_page1_policy",
      params = { area = area, policy_id = param.get("policy_id", atom.integer) }
    }
  end
}
