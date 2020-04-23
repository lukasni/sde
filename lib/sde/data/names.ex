defmodule SDE.Names do
  def name(id), do: Map.get(SDE.Data.get(:names), id)
  def id(name), do: Map.get(SDE.Data.get(:ids), name)
end
