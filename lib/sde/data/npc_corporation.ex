defmodule SDE.NPCCorporation do
  @npc_corporations SDE.BSD.load!("crpNPCCorporations.yaml") |> SDE.BSD.to_map("corporationID")

  def list_ids(), do: Map.keys(@npc_corporations)
  def all(), do: @npc_corporations
  def info(id), do: Map.get(@npc_corporations, id)

  defmodule Division do
    @corp_divisions SDE.BSD.load!("crpNPCCorporationDivisions.yaml")
                    |> SDE.BSD.to_map("corporationID", single_result: false)

    def list(corporation_id), do: Map.get(@corp_divisions, corporation_id)
  end

  defmodule ResearchField do
    @corp_research_fields SDE.BSD.load!("crpNPCCorporationResearchFields.yaml")
                          |> Enum.group_by(& &1["corporationID"], & &1["skillID"])

    def list(corporation_id), do: Map.get(@corp_research_fields, corporation_id)
  end

  defmodule Trades do
    @corp_trades SDE.BSD.load!("crpNPCCorporationTrades.yaml")
                 |> Enum.group_by(& &1["corporationID"], & &1["typeID"])

    def list(corporation_id), do: Map.get(@corp_trades, corporation_id)
  end
end
