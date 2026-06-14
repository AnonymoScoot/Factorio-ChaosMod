local Entry = {}
Entry.__index = Entry

script.register_metatable("Entry", Entry)

function Entry.new(config)
    local instance = setmetatable({

    }, Entry)
end

return Entry
