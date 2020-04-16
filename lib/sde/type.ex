defmodule SDE.Type do
  @path "priv/sde/fsd/typeIDs.yaml"

  @types YamlElixir.read_from_file!(@path)

  def list(), do: Map.keys(@types)
  
  def info(type_id), do: Map.get(@types, type_id)
end
