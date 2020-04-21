defmodule SDE.Universe do
  @universe "priv/sde/fsd/universe"
  def region_paths() do
    @universe <> "/**/region.staticdata"
    |> Path.wildcard()
  end

  def constellation_paths(regions) do
    regions
    |> Stream.map(fn f -> {f, Path.dirname(f)} end)
    |> Stream.map(fn {region, dir} -> {region, dir <> "/*/constellation.staticdata"} end)
    |> Task.async_stream(fn {region, glob} ->
      constellations = Path.wildcard(glob)
      region = YamlElixir.read_from_file!(region)
      {region["regionID"], Map.put(region, "constellations", constellations)}
    end)
    |> Enum.map(fn {:ok, x} -> x end)
  end

  def system_paths(constellations) do
    for {region_id, region} <- constellations do
      systems =
        region["constellations"]
        |> Stream.map(fn f -> {f, Path.dirname(f)} end)
        |> Stream.map(fn {const, dir} -> {const, dir <> "/*/solarsystem.staticdata"} end)
        |> Task.async_stream(fn {const, glob} ->
          systems = Path.wildcard(glob) |> load_files()
          constellation = YamlElixir.read_from_file!(const)
          {constellation["constellationID"], Map.put(constellation, "systems", systems)}
        end)
        |> Enum.map(fn {:ok, x} -> x end)
        |> Map.new()
      {region_id, Map.put(region, "constellations", systems)}
    end
    |> Map.new()
  end

  def load_files(paths) do
    paths
    |> Task.async_stream(&YamlElixir.read_from_file!/1)
    |> Enum.map(fn {:ok, res} -> res end)
  end
end
