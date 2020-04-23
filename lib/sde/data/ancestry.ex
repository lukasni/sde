defmodule SDE.Ancestry do
  def list_ids(), do: SDE.Data.get(:ancestries) |> Map.keys()
  def all(), do: SDE.Data.get(:ancestries)
  def info(ancestry_id), do: SDE.Data.get(:ancestries) |> Map.get(ancestry_id)
end
