defmodule SDE.Agent do
  @agtAgents_path "priv/sde/bsd/agtAgents.yaml"
  @agtAgentTypes_path "priv/sde/bsd/agtAgentTypes.yaml"
  @agtResearchAgents_path "priv/sde/bsd/agtResearchAgents.yaml"
  
  @agtAgents YamlElixir.read_from_file!(@agtAgents_path)
  @agtAgentTypes YamlElixir.read_from_file!(@agtAgentTypes_path)
  @agtResearchAgents YamlElixir.read_from_file!(@agtResearchAgents_path)
  
  @agent_info Enum.map(@agtAgents, fn %{"agentID" => id} = data -> {id, data} end) |> Map.new()
  @agent_types Enum.map(@agtAgentTypes, fn %{"agentTypeID" => id, "agentType" => type} -> {id, type} end) |> Map.new()
  @research_agents Enum.map(@agtResearchAgents, fn %{"agentID" => agent_id, "typeID" => type_id} -> {agent_id, type_id} end) |> Map.new()
  
  def info(agent_id), do: Map.get(@agent_info, agent_id)
  def type(type_id), do: Map.get(@agent_types, type_id)
  def research(agent_id), do: Map.get(@research_agents, agent_id)
end