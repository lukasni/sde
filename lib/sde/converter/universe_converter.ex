defmodule SDE.Converter.UniverseConverter do

  def yaml_to_etf() do
    IO.puts("Finding regions...")
    region_files = load_region_files()
    IO.puts("Finding constellatiions...")
    constellation_files = load_constellation_files(region_files)
    IO.puts("Finding systems")
    system_files = load_system_files(constellation_files)

    IO.puts("Compiling regions...")
    region_files
      |> transform_data("regionID")
      |> SDE.Converter.dump_file(:regions)

    IO.puts("Compiling constellations...")
    constellation_files
      |> transform_data("constellationID")
      |> SDE.Converter.dump_file(:constellations)

    IO.puts("Compiling systems...")
    system_files
      |> transform_data("solarSystemID")
      |> SDE.Converter.dump_file(:systems)
  end

  def load_region_files() do
    Path.wildcard(SDE.Config.fsd() <> "/universe/**/region.staticdata")
    |> load_files()
  end

  def load_constellation_files(regions) do
    regions
    |> Enum.flat_map(&load_constellations/1)
  end

  def load_system_files(constellations) do
    constellations
    |> Enum.flat_map(&load_systems/1)
  end

  defp load_constellations({region_path, %{"regionID" => rid}}) do
    region_path
    |> Path.dirname()
    |> Kernel.<>("/*/constellation.staticdata")
    |> Path.wildcard()
    |> load_files()
    |> Enum.map(fn {path, map} -> {path, Map.put(map, "regionID", rid)} end)
  end

  defp load_systems({constellation_path, %{"constellationID" => cid}}) do
    constellation_path
    |> Path.dirname()
    |> Kernel.<>("/*/solarsystem.staticdata")
    |> Path.wildcard()
    |> load_files()
    |> Enum.map(fn {path, map} -> {path, Map.put(map, "constellationID", cid)} end)
  end

  defp transform_data(files, key) do
    files
    |> Enum.reduce(%{}, fn {_, data}, acc ->
      Map.put(acc, data[key], SDE.Converter.Recase.recase_map(data))
    end)
  end

  def load_files(paths) do
    paths
    |> Task.async_stream(&load_yaml/1, timeout: :timer.minutes(2))
    |> Enum.map(fn {:ok, res} -> res end)
  end

  def load_yaml(path) do
    data = YamlElixir.read_from_file!(path)
    {path, data}
  end
end
