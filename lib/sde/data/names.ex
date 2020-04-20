defmodule SDE.Names do
  @invNames SDE.BSD.load!("invNames.yaml")
  @invUniqueNames SDE.BSD.load!("invUniqueNames.yaml")

  @id_to_name Enum.group_by(@invUniqueNames, & &1["itemID"], & &1["itemName"])
              |> Map.merge(SDE.BSD.map_value(@invNames, "itemID", "itemName"))
  @name_to_id Enum.group_by(@invUniqueNames, & &1["itemName"], & &1["itemID"])
              |> Map.merge(SDE.BSD.map_value(@invNames, "itemName", "itemID"))

  def name(id), do: Map.get(@id_to_name, id)
  def id(name), do: Map.get(@name_to_id, name)
end
