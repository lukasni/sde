defmodule SDE.SolarSystem do
  def list_ids(), do: Map.keys(systems())
  def all(), do: systems()
  def info(id), do: Map.get(systems(), id)

  defp systems() do
    SDE.Data.get(:systems)
  end
end
