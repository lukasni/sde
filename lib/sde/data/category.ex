defmodule SDE.Category do
  def list_ids(), do: Map.keys(SDE.Data.get(:categories))
  def all(), do: SDE.Data.get(:categories)
  def info(id), do: Map.get(SDE.Data.get(:categories), id)
end
