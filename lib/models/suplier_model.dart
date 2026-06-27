class SupplierModel {
  final int id;
  final String supplierName;
  final String contactPerson;
  final String email;
  final String phone;
  final String address;

  SupplierModel({
    required this.id,
    required this.supplierName,
    required this.contactPerson,
    required this.email,
    required this.phone,
    required this.address,
  });
}

final List<SupplierModel> mockSuppliers = [
  SupplierModel(
    id: 1,
    supplierName: "Tech Solutions Ltd",
    contactPerson: "John Smith",
    email: "info@techsolutions.com",
    phone: "+255712345678",
    address: "Dar es Salaam, Tanzania",
  ),
  SupplierModel(
    id: 2,
    supplierName: "ABC Electronics",
    contactPerson: "Mary Johnson",
    email: "sales@abcelectronics.com",
    phone: "+255711223344",
    address: "Arusha, Tanzania",
  ),
  SupplierModel(
    id: 3,
    supplierName: "Global IT Supplies",
    contactPerson: "David Brown",
    email: "contact@globalit.com",
    phone: "+255713998877",
    address: "Mwanza, Tanzania",
  ),
];