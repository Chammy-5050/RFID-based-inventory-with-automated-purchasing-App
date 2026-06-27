class RoleModel {
  final int id;
  final String roleName;
  final String description;

  RoleModel({
    required this.id,
    required this.roleName,
    required this.description,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'],
      roleName: json['role_name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role_name': roleName,
      'description': description,
    };
  }

  RoleModel copyWith({
    int? id,
    String? roleName,
    String? description,
  }) {
    return RoleModel(
      id: id ?? this.id,
      roleName: roleName ?? this.roleName,
      description: description ?? this.description,
    );
  }
}

final List<RoleModel> mockRoles = [
  RoleModel(
    id: 1,
    roleName: "Administrator",
    description: "Full access to the system.",
  ),
  RoleModel(
    id: 2,
    roleName: "Inventory Manager",
    description: "Manages inventory records and assets.",
  ),
  RoleModel(
    id: 3,
    roleName: "Store Keeper",
    description: "Responsible for stock movement.",
  ),
  RoleModel(
    id: 4,
    roleName: "Technician",
    description: "Performs maintenance and repairs.",
  ),
  RoleModel(
    id: 5,
    roleName: "Employee",
    description: "Uses assigned company assets.",
  ),
  RoleModel(
    id: 6,
    roleName: "Procurement Officer",
    description: "Handles purchasing and suppliers.",
  ),
  RoleModel(
    id: 7,
    roleName: "Auditor",
    description: "Reviews audit trails and reports.",
  ),
  RoleModel(
    id: 8,
    roleName: "Security Officer",
    description: "Monitors RFID and IoT devices.",
  ),
  RoleModel(
    id: 9,
    roleName: "Department Head",
    description: "Approves asset assignments.",
  ),
  RoleModel(
    id: 10,
    roleName: "Guest",
    description: "Read-only access.",
  ),
];