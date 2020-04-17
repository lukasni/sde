defmodule SDE.NPCDivision do
  @divisions SDE.BSD.load!("crpNPCDivisions.yaml") |> SDE.BSD.to_map("divisionID")

  def list_ids(), do: Map.keys(@divisions)
  def all(), do: @divisions
  def info(id), do: Map.get(@divisions, id)
end
