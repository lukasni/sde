defmodule SDE.MetaGroup do
  def list_ids(), do: Map.keys(SDE.Data.get(:meta_groups))
  def all(), do: SDE.Data.get(:meta_groups)
  def info(id), do: Map.get(SDE.Data.get(:meta_groups), id)
end
