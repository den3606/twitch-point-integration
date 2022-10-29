local function Hello(data, events)
  GamePrintImportant(data.message .. ' by ' .. data.used_by)
  return true
end

return Hello
