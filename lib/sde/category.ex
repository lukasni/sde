defmodule SDE.Category do
  @path "priv/sde/fsd/categoryIDs.yaml"

  @data YamlElixir.read_from_file!(@path)

  def info(id), do: Map.get(@data, id)
end
