defmodule SDE do
  @moduledoc """
  Documentation for `SDE`.
  """

  def populate() do
    SDE.Config.yaml_files()
    |> Enum.map(&SDE.Loader.load/1)

    :ok = SDE.Loader.load({:regions, nil})
    :ok = SDE.Loader.load({:constellations, nil})
    :ok = SDE.Loader.load({:systems, nil})
  end

  def precompile() do
    SDE.Config.yaml_files()
    |> SDE.Converter.yaml_to_etf()

    SDE.Converter.UniverseConverter.yaml_to_etf()
  end
end
