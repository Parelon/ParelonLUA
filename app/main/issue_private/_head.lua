local issue = param.get("issue", "table")

execute.view { module = "area_private", view = "_head", params = { area = issue.area } }
