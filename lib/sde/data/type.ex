defmodule SDE.Type do
  def list_ids(), do: Map.keys(SDE.Data.get(:types))
  def all(), do: SDE.Data.get(:types)

  def info(type_id), do: Map.get(SDE.Data.get(:types), type_id)
end
