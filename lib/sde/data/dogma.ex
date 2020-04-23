defmodule SDE.Dogma do
  def list_attribute_categories(), do: Map.keys(SDE.Data.get(:attribute_categories))
  def list_attributes(), do: Map.keys(SDE.Data.get(:attributes))
  def list_effects(), do: Map.keys(SDE.Data.get(:effects))

  def attribute_categories(id), do: Map.get(SDE.Data.get(:attribute_categories), id)
  def attributes(id), do: Map.get(SDE.Data.get(:attributes), id)
  def effects(id), do: Map.get(SDE.Data.get(:effects), id)

  def type_attributes(type_id),
    do: get_in(SDE.Data.get(:type_dogma), [type_id, "dogmaAttributes"])

  def type_effects(type_id), do: get_in(SDE.Data.get(:type_dogma), [type_id, "dogmaEffects"])
  def type_dogma(type_id), do: Map.get(SDE.Data.get(:type_dogma), type_id)
end
