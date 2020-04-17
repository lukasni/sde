defmodule SDE.Graphic do
  @graphics SDE.FSD.load!("graphicIDs.yaml")

  def list_ids(), do: Map.keys(@graphics)
  def all(), do: @graphics
  def info(graphic_id), do: Map.get(@graphics, graphic_id)
end
