defmodule SDE.Names do
  @invNames SDE.BSD.load!("invNames.yaml")

  @id_to_name SDE.BSD.map_value(@invNames, "itemID", "itemName")
  @name_to_id SDE.BSD.map_value(@invNames, "itemName", "itemID")

  def name(id), do: Map.get(@id_to_name, id)
  def id(name), do: Map.get(@name_to_id, name)
end
