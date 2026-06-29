
class ApiKeyModel {
  final int id;
  final String serviceName;
  final String apiKey;
  final String status;

  ApiKeyModel({
    required this.id,
    required this.serviceName,
    required this.apiKey,
    required this.status,
  });
}

final List<ApiKeyModel> mockApiKeys = [
  ApiKeyModel(
    id: 1,
    serviceName: "Firebase",
    apiKey: "FIREBASE-XYZ-123",
    status: "active",
  ),
  ApiKeyModel(
    id: 2,
    serviceName: "Supabase",
    apiKey: "SUPA-ABC-456",
    status: "inactive",
  ),
];