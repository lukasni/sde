defmodule SDE.FSD do
  @fsd "priv/sde/fsd/"

  def load!(file) do
    YamlElixir.read_from_file!(@fsd <> file)
  end

  def load_many!(glob) do
    @fsd <> glob
    |> Path.wildcard()
    |> Enum.map(&YamlElixir.read_from_file!/1)
  end
end
