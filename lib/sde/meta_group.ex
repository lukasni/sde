defmodule SDE.MetaGroup do
  @meta_group SDE.FSD.load!("metaGroups.yaml")

  def list_ids(), do: Map.keys(@meta_group)
  def all(), do: @meta_group
  def info(id), do: Map.get(@meta_group, id)
end
