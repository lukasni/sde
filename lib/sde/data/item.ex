defmodule SDE.Item do
  def list_ids(), do: Map.keys(SDE.Data.get(:items))
  def all(), do: SDE.Data.get(:items)
  def info(item_id), do: Map.get(SDE.Data.get(:items), item_id)
end
