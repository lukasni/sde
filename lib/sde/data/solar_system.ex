defmodule SDE.SolarSystem do

  def list_ids(), do: Map.keys(systems())
  def all(), do: systems()
  def info(id), do: Map.get(systems(), id)

  def populate() do
    systems =
      File.read!("priv/systems.dump")
      |> :erlang.binary_to_term()

    :persistent_term.put({__MODULE__, :systems}, systems)
  end

  defp systems() do
    :persistent_term.get({__MODULE__, :systems})
  end
end
