defmodule SDE.Character do
  @ancestries SDE.BSD.load!("chrAncestries.yaml") |> SDE.BSD.to_map("ancestryID")
  @attributes SDE.BSD.load!("chrAttributes.yaml") |> SDE.BSD.to_map("attributeID")
  @bloodlines SDE.BSD.load!("chrBloodlines.yaml") |> SDE.BSD.to_map("bloodlineID")
  @factions SDE.BSD.load!("chrFactions.yaml") |> SDE.BSD.to_map("factionID")
  @races SDE.BSD.load!("chrRaces.yaml") |> SDE.BSD.to_map("raceID")

  def list_ancestries(), do: @ancestries |> Map.keys()
  def list_attributes(), do: @attributes |> Map.keys()
  def list_bloodlines(), do: @bloodlines |> Map.keys()
  def list_factions(), do: @factions |> Map.keys()
  def list_races(), do: @races |> Map.keys()

  def ancestries(id), do: Map.get(@ancestries, id)
  def attributes(id), do: Map.get(@attributes, id)
  def bloodlines(id), do: Map.get(@bloodlines, id)
  def factions(id), do: Map.get(@factions, id)
  def races(id), do: Map.get(@races, id)
end
