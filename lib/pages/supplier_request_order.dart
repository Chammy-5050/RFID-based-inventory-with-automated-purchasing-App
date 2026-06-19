import 'package:flutter/material.dart';

class SupplierRequestOrder extends StatefulWidget {
  const SupplierRequestOrder({super.key});

  @override
  State<SupplierRequestOrder> createState() => _SupplierRequestOrderState();
}

class _SupplierRequestOrderState extends State<SupplierRequestOrder> {
  String _selectedSupplier = 'Supplier A';
  int _itemCount = 1;
  double _amountToPay = 0.0;
  bool _confirmOrder = false;

  final List<String> _suppliers = [
    'Supplier A',
    'Supplier B',
    'Supplier C',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supplier Order Request'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Supplier',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedSupplier,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.amber.shade50,
              ),
              items: _suppliers
                  .map(
                    (supplier) => DropdownMenuItem<String>(
                      value: supplier,
                      child: Text(supplier),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSupplier = value ?? _selectedSupplier;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Number of Items to Order',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (_itemCount > 1) {
                        setState(() {
                          _itemCount--;
                        });
                      }
                    },
                  ),
                  Text(
                    '$_itemCount',
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _itemCount++;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Amount to Pay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                prefixText: 'UGX ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.amber.shade50,
                hintText: 'Enter amount',
              ),
              onChanged: (value) {
                setState(() {
                  _amountToPay = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              value: _confirmOrder,
              onChanged: (value) {
                setState(() {
                  _confirmOrder = value ?? false;
                });
              },
              title: const Text('Confirm the items to order'),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _confirmOrder && _amountToPay > 0
                    ? () {
                        showDialog<void>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Order Sent'),
                            content: Text(
                              'Order sent to $_selectedSupplier for $_itemCount item(s) with UGX ${_amountToPay.toStringAsFixed(2)}.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Send Order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
