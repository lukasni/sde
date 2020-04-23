defmodule SDE.NPCCorporation do
  def list_ids(), do: Map.keys(SDE.Data.get(:corporations))
  def all(), do: SDE.Data.get(:corporations)
  def info(id), do: Map.get(SDE.Data.get(:corporations), id)

  defmodule Division do
    def list(corporation_id) do
      SDE.Data.get(:corporation_divisions)
      |> Map.get(corporation_id)
    end
  end

  defmodule ResearchField do
    def list(corporation_id) do
      SDE.Data.get(:corporation_research_fields)
      |> Map.get(corporation_id)
    end
  end

  defmodule Trades do
    def list(corporation_id) do
      SDE.Data.get(:corporation_trades)
      |> Map.get(corporation_id)
    end
  end
end
