defmodule SDE.Data do
  def get(key, default \\ nil) do
    :persistent_term.get({__MODULE__, key}, default)
  end

  def put(key, value) do
    :persistent_term.put({__MODULE__, key}, value)
  end
end
