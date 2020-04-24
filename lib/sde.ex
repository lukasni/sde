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

  def maybe_update(skip_populate \\ false) do
    IO.puts("Checking for SDE update...")
    case SDE.Downloader.update() do
      {:updated, hash} ->
        IO.puts("Updated SDE. Precompiling...")
        precompile()
        unless skip_populate do
          IO.puts("Compiled YAML files. Populating...")
          populate()
        end
        IO.puts("SDE updated")
        {:updated, hash}

      {:current, hash} ->
        IO.puts("No update available.")
        {:current, hash}
    end
  end
end
