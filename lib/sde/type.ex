defmodule SDE.Type do
  @types SDE.FSD.load!("typeIDs.yaml")

  def list_ids(), do: Map.keys(@types)
  def all(), do: @types

  def info(type_id), do: Map.get(@types, type_id)
end
