defmodule SDE.Attribute do
  def list_ids(), do: SDE.Data.get(:attributes) |> Map.keys()
  def all(), do: SDE.Data.get(:attributes)
  def info(attribute_id), do: SDE.Data.get(:attributes) |> Map.get(attribute_id)
end
