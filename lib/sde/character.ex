defmodule SDE.Character do
  @bsd "priv/sde/bsd/"

  @chrAncestries YamlElixir.read_from_file!(@bsd <> "chrAncestries.yaml")
  @chrAttributes YamlElixir.read_from_file!(@bsd <> "chrAttributes.yaml")
  @chrBloodlines YamlElixir.read_from_file!(@bsd <> "chrBloodlines.yaml")
  @chrFactions YamlElixir.read_from_file!(@bsd <> "chrFactions.yaml")
  @chrRaces YamlElixir.read_from_file!(@bsd <> "chrRaces.yaml")

  @ancestries @chrAncestries |> Enum.map(fn %{"ancestryID" => id} = data -> {id, data} end) |> Map.new()
  @attributes @chrAttributes |> Enum.map(fn %{"attributeID" => id} = data -> {id, data} end) |> Map.new()
  @bloodlines @chrBloodlines |> Enum.map(fn %{"bloodlineID" => id} = data -> {id, data} end) |> Map.new()
  @factions @chrFactions |> Enum.map(fn %{"factionID" => id} = data -> {id, data} end) |> Map.new()
  @races @chrRaces |> Enum.map(fn %{"raceID" => id} = data -> {id, data} end) |> Map.new()

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
