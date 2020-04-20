defmodule SDE.PlanetSchematic do
  @schematics SDE.BSD.load!("planetSchematics.yaml")
              |> SDE.BSD.to_map("schematicID")

  def list_ids(), do: Map.keys(@schematics)
  def all(), do: @schematics
  def info(schematic_id), do: Map.get(@schematics, schematic_id)

  defmodule Pin do
    @planetSchematicsPinMap SDE.BSD.load!("planetSchematicsPinMap.yaml")

    @pin_to_schematic Enum.group_by(
                        @planetSchematicsPinMap,
                        & &1["pinTypeID"],
                        & &1["schematicID"]
                      )
    @schematic_to_pin Enum.group_by(
                        @planetSchematicsPinMap,
                        & &1["schematicID"],
                        & &1["pinTypeID"]
                      )

    def schematics_for_pin(pin_id), do: Map.get(@pin_to_schematic, pin_id)
    def pins_for_schematic(schematic_id), do: Map.get(@schematic_to_pin, schematic_id)
  end
end
