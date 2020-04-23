defmodule SDE.Landmarks do
  def list_ids(), do: SDE.Data.get(:landmarks) |> Map.keys()
  def all(), do: SDE.Data.get(:landmarks)
  def info(landmark_id), do: SDE.Data.get(:landmarks) |> Map.get(landmark_id)
end
