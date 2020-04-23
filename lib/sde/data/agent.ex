defmodule SDE.Agent do
  def list_ids(), do: Map.keys(SDE.Data.get(:agents))
  def all(), do: SDE.Data.get(:agents)
  def info(agent_id), do: Map.get(SDE.Data.get(:agents), agent_id)
  def type(type_id), do: Map.get(SDE.Data.get(:agent_types), type_id)
  def research(agent_id), do: Map.get(SDE.Data.get(:research_agents), agent_id)
  def in_space(agent_id), do: Map.get(SDE.Data.get(:agents_in_space), agent_id)
end
