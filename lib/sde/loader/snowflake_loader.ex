defmodule SDE.Loader.SnowflakeLoader do
  @moduledoc """
  Loader functions for special snowflakes
  """
  alias SDE.Config.YamlFile

  def load({:names, _config}) do
    dump = SDE.Loader.load_dump(:names)

    name_to_id =
      dump
      |> SDE.Converter.transform_data(%YamlFile{map_key: "itemID", mapper: & &1["itemName"]})

    id_to_name =
      dump
      |> SDE.Converter.transform_data(%YamlFile{map_key: "itemName", mapper: & &1["itemID"]})

    store_merged(:names, name_to_id)
    store_merged(:ids, id_to_name)
  end

  def load({:unique_names, _config}) do
    dump = SDE.Loader.load_dump(:unique_names)

    name_to_id =
      dump
      |> SDE.Converter.transform_data(%YamlFile{map_key: "itemID", mapper: & &1["itemName"]})

    id_to_name =
      dump
      |> SDE.Converter.transform_data(%YamlFile{map_key: "itemName", mapper: & &1["itemID"]})

    store_merged(:names, name_to_id)
    store_merged(:ids, id_to_name)
  end

  def load({:planet_schematics_pin_map, config}) do
    dump = SDE.Loader.load_dump(:planet_schematics_pin_map)

    schematic_pins =
      dump
      |> SDE.Converter.transform_data(%{
        config
        | map_key: "schematicID",
          mapper: & &1["pinTypeID"]
      })

    pin_schematics =
      dump
      |> SDE.Converter.transform_data(%{
        config
        | map_key: "pinTypeID",
          mapper: & &1["schematicID"]
      })

    SDE.Data.put(:planet_pins_for_schematic, schematic_pins)
    SDE.Data.put(:planet_schematics_for_pin, pin_schematics)
  end

  def load({:planet_schematics_type_map, config}) do
    dump = SDE.Loader.load_dump(:planet_schematics_type_map)

    schematic_types =
      dump
      |> SDE.Converter.transform_data(%{config | map_key: "schematicID"})

    type_schematics =
      dump
      |> SDE.Converter.transform_data(%{config | map_key: "typeID"})

    SDE.Data.put(:planet_types_for_schematic, schematic_types)
    SDE.Data.put(:planet_schematics_for_type, type_schematics)
  end

  def load({:station_operation_services, config}) do
    dump = SDE.Loader.load_dump(:station_operation_services)

    operation_services =
      dump
      |> SDE.Converter.transform_data(%{
        config
        | map_key: "operationID",
          mapper: & &1["serviceID"]
      })

    service_operations =
      dump
      |> SDE.Converter.transform_data(%{
        config
        | map_key: "serviceID",
          mapper: & &1["operationID"]
      })

    SDE.Data.put(:station_services_for_operation, operation_services)
    SDE.Data.put(:station_operations_for_service, service_operations)
  end

  def load({key, _config}) do
    dump = SDE.Loader.load_dump(key)

    SDE.Data.put(key, dump)
  end

  defp store_merged(key, data) when is_map(data) do
    prev = SDE.Data.get(key, %{})

    SDE.Data.put(key, Map.merge(data, prev))
  end
end
