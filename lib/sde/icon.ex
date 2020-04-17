defmodule SDE.Icon do
  @icons SDE.FSD.load!("iconIDs.yaml")

  def list_ids(), do: Map.keys(@icons)
  def all(), do: @icons
  def info(icon_id), do: Map.get(@icons, icon_id)
end
