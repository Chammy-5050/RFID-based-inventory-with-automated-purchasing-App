
class IoTScanModel {
  final int id;
  final String tagId;
  final int deviceId;
  final int locationId;
  final String scanTime;
  final int signalStrength;

  IoTScanModel({
    required this.id,
    required this.tagId,
    required this.deviceId,
    required this.locationId,
    required this.scanTime,
    required this.signalStrength,
  });
}

final List<IoTScanModel> mockIoTScans = [
  IoTScanModel(
    id: 1,
    tagId: "RFID0001",
    deviceId: 1,
    locationId: 1,
    scanTime: "2026-06-27 09:00",
    signalStrength: -45,
  ),
  IoTScanModel(
    id: 2,
    tagId: "RFID0002",
    deviceId: 2,
    locationId: 2,
    scanTime: "2026-06-27 09:05",
    signalStrength: -60,
  ),
];