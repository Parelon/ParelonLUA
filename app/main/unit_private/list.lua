slot.put_into("title", _ "Unit list")

--util.help("unit.list", _ "Unit list")

slot.put("<br />")

execute.view { module = "unit_private", view = "_list" }

slot.put("<br />")

