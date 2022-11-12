local function FungalShift(data, events)
  local player_entity_id = GetPlayerEntity()
  if player_entity_id == nil then
    return false
  end

  GlobalsSetValue("fungal_shift_last_frame", "-1000000")
  local fungi = CellFactory_GetType("fungi")
  EntityIngestMaterial(player_entity_id, fungi, 600)
  local stomach = EntityGetFirstComponent(player_entity_id, "IngestionComponent")
  if stomach ~= nil then
    ComponentSetValue(stomach, "ingestion_size", "0")
  end
  return true
end

return FungalShift
