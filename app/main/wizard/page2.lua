slot.set_layout("custom")

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
local resource = param.get("resource", atom.string)
local sociallink = param.get("sociallink", atom.string)
local archivecloud = param.get("archivecloud", atom.string)

-- trace di controllo sui valori dei parametri
trace.debug("issue_id: " .. tostring(issue_id))
trace.debug("area_id: " .. tostring(area.id))
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
trace.debug("resource: " .. (resource and resource or "none"))
trace.debug("sociallink: " .. (sociallink and sociallink or "none"))
trace.debug("archivecloud: " .. (archivecloud and sociallink or "none"))

ui.title(
  function()
    execute.view {
      module = "wizard",
      view = "_page2_title",
      params = { area = area }
    }
  end
)

ui.form {
  method = "post",
  attr = { id = "page2" },
  module = 'wizard',
  view = 'page3',
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
    resource = resource,
    archivecloud = archivecloud,
    sociallink = sociallink
  },
  content = function()
        ui.container {
          attr = {
            class = "well-blue panel-group",
            id = "accordion",
            role = "tablist",
            ariamultiselectable = "true"
            },
          content = function()
            execute.view {
              module = "wizard",
              view = "_page2_issue_title",
              params = { issue_title = issue_title }
            }

            execute.view {
              module = "wizard",
              view = "_page2_issue_abstract",
              params = { issue_brief_description = issue_brief_description }
            }

            execute.view {
              module = "wizard",
              view = "_page2_issue_description",
              params = { problem_description = problem_description }
            }

            execute.view {
              module = "wizard",
              view = "_page2_issue_aim",
              params = { aim_description = aim_description }
            }

            execute.view {
              module = "wizard",
              view = "_page2_issue_keywords",
              params = { issue_keywords = issue_keywords }
            }
          end
        }
    ui.script { type = "text/javascript", script = "function collapseAll() { $('#issue_title').collapse('hide'); $('#issue_abstract').collapse('hide'); $('#issue_description').collapse('hide'); $('#issue_aim').collapse('hide'); $('#issue_keywords').collapse('hide'); }" }
  end
}


--	ROUTING BACK
ui.form {
  method = "post",
  attr = { id = "page2_back" },
  module = 'wizard',
  view = 'page1',
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
    resource = resource
  }
}
