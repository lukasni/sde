defmodule SDE.Converter.Recase do
  def recase_map(map) when is_map(map) do
    for {key, val} <- map, into: %{} do
      val =
        case val do
          val when is_map(val) ->
            recase_map(val)

          [q | _] = val when is_map(q) ->
            Enum.map(val, &recase_map/1)

          val ->
            val
        end

      key =
        case key do
          key when is_binary(key) ->
            String.to_atom(Recase.to_snake(key))

          key ->
            key
        end

      {key, val}
    end
  end
end
