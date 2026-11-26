local function noop(...)
    return nil
end

local names = {
    "white_seqovl",
    "seqovl",
    "multishake",
    "zapret_multishake",
    "fakemultisplit",
    "fake_multisplit",
    "fakemultidisorder",
    "fake_multidisorder",
    "multisplit",
    "multidisorder",
    "fakedsplit",
    "fakeddisorder",
    "syndata",
    "send",
    "rawsend",
    "drop",
    "pktmod",
    "ipcache_hostname",
    "ipcache_pos",
    "reconn",
    "nolog",
    "tcpseg",
    "udpsplit",
    "faketcp",
    "fakeip",
    "hostlist_pos",
    "ipset_pos"
}

for _, name in ipairs(names) do
    if _G[name] == nil then
        _G[name] = noop
    end
end

return setmetatable({}, {
    __index = function(t, k)
        local fn = _G[k] or noop
        rawset(t, k, fn)
        return fn
    end
})
