defmodule SDE.Names do
  @path "priv/sde/bsd/invNames.yaml"

  @invNames YamlElixir.read_from_file!(@path)

  @id_to_name Enum.map(@invNames, fn %{"itemID" => id, "itemName" => name} -> {id, name} end) |> Map.new()
  @name_to_id Enum.map(@invNames, fn %{"itemID" => id, "itemName" => name} -> {name, id} end) |> Map.new()

  def name(id), do: Map.get(@id_to_name, id)
  def id(name), do: Map.get(@name_to_id, name)
end
