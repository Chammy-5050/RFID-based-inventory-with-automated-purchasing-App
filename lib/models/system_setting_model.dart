class SystemSettingModel {
  final int id;
  final String settingKey;
  final String settingValue;
  final String description;

  SystemSettingModel({
    required this.id,
    required this.settingKey,
    required this.settingValue,
    required this.description,
  });
}

final List<SystemSettingModel> mockSystemSettings = [
  SystemSettingModel(
    id: 1,
    settingKey: "app_name",
    settingValue: "RFID Tracker",
    description: "Application name",
  ),
  SystemSettingModel(
    id: 2,
    settingKey: "maintenance_mode",
    settingValue: "false",
    description: "Enable or disable maintenance mode",
  ),
];