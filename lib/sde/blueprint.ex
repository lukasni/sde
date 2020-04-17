defmodule SDE.Blueprint do
  @blueprints SDE.FSD.load!("blueprints.yaml")

  def list_ids(), do: Map.keys(@blueprints)
  def all(), do: @blueprints
  def info(blueprint_id), do: Map.get(@blueprints, blueprint_id)
end
