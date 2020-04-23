defmodule SDE.InventoryFlag do
  def list_ids(), do: Map.keys(SDE.Data.get(:flags))
  def all(), do: SDE.Data.get(:flags)
  def info(id), do: Map.get(SDE.Data.get(:flags), id)
end
