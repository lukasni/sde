defmodule SDE.Reaction do
  def list_ids(), do: Map.keys(SDE.Data.get(:reactions))
  def all(), do: SDE.Data.get(:reactions)
  def info(reaction_id), do: Map.get(SDE.Data.get(:reactions), reaction_id)
end
