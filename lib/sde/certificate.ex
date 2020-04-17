defmodule SDE.Certificate do
  @certificates SDE.FSD.load!("certificates.yaml")

  def list_ids(), do: Map.keys(@certificates)
  def all(), do: @certificates
  def info(group_id), do: Map.get(@certificates, group_id)
end
