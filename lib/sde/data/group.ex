defmodule SDE.Group do
  @groups SDE.FSD.load!("groupIDs.yaml")

  def list_ids(), do: Map.keys(@groups)
  def all(), do: @groups
  def info(group_id), do: Map.get(@groups, group_id)
end
