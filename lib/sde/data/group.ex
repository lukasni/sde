defmodule SDE.Group do
  def list_ids(), do: Map.keys(SDE.Data.get(:groups))
  def all(), do: SDE.Data.get(:groups)
  def info(group_id), do: Map.get(SDE.Data.get(:groups), group_id)
end
