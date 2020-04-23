defmodule SDE.MetaGroup do
  def list_ids(), do: Map.keys(SDE.Data.get(:meta_group))
  def all(), do: SDE.Data.get(:meta_group)
  def info(id), do: Map.get(SDE.Data.get(:meta_group), id)
end
