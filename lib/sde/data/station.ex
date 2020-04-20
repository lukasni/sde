defmodule SDE.Station do
  @stations SDE.BSD.load!("staStations.yaml") |> SDE.BSD.to_map("stationID")

  def list_ids(), do: Map.keys(@stations)
  def all(), do: @stations
  def info(station_id), do: Map.get(@stations, station_id)
end
