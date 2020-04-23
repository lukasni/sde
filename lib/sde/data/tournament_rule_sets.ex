defmodule SDE.TournamentRuleSets do
  def list_ids(), do: Map.keys(SDE.Data.get(:tournament_rule_sets))
  def all(), do: SDE.Data.get(:tournament_rule_sets)
  def info(id), do: Map.get(SDE.Data.get(:tournament_rule_sets), id)
end
