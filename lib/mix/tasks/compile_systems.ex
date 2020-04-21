defmodule Mix.Tasks.CompileSystems do
  use Mix.Task

  @shortdoc "Generates a new systems.dump file from the SDE"
  def run(_) do
    IO.puts("Loading YAML files. This may take serveral minutes...")
    map =
      "priv/sde/fsd/universe/**/solarsystem.staticdata"
      |> Path.wildcard()
      |> Task.async_stream(fn path -> YamlElixir.read_from_file!(path) end)
      |> Enum.map(fn {:ok, thing} -> thing end)
      |> SDE.BSD.to_map("solarSystemID")

    IO.puts("Creating dump file")
    File.write!("priv/systems.dump", :erlang.term_to_binary(map))

    IO.puts("New dump file created in priv/systems.dump")
  end
end
