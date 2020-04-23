defmodule SDE.Character do
  def list_ancestries(), do: SDE.Data.get(:ancestries) |> Map.keys()
  def list_attributes(), do: SDE.Data.get(:attributes) |> Map.keys()
  def list_bloodlines(), do: SDE.Data.get(:bloodlines) |> Map.keys()
  def list_factions(), do: SDE.Data.get(:factions) |> Map.keys()
  def list_races(), do: SDE.Data.get(:races) |> Map.keys()

  def ancestries(id), do: Map.get(SDE.Data.get(:ancestries), id)
  def attributes(id), do: Map.get(SDE.Data.get(:attributes), id)
  def bloodlines(id), do: Map.get(SDE.Data.get(:bloodlines), id)
  def factions(id), do: Map.get(SDE.Data.get(:factions), id)
  def races(id), do: Map.get(SDE.Data.get(:races), id)
end
