function ui.actions(content)
    slot.select("head", function()
        ui.container { attr = { class = "row" }, content = content }
    end)
end
