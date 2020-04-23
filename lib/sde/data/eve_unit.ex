defmodule SDE.EVEUnit do
  def list_ids(), do: Map.keys(SDE.Data.get(:units))
  def all(), do: SDE.Data.get(:units)
  def info(unit_id), do: Map.get(SDE.Data.get(:units), unit_id)
end
