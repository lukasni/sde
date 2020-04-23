defmodule SDE.Config do
  alias SDE.Config.YamlFile

  def sde() do
    Path.join(:code.priv_dir(:sde), "sde")
  end

  def fsd() do
    Path.join(sde(), "fsd")
  end

  def bsd() do
    Path.join(sde(), "bsd")
  end

  def dumps() do
    Path.join(:code.priv_dir(:sde), "dumps")
  end

  def dump_path(key) do
    Path.join(dumps(), to_string(key) <> ".dump")
  end

  def yaml_files() do
    [
      agent_types: %YamlFile{
        path: Path.join(bsd(), "agtAgentTypes.yaml"),
        map_key: "agentTypeID"
      },
      agents: %YamlFile{
        path: Path.join(bsd(), "agtAgents.yaml"),
        map_key: "agentID"
      },
      research_agents: %YamlFile{
        path: Path.join(bsd(), "agtResearchAgents.yaml"),
        map_key: "agentID"
      },
      ancestries: %YamlFile{
        path: Path.join(bsd(), "chrAncestries.yaml"),
        map_key: "ancestryID"
      },
      attributes: %YamlFile{
        path: Path.join(bsd(), "chrAttributes.yaml"),
        map_key: "attributeID"
      },
      bloodlines: %YamlFile{
        path: Path.join(bsd(), "chrBloodlines.yaml"),
        map_key: "bloodlineID"
      },
      factions: %YamlFile{
        path: Path.join(bsd(), "chrFactions.yaml"),
        map_key: "factionID"
      },
      races: %YamlFile{
        path: Path.join(bsd(), "chrRaces.yaml"),
        map_key: "raceID"
      },
      activities: %YamlFile{
        path: Path.join(bsd(), "crpActivities.yaml"),
        map_key: "activityID"
      },
      corporation_divisions: %YamlFile{
        path: Path.join(bsd(), "crpNPCCorporationDivisions.yaml"),
        map_key: "corporationID",
        single_value: false
      },
      corporation_research_fields: %YamlFile{
        path: Path.join(bsd(), "crpNPCCorporationResearchFields.yaml"),
        map_key: "corporationID",
        single_value: false,
        mapper: & &1["skillID"]
      },
      corporation_trades: %YamlFile{
        path: Path.join(bsd(), "crpNPCCorporationTrades.yaml"),
        map_key: "corporationID",
        single_value: false,
        mapper: & &1["typeID"]
      },
      corporations: %YamlFile{
        path: Path.join(bsd(), "crpNPCCorporations.yaml"),
        map_key: "corporationID"
      },
      divisions: %YamlFile{
        path: Path.join(bsd(), "crpNPCDivisions.yaml"),
        map_key: "divisionID"
      },
      # Dogma has been moved to FSD
      # %{
      #   path: Path.join(bsd(), "dgmAttributeCategories.yaml"),
      # },
      # %{
      #   path: Path.join(bsd(), "dgmAttributeTypes.yaml"),
      # },
      # %{
      #   path: Path.join(bsd(), "dgmEffects.yaml"),
      # },
      # %{
      #   path: Path.join(bsd(), "dgmTypeAttributes.yaml"),
      # },
      # %{
      #   path: Path.join(bsd(), "dgmTypeEffects.yaml"),
      # },
      units: %YamlFile{
        path: Path.join(bsd(), "eveUnits.yaml"),
        map_key: "unitID"
      },
      flags: %YamlFile{
        path: Path.join(bsd(), "invFlags.yaml"),
        map_key: "flagID"
      },
      items: %YamlFile{
        path: Path.join(bsd(), "invItems.yaml"),
        map_key: "itemID"
      },
      names: %YamlFile{
        path: Path.join(bsd(), "invNames.yaml"),
        mapper: & &1["itemName"]
      },
      positions: %YamlFile{
        path: Path.join(bsd(), "invPositions.yaml"),
        map_key: "itemID"
      },
      reactions: %YamlFile{
        path: Path.join(bsd(), "invTypeReactions.yaml"),
        map_key: "reactionTypeID",
        single_value: false
      },
      unique_names: %YamlFile{
        path: Path.join(bsd(), "invUniqueNames.yaml"),
        mapper: & &1["itemName"]
      },
      universe: %YamlFile{
        path: Path.join(bsd(), "mapUniverse.yaml"),
        map_key: "universeID"
      },
      planet_schematics: %YamlFile{
        path: Path.join(bsd(), "planetSchematics.yaml"),
        map_key: "schematicID"
      },
      planet_schematics_pin_map: %YamlFile{
        path: Path.join(bsd(), "planetSchematicsPinMap.yaml"),
        single_value: false
      },
      planet_schematics_type_map: %YamlFile{
        path: Path.join(bsd(), "planetSchematicsTypeMap.yaml"),
        single_value: false
      },
      station_operation_services: %YamlFile{
        path: Path.join(bsd(), "staOperationServices.yaml")
      },
      station_operations: %YamlFile{
        path: Path.join(bsd(), "staOperations.yaml"),
        map_key: "operationID"
      },
      station_services: %YamlFile{
        path: Path.join(bsd(), "staServices.yaml"),
        map_key: "serviceID",
        mapper: & &1["serviceName"]
      },
      station_types: %YamlFile{
        path: Path.join(bsd(), "staStationTypes.yaml"),
        map_key: "stationTypeID"
      },
      stations: %YamlFile{
        path: Path.join(bsd(), "staStations.yaml"),
        map_key: "stationID"
      },
      translation_columns: %YamlFile{
        path: Path.join(bsd(), "trnTranslationColumns.yaml"),
        map_key: "tcID"
      },
      translation_languages: %YamlFile{
        path: Path.join(bsd(), "trnTranslationLanguages.yaml"),
        map_key: "languageID"
      },
      translations: %YamlFile{
        path: Path.join(bsd(), "trnTranslations.yaml")
      },
      war_combat_zone_systems: %YamlFile{
        path: Path.join(bsd(), "warCombatZoneSystems.yaml"),
        map_key: "combatZoneID",
        single_value: false,
        mapper: & &1["solarSystemID"]
      },
      war_combat_zones: %YamlFile{
        path: Path.join(bsd(), "warCombatZones.yaml"),
        map_key: "combatZoneID"
      },
      agents_in_space: %YamlFile{
        path: Path.join(fsd(), "agentsInSpace.yaml")
      },
      blueprints: %YamlFile{
        path: Path.join(fsd(), "blueprints.yaml")
      },
      categories: %YamlFile{
        path: Path.join(fsd(), "categoryIDs.yaml")
      },
      certificates: %YamlFile{
        path: Path.join(fsd(), "certificates.yaml")
      },
      contraband_types: %YamlFile{
        path: Path.join(fsd(), "contrabandTypes.yaml")
      },
      control_tower_resources: %YamlFile{
        path: Path.join(fsd(), "controlTowerResources.yaml")
      },
      dogma_categories: %YamlFile{
        path: Path.join(fsd(), "dogmaAttributeCategories.yaml")
      },
      dogma_attributes: %YamlFile{
        path: Path.join(fsd(), "dogmaAttributes.yaml")
      },
      dogma_effects: %YamlFile{
        path: Path.join(fsd(), "dogmaEffects.yaml")
      },
      graphics: %YamlFile{
        path: Path.join(fsd(), "graphicIDs.yaml")
      },
      groups: %YamlFile{
        path: Path.join(fsd(), "groupIDs.yaml")
      },
      icons: %YamlFile{
        path: Path.join(fsd(), "iconIDs.yaml")
      },
      market_groups: %YamlFile{
        path: Path.join(fsd(), "marketGroups.yaml")
      },
      meta_groups: %YamlFile{
        path: Path.join(fsd(), "metaGroups.yaml")
      },
      skin_licenses: %YamlFile{
        path: Path.join(fsd(), "skinLicenses.yaml")
      },
      skin_materials: %YamlFile{
        path: Path.join(fsd(), "skinMaterials.yaml")
      },
      skins: %YamlFile{
        path: Path.join(fsd(), "skins.yaml")
      },
      tournament_rule_sets: %YamlFile{
        path: Path.join(fsd(), "tournamentRuleSets.yaml"),
        map_key: "ruleSetID"
      },
      type_dogma: %YamlFile{
        path: Path.join(fsd(), "typeDogma.yaml")
      },
      types: %YamlFile{
        path: Path.join(fsd(), "typeIDs.yaml")
      },
      type_materials: %YamlFile{
        path: Path.join(fsd(), "typeMaterials.yaml")
      }
    ]
  end
end
