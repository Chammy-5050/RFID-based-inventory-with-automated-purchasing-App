
class IoTDeviceModel {
  final int id;
  final String deviceName;
  final String deviceIdentifier;
  final int locationId;
  final String ipAddress;
  final String status;
  final String lastSeen;

  IoTDeviceModel({
    required this.id,
    required this.deviceName,
    required this.deviceIdentifier,
    required this.locationId,
    required this.ipAddress,
    required this.status,
    required this.lastSeen,
  });
}

final List<IoTDeviceModel> mockIoTDevices = [
  IoTDeviceModel(
    id: 1,
    deviceName: "RFID Reader Gate A",
    deviceIdentifier: "DEV-001",
    locationId: 1,
    ipAddress: "192.168.1.10",
    status: "online",
    lastSeen: "2026-06-27 10:20",
  ),
  IoTDeviceModel(
    id: 2,
    deviceName: "Warehouse Scanner",
    deviceIdentifier: "DEV-002",
    locationId: 2,
    ipAddress: "192.168.1.11",
    status: "offline",
    lastSeen: "2026-06-26 18:10",
  ),
];