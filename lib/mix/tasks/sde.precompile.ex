defmodule Mix.Tasks.Sde.Precompile do
  @shortdoc "Converts SDE YAML files to ETF dumps"

  use Mix.Task

  def run(_args) do
    IO.puts("Converting YAML files to ETF dumps. This could take a while...")
    SDE.precompile()
  end
end
