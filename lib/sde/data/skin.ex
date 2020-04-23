defmodule SDE.Skin do
  def list_ids(), do: Map.keys(SDE.Data.get(:skins))
  def all(), do: SDE.Data.get(:skins)
  def info(skin_id), do: Map.get(SDE.Data.get(:skins), skin_id)

  defmodule Material do
    def list_ids(), do: Map.keys(SDE.Data.get(:skin_materials))
    def all(), do: SDE.Data.get(:skin_materials)
    def info(material_id), do: Map.get(SDE.Data.get(:skin_materials), material_id)
  end

  defmodule License do
    def list_ids(), do: Map.keys(SDE.Data.get(:skin_licenses))
    def all(), do: SDE.Data.get(:skin_licenses)
    def info(license_id), do: Map.get(SDE.Data.get(:skin_licenses), license_id)
  end
end
