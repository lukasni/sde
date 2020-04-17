defmodule SDE.FSD do
  @fsd "priv/sde/fsd/"

  def load!(file) do
    YamlElixir.read_from_file!(@fsd <> file)
  end
end
