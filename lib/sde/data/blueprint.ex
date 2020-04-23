defmodule SDE.Blueprint do
  def list_ids(), do: Map.keys(SDE.Data.get(:blueprints))
  def all(), do: SDE.Data.get(:blueprints)
  def info(blueprint_id), do: Map.get(SDE.Data.get(:blueprints), blueprint_id)
end
