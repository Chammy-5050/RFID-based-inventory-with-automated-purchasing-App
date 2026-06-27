class LocationModel {
  final int id;
  final String name;
  final String building;
  final String floor;
  final String room;
  final String description;

  LocationModel({
    required this.id,
    required this.name,
    required this.building,
    required this.floor,
    required this.room,
    required this.description,
  });
}

final List<LocationModel> mockLocations = [
  LocationModel(
    id: 1,
    name: "Main Office",
    building: "Block A",
    floor: "3rd Floor",
    room: "A301",
    description: "Administrative department office",
  ),
  LocationModel(
    id: 2,
    name: "IT Lab",
    building: "Block B",
    floor: "2nd Floor",
    room: "B210",
    description: "Computer and networking lab",
  ),
  LocationModel(
    id: 3,
    name: "Store Room",
    building: "Block C",
    floor: "Ground Floor",
    room: "C005",
    description: "Equipment storage area",
  ),
];