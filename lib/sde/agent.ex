defmodule SDE.Agent do
  @agent_info SDE.BSD.load!("agtAgents.yaml") |> SDE.BSD.to_map("agentID")
  @agent_types SDE.BSD.load!("agtAgentTypes.yaml")
               |> SDE.BSD.map_value("agentTypeID", "agentType")
  @research_agents SDE.BSD.load!("agtResearchAgents.yaml")
                   |> SDE.BSD.map_value("agentID", "typeID")
  @agents_in_space SDE.FSD.load!("agentsInSpace.yaml")

  def info(agent_id), do: Map.get(@agent_info, agent_id)
  def type(type_id), do: Map.get(@agent_types, type_id)
  def research(agent_id), do: Map.get(@research_agents, agent_id)
  def in_space(agent_id), do: Map.get(@agents_in_space, agent_id)
end
