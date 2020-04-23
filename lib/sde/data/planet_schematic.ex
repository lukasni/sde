defmodule SDE.PlanetSchematic do
  def list_ids(), do: Map.keys(SDE.Data.get(:planet_schematics))
  def all(), do: SDE.Data.get(:planet_schematics)
  def info(schematic_id), do: Map.get(SDE.Data.get(:planet_schematics), schematic_id)

  defmodule Pin do
    def schematics_for_pin(pin_id) do
      SDE.Data.get(:planet_schematics_for_pin)
      |> Map.get(pin_id)
    end

    def pins_for_schematic(schematic_id) do
      SDE.Data.get(:planet_pins_for_schematic)
      |> Map.get(schematic_id)
    end
  end

  defmodule Type do
    def schematics_for_type(type_id) do
      SDE.Data.get(:planet_schematics_for_type)
      |> Map.get(type_id)
    end

    def types_for_schematic(schematic_id) do
      SDE.Data.get(:planet_types_for_schematic)
      |> Map.get(schematic_id)
    end
  end
end
