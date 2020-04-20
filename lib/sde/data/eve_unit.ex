defmodule SDE.EVEUnit do
  @units SDE.BSD.load!("eveUnits.yaml") |> SDE.BSD.to_map("unitID")

  def list_ids(), do: Map.keys(@units)
  def all(), do: @units
  def info(unit_id), do: Map.get(@units, unit_id)
end
