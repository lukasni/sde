defmodule SDE.Item do
  @items SDE.BSD.load!("invItems.yaml") |> SDE.BSD.to_map("itemID")

  def list_ids(), do: Map.keys(@items)
  def all(), do: @items
  def info(item_id), do: Map.get(@items, item_id)
end
