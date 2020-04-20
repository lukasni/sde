defmodule SDE.Dogma do
  @attribute_categories SDE.FSD.load!("dogmaAttributeCategories.yaml")
  @attributes SDE.FSD.load!("dogmaAttributes.yaml")
  @effects SDE.FSD.load!("dogmaEffects.yaml")
  @type_dogma SDE.FSD.load!("typeDogma.yaml")

  def list_attribute_categories(), do: Map.keys(@attribute_categories)
  def list_attributes(), do: Map.keys(@attributes)
  def list_effects(), do: Map.keys(@effects)

  def attribute_categories(id), do: Map.get(@attribute_categories, id)
  def attributes(id), do: Map.get(@attributes, id)
  def effects(id), do: Map.get(@effects, id)

  def type_attributes(type_id), do: get_in(@type_dogma, [type_id, "dogmaAttributes"])
  def type_effects(type_id), do: get_in(@type_dogma, [type_id, "dogmaEffects"])
  def type_dogma(type_id), do: Map.get(@type_dogma, type_id)
end
