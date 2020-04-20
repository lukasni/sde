defmodule SDE.Skin do
  @skin_licenses SDE.FSD.load!("skinLicenses.yaml")
  @skin_materials SDE.FSD.load!("skinMaterials.yaml")
  @skins SDE.FSD.load!("skins.yaml")

  def skin(skin_id), do: Map.get(@skins, skin_id)
  def material(material_id), do: Map.get(@skin_materials, material_id)
  def licenses(type_id), do: Map.get(@skin_licenses, type_id)
end
