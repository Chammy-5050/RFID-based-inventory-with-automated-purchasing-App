class VendorModel {
  final int id;
  final String vendorName;
  final String email;
  final String phone;
  final String address;

  VendorModel({
    required this.id,
    required this.vendorName,
    required this.email,
    required this.phone,
    required this.address,
  });
}

final List<VendorModel> mockVendors = [
  VendorModel(
    id: 1,
    vendorName: "Dell Technologies Partner",
    email: "support@dellpartner.com",
    phone: "+255700111222",
    address: "Dar es Salaam, Tanzania",
  ),
  VendorModel(
    id: 2,
    vendorName: "HP Authorized Dealer",
    email: "info@hpdealer.com",
    phone: "+255711445566",
    address: "Dodoma, Tanzania",
  ),
  VendorModel(
    id: 3,
    vendorName: "Lenovo Supplier Hub",
    email: "contact@lenovo-supplies.com",
    phone: "+255722334455",
    address: "Tanga, Tanzania",
  ),
];