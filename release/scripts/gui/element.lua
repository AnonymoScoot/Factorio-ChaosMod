local Element = {}
Element.__index = Element

Element.gui_elements = setmetatable({}, {
    __mode = "v"
})

script.register_metatable("Element", Element)

function Element.new(config)
    local instance = setmetatable({

    }, Element)

    table.insert(Element.gui_elements, instance)

    return instance

end

return Element