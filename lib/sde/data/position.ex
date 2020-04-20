defmodule SDE.Position do
  @positions SDE.BSD.load!("invPositions.yaml") |> SDE.BSD.to_map("itemID")

  def info(item_id), do: Map.get(@positions, item_id)
end
