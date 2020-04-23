defmodule SDE.Loader do
  def load_dump(key) do
    key
    |> SDE.Config.dump_path()
    |> File.read!()
    |> :erlang.binary_to_term()
  end

  defdelegate load(config), to: SDE.Loader.SnowflakeLoader
end
