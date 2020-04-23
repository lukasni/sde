defmodule SDE.NPCDivision do
  def list_ids(), do: Map.keys(SDE.Data.get(:divisions))
  def all(), do: SDE.Data.get(:divisions)
  def info(id), do: Map.get(SDE.Data.get(:divisions), id)
end
