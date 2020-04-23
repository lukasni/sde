defmodule SDE.Graphic do
  def list_ids(), do: Map.keys(SDE.Data.get(:graphics))
  def all(), do: SDE.Data.get(:graphics)
  def info(graphic_id), do: Map.get(SDE.Data.get(:graphics), graphic_id)
end
