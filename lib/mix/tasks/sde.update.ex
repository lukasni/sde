defmodule Mix.Tasks.Sde.Update do
  @shortdoc "Converts SDE YAML files to ETF dumps"

  use Mix.Task

  def run(_args) do
    SDE.maybe_update(true)
  end
end
