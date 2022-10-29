local nxml = dofile_once("mods/akanechan_voice/files/scripts/lib/luanxml/nxml.lua")
--[[
  {
    base="base_path",
    extend="extend_path"
  }
--]]
function extend_xml(xml_table)
  for _, content_filename in ipairs(xml_table) do
    local content = ModTextFileGetContent(content_filename["base"])
    local xml = nxml.parse(content)
    xml:add_child(nxml.parse([[<Base file="]] .. content_filename["extend"] .. [[" />]]))
    ModTextFileSetContent(content_filename["base"], tostring(xml))
  end
end
