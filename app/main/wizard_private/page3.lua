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
local resource = param.get("resource", atom.string)
local sociallink = param.get("sociallink", atom.strin)
local archivecloud = param.get("archivecloud", atom.string)

ui.title(
  function()
    execute.view {
      module = "wizard_private",
      view = "_page3_title",
      params = { area = area }
    }
  end
)

ui.form {
  method = "post",
  attr = { id = 'page3' },
  module = 'wizard_private',
  view = 'page_summary',
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
    sociallink = sociallink,
    archivecloud = archivecloud
  },         
  content = function()
    ui.container {
      attr = {
        class = "panel-group well",
        id = "accordion",
        role = "tablist",
        ariamultiselectable = "true"
      },
      content = function()

        execute.view {
          module = "wizard_private",
          view = "_page3_initiative_title",
          params = { initiative_title = initiative_title}
        }

        execute.view {
          module = "wizard_private",
          view = "_page3_initiative_abstract",
          params = { initiative_brief_description = initiative_brief_description }
        }

        execute.view {
          module = "wizard_private",
          view = "_page3_initiative_draft",
          params = { draft = draft }
        }

--    execute.view {
--      module = "wizard_private",
--      view = "_page3_initiative_media",
--      params = { resource = param.get("resource", atom.string), sociallink = param.get("sociallink", atom.string), archivecloud = param.get("archivecloud", atom.string) }
--    }

        execute.view {
          module = "wizard_private",
          view = "_page3_initiative_keywords",
          params = { technical_areas = technical_areas }
        }
      end
    }
    ui.script { type = "text/javascript", script = "function collapseAll() { $('#initiative_title').collapse('hide'); $('#initiative_abstract').collapse('hide'); $('#initiative_draft').collapse('hide'); $('#initiative_media').collapse('hide'); $('#initiative_keywords').collapse('hide'); }" }
  end
}


--	ROUTING BACK
ui.form {
  method = "post",
  attr = { class = "inline-block", id = "page3_back" },
  module = 'wizard_private',
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
    resource = resource,
    sociallink = sociallink,
    archivecloud = archivecloud
  }
}

