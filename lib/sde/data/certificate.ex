defmodule SDE.Certificate do
  def list_ids(), do: Map.keys(SDE.Data.get(:certificates))
  def all(), do: SDE.Data.get(:certificates)
  def info(group_id), do: Map.get(SDE.Data.get(:certificates), group_id)
end
