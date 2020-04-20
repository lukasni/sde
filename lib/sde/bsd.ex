defmodule SDE.BSD do
  @bsd "priv/sde/bsd/"

  def load!(filename) do
    YamlElixir.read_from_file!(@bsd <> filename)
  end

  def to_map(data, index, opts \\ []) do
    value_fun =
      case Keyword.get(opts, :delete_index) do
        true -> fn x -> Map.delete(x, index) end
        _ -> fn x -> x end
      end

    if Keyword.get(opts, :single_result, true) do
      data
      |> Enum.map(&{&1[index], value_fun.(&1)})
      |> Map.new()
    else
      Enum.group_by(data, fn elem -> elem[index] end, value_fun)
    end
  end

  def map_value(data, key_index, value_index) do
    data
    |> Enum.map(&{&1[key_index], &1[value_index]})
    |> Map.new()
  end
end
