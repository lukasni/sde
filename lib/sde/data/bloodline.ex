defmodule SDE.Bloodline do
  def list_ids(), do: SDE.Data.get(:bloodlines) |> Map.keys()
  def all(), do: SDE.Data.get(:bloodlines)
  def info(bloodline_id), do: SDE.Data.get(:bloodlines) |> Map.get(bloodline_id)
end
