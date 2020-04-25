defmodule SDE.Config.YamlFile do
  defstruct [:path, map_key: nil, single_value: true, mapper: &SDE.Converter.Recase.recase_map/1]
end
