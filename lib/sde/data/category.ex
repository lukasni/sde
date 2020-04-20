defmodule SDE.Category do
  @categories SDE.FSD.load!("categoryIDs.yaml")

  def list_ids(), do: Map.keys(@categories)
  def all(), do: @categories
  def info(id), do: Map.get(@categories, id)
end
