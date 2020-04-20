defmodule SDE.Reaction do
  @reactions SDE.BSD.load!("invTypeReactions.yaml")
             |> SDE.BSD.to_map("reactionTypeID", delete_index: true)

  def list_ids(), do: Map.keys(@reactions)
  def all(), do: @reactions
  def info(reaction_id), do: Map.get(@reactions, reaction_id)
end
