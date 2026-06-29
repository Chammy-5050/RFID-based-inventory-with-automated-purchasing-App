
class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String password;
  final String phone;
  final int roleId;
  final String profileImage;
  final String status;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.roleId,
    required this.profileImage,
    required this.status,
  });

  UserModel copyWith({
    int? id,
    String? fullName,
    String? email,
    String? password,
    String? phone,
    int? roleId,
    String? profileImage,
    String? status,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      roleId: roleId ?? this.roleId,
      profileImage: profileImage ?? this.profileImage,
      status: status ?? this.status,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      roleId: json['role_id'],
      profileImage: json['profile_image'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'password': password,
      'phone': phone,
      'role_id': roleId,
      'profile_image': profileImage,
      'status': status,
    };
  }
}

final List<UserModel> mockUsers = [
  UserModel(
    id: 1,
    fullName: "System Administrator",
    email: "admin@inventory.com",
    password: "********",
    phone: "+255712111111",
    roleId: 1,
    profileImage: "assets/images/users/admin.png",
    status: "Active",
  ),
  UserModel(
    id: 2,
    fullName: "John Smith",
    email: "john.smith@inventory.com",
    password: "********",
    phone: "+255712222222",
    roleId: 2,
    profileImage: "assets/images/users/user1.png",
    status: "Active",
  ),
  UserModel(
    id: 3,
    fullName: "Sarah Johnson",
    email: "sarah@inventory.com",
    password: "********",
    phone: "+255712333333",
    roleId: 2,
    profileImage: "assets/images/users/user2.png",
    status: "Active",
  ),
  UserModel(
    id: 4,
    fullName: "Michael Brown",
    email: "michael@inventory.com",
    password: "********",
    phone: "+255712444444",
    roleId: 3,
    profileImage: "assets/images/users/user3.png",
    status: "Inactive",
  ),
  UserModel(
    id: 5,
    fullName: "Emily Davis",
    email: "emily@inventory.com",
    password: "********",
    phone: "+255712555555",
    roleId: 2,
    profileImage: "assets/images/users/user4.png",
    status: "Active",
  ),
  UserModel(
    id: 6,
    fullName: "David Wilson",
    email: "david@inventory.com",
    password: "********",
    phone: "+255712666666",
    roleId: 3,
    profileImage: "assets/images/users/user5.png",
    status: "Suspended",
  ),
  UserModel(
    id: 7,
    fullName: "Grace Taylor",
    email: "grace@inventory.com",
    password: "********",
    phone: "+255712777777",
    roleId: 2,
    profileImage: "assets/images/users/user6.png",
    status: "Active",
  ),
  UserModel(
    id: 8,
    fullName: "James Anderson",
    email: "james@inventory.com",
    password: "********",
    phone: "+255712888888",
    roleId: 3,
    profileImage: "assets/images/users/user7.png",
    status: "Active",
  ),
  UserModel(
    id: 9,
    fullName: "Olivia Thomas",
    email: "olivia@inventory.com",
    password: "********",
    phone: "+255712999999",
    roleId: 2,
    profileImage: "assets/images/users/user8.png",
    status: "Inactive",
  ),
  UserModel(
    id: 10,
    fullName: "Daniel Lee",
    email: "daniel@inventory.com",
    password: "********",
    phone: "+255713000000",
    roleId: 3,
    profileImage: "assets/images/users/user9.png",
    status: "Active",
  ),
];