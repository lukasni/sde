defmodule SDE.Converter do
  def yaml_to_etf(config_list) do
    config_list
    |> Task.async_stream(&task/1, timeout: 120_000)
    |> Enum.to_list()
  end

  def task({name, config}) do
    IO.puts("Compiling #{name}")
    config
    |> load_file()
    |> transform_data(config)
    |> dump_file(name)
  end

  def load_file(%{path: path}) do
    YamlElixir.read_from_file!(path)
  end

  def transform_data(data, %{map_key: nil}) when is_map(data) do
    Enum.reduce(data, %{}, fn {id, map}, acc ->
      Map.put(acc, id, SDE.Converter.Recase.recase_map(map))
    end)
  end

  def transform_data(data, %{map_key: nil}) do
    data
  end

  def transform_data(data, %{map_key: key, single_value: false, mapper: vf}) do
    Enum.group_by(data, & &1[key], vf)
  end

  def transform_data(data, %{map_key: key, single_value: true, mapper: vf}) do
    data
    |> Enum.reduce(%{}, fn d, acc ->
      Map.put(acc, d[key], vf.(d))
    end)
  end

  def dump_file(data, dump) do
    IO.puts("Storing #{dump} dump...")
    content = :erlang.term_to_binary(data)
    path = SDE.Config.dump_path(dump)

    File.mkdir_p!(SDE.Config.dumps())

    File.write!(path, content)
  end
end
