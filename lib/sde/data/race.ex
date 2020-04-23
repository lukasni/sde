defmodule SDE.Race do
  def list_ids(), do: SDE.Data.get(:races) |> Map.keys()
  def all(), do: SDE.Data.get(:races)
  def info(race_id), do: SDE.Data.get(:races) |> Map.get(race_id)
end
