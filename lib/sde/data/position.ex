defmodule SDE.Position do
  def info(item_id), do: Map.get(SDE.Data.get(:positions), item_id)
end
