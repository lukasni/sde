defmodule SDE.TournamentRuleSets do
  @rulesets SDE.FSD.load!("tournamentRuleSets.yaml") |> SDE.BSD.to_map("ruleSetID")

  def list_ids(), do: Map.keys(@rulesets)
  def all(), do: @rulesets
  def info(id), do: Map.get(@rulesets, id)
end
