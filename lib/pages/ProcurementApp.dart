import 'package:flutter/material.dart';
import 'package:rfid/pages/login_screen.dart';
import 'package:rfid/pages/supplier_request_order.dart';

void main() {
  runApp(const ProcurementApp());
}

class ProcurementApp extends StatelessWidget {
  const ProcurementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Procurement Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.amber,

        scaffoldBackgroundColor: Colors.grey.shade100,
        fontFamily: 'Roboto',
      ),
      home: const ProcurementDashboard(),
    );
  }
}

class ProcurementDashboard extends StatefulWidget {
  const ProcurementDashboard({super.key});

  @override
  State<ProcurementDashboard> createState() =>
      _ProcurementDashboardState();
}

class _ProcurementDashboardState
    extends State<ProcurementDashboard> {
  final List<Map<String, dynamic>> requests = [
    {
      "id": "SR-1001",
      "department": "ICT Department",
      "requestor": "Storekeeper",
      "status": "New"
    },
    {
      "id": "SR-1002",
      "department": "Finance Department",
      "requestor": "Storekeeper",
      "status": "Urgent"
    },
    {
      "id": "SR-1003",
      "department": "HR Department",
      "requestor": "Storekeeper",
      "status": "In Progress"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Procurement Officer Dashboard",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'logout') {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// SUMMARY CARDS
            Row(
              children: [
                Expanded(
                  child: dashboardCard(
                    "Pending",
                    "15",
                    Icons.pending_actions,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: dashboardCard(
                    "Approved",
                    "8",
                    Icons.check_circle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: dashboardCard(
                    "Rejected",
                    "2",
                    Icons.cancel,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: dashboardCard(
                    "PO Created",
                    "5",
                    Icons.shopping_cart_checkout,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// REQUEST QUEUE
            Container(
              padding: const EdgeInsets.all(15),
              decoration: boxDecoration(),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  sectionTitle(
                    "STORE REQUEST QUEUE",
                  ),

                  const SizedBox(height: 15),

                  ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        color: Colors.grey.shade50,
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  12),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Colors.amber.shade100,
                            child: const Icon(
                              Icons.inventory_2,
                              color: Colors.amber,
                            ),
                          ),
                          title: Text(
                            requests[index]["id"],
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            requests[index]
                                ["department"],
                          ),
                          trailing: statusChip(
                            requests[index]
                                ["status"],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// PROCESS REQUEST
            Container(
              padding: const EdgeInsets.all(15),
              decoration: boxDecoration(),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  sectionTitle(
                    "PROCESS REQUEST : SR-1001",
                  ),

                  const SizedBox(height: 20),

                  SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal,
                    child: DataTable(
                      headingRowColor:
                          WidgetStateProperty.all(
                        Colors.amber.shade50,
                      ),
                      columns: const [
                        DataColumn(
                            label: Text("Item")),
                        DataColumn(
                            label:
                                Text("Requested")),
                        DataColumn(
                            label:
                                Text("Approved")),
                        DataColumn(
                            label: Text("Stock")),
                      ],
                      rows: const [
                        DataRow(
                          cells: [
                            DataCell(
                                Text("Laptop")),
                            DataCell(Text("10")),
                            DataCell(Text("8")),
                            DataCell(Text("2")),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                                Text("Mouse")),
                            DataCell(Text("20")),
                            DataCell(Text("5")),
                            DataCell(Text("15")),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                                Text("Printer")),
                            DataCell(Text("2")),
                            DataCell(Text("2")),
                            DataCell(Text("0")),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [

                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                              Icons.check),
                          label:
                              const Text("Approve"),
                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green,
                            foregroundColor:
                                Colors.white,
                          ),
                        ),
                      ),
                    

                      const SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                              Icons.delete),
                          label:
                              const Text("Delete"),
                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red,
                            foregroundColor:
                                Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const SupplierRequestOrder(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_business),
                      label: const Text(
                        "Add Supplier Order",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag),
                      label: const Text(
                        "Generate Purchase Order",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(
      String title,
      String value,
      IconData icon) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [

            CircleAvatar(
              radius: 24,
              backgroundColor:
                  Colors.amber.shade100,
              child: Icon(
                icon,
                color: Colors.amber,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statusChip(String status) {
    Color color;

    switch (status) {
      case "Urgent":
        color = Colors.red.shade100;
        break;

      case "In Progress":
        color = Colors.orange.shade100;
        break;

      default:
        color = Colors.blue.shade100;
    }

    return Chip(
      label: Text(
        status,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: color,
    );
  }

  Widget sectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius:
                BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius:
          BorderRadius.circular(16),
      border: Border.all(
        color: Colors.amber.shade200,
      ),
      boxShadow: [
        BoxShadow(
          color:
              Colors.amber.withOpacity(0.08),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}