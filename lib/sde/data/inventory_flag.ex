defmodule SDE.InventoryFlag do
  @flags SDE.BSD.load!("invFlags.yaml") |> SDE.BSD.to_map("flagID")

  def list_ids(), do: Map.keys(@flags)
  def all(), do: @flags
  def info(id), do: Map.get(@flags, id)
end
