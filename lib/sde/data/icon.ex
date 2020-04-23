defmodule SDE.Icon do
  def list_ids(), do: Map.keys(SDE.Data.get(:icons))
  def all(), do: SDE.Data.get(:icons)
  def info(icon_id), do: Map.get(SDE.Data.get(:icons), icon_id)
end
