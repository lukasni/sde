defmodule SDE.Dogma do
  @bsd "priv/sde/bsd/"

  @dgmAttributeCategories YamlElixir.read_from_file!(@bsd <> "dgmAttributeCategories.yaml")
  @dgmAttributeTypes YamlElixir.read_from_file!(@bsd <> "dgmAttributeTypes.yaml")
  @dgmEffects YamlElixir.read_from_file!(@bsd <> "dgmEffects.yaml")
  @dgmTypeAttributes YamlElixir.read_from_file!(@bsd <> "dgmTypeAttributes.yaml")
  @dgmTypeEffects YamlElixir.read_from_file!(@bsd <> "dgmTypeEffects.yaml")

  @attribute_categories @dgmAttributeCategories |> Enum.map(fn %{"categoryID" => id} = data -> {id, data} end) |> Map.new()
  @attributes @dgmAttributeTypes |> Enum.map(fn %{"attributeID" => id} = data -> {id, data} end) |> Map.new()
  @effects @dgmEffects |> Enum.map(fn %{"effectID" => id} = data -> {id, data} end) |> Map.new()
  @type_attributes @dgmTypeAttributes |> Enum.group_by(&Map.get(&1, "typeID"))
  @type_effects @dgmTypeEffects |> Enum.group_by(&Map.get(&1, "typeID"))

  def list_attribute_categories(), do: Map.keys(@attribute_categories)
  def list_attributes(), do: Map.keys(@attributes)
  def list_effects(), do: Map.keys(@effects)

  def attribute_categories(id), do: Map.get(@attribute_categories, id)
  def attributes(id), do: Map.get(@attributes, id)
  def effects(id), do: Map.get(@effects, id)

  def type_attributes(type_id), do: Map.get(@type_attributes, type_id)
  def type_effects(type_id), do: Map.get(@type_effects, type_id)
end
