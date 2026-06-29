class EquipmentCheckoutModel {
  final int id;
  final int inventoryItemId;
  final int checkedOutBy;
  final int assignedTo;
  final String checkoutDate;
  final String expectedReturnDate;
  final String actualReturnDate;
  final String status;
  final String notes;

  EquipmentCheckoutModel({
    required this.id,
    required this.inventoryItemId,
    required this.checkedOutBy,
    required this.assignedTo,
    required this.checkoutDate,
    required this.expectedReturnDate,
    required this.actualReturnDate,
    required this.status,
    required this.notes,
  });
}

final List<EquipmentCheckoutModel> mockCheckouts = [
  EquipmentCheckoutModel(
    id: 1,
    inventoryItemId: 1,
    checkedOutBy: 1,
    assignedTo: 2,
    checkoutDate: "2026-06-01",
    expectedReturnDate: "2026-06-10",
    actualReturnDate: "",
    status: "Checked Out",
    notes: "For office use",
  ),
  EquipmentCheckoutModel(
    id: 2,
    inventoryItemId: 2,
    checkedOutBy: 2,
    assignedTo: 3,
    checkoutDate: "2026-05-20",
    expectedReturnDate: "2026-05-30",
    actualReturnDate: "2026-05-29",
    status: "Returned",
    notes: "Returned in good condition",
  ),
];