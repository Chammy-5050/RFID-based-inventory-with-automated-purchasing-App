class RfidTagModel {
  final int id;
  final String tagUid;
  final String tagType;
  final String status;
  final int assignedItemId;

  RfidTagModel({
    required this.id,
    required this.tagUid,
    required this.tagType,
    required this.status,
    required this.assignedItemId,
  });
}

final List<RfidTagModel> mockRfidTags = [
  RfidTagModel(
    id: 1,
    tagUid: "RFID-1001",
    tagType: "Passive",
    status: "assigned",
    assignedItemId: 1,
  ),
  RfidTagModel(
    id: 2,
    tagUid: "RFID-1002",
    tagType: "Active",
    status: "available",
    assignedItemId: 0,
  ),
];