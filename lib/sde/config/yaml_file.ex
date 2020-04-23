defmodule SDE.Config.YamlFile do
  defstruct [:path, map_key: nil, single_value: true, mapper: &Function.identity/1]
end
