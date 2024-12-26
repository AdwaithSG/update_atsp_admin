import 'dart:convert';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> orders = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData();
  }

  // Function to load data from assets
  Future<void> _loadData() async {
    try {
      // Load JSON file using DefaultAssetBundle for Flutter Web
      final jsonString = await DefaultAssetBundle.of(context).loadString('assets/data.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      // Set state to update the UI with the loaded data
      setState(() {
        orders = jsonData.map((e) => Map<String, dynamic>.from(e)).toList();
      });

      print("Data loaded successfully: $orders");
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  // Function to handle row tap (can be extended to navigate to another screen or show a dialog)
  void _onRowTap(int index) {
    final order = orders[index];
    print("Tapped on order with ID: ${order['id']}");

    // Example: Show a dialog with order details
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Details'),
          content: Text(
            'Id: ${order['id']}\n'
            'Name: ${order['name']}\n'
            'Payment: ${order['payment']}\n'
            'Type: ${order['type']}\n'
            'Status: ${order['status']}\n'
            'Total: ${order['total']}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show a popup menu when the 3 dots are clicked
  void _onMenuOptionSelected(String value, int index) {
    final order = orders[index];
    if (value == 'view_profile') {
      // Perform action for "View Profile"
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Profile of ${order['name']}'),
            content: Text('Here are the details for ${order['name']}.\n\n'
                'Id: ${order['id']}\n'
                'Payment: ${order['payment']}\n'
                'Type: ${order['type']}\n'
                'Status: ${order['status']}\n'
                'Total: ${order['total']}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
    // You can add more cases for other menu options like 'edit_profile' or 'delete'
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.history, color: Colors.black), // History icon
            SizedBox(width: 8), // Space between icon and title
            Text('History Page', style: TextStyle(color: Colors.black)),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: orders.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Table header
                  Row(
                    children: const [
                      Expanded(child: Text("Id", style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Payment", style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Type", style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(child: Text("Total", style: TextStyle(fontWeight: FontWeight.bold))),
                      SizedBox(width: 30), // Space for actions
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Table rows
                  Expanded(
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return GestureDetector(
                          onTap: () => _onRowTap(index), // Handle row tap
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 16.0), // Increased space between rows
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16), // More rounded borders
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.05), // Shaded space between rows
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0), // Increased padding for more height
                                          child: Text(order['id'], style: TextStyle(color: Colors.black, fontSize: 18)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Text(order['name'], style: TextStyle(color: Colors.black, fontSize: 18)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Text(order['payment'], style: TextStyle(color: Colors.black, fontSize: 18)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Text(order['type'], style: TextStyle(color: Colors.black, fontSize: 18)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Text(order['status'], style: TextStyle(color: Colors.black, fontSize: 18)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Text(order['total'], style: TextStyle(color: Colors.black, fontSize: 18)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: PopupMenuButton<String>(
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                          onSelected: (value) => _onMenuOptionSelected(value, index),
                                          itemBuilder: (BuildContext context) {
                                            return [
                                              PopupMenuItem<String>(
                                                value: 'view_profile',
                                                child: Text('View Profile'),
                                              ),
                                              // Add more options here as needed
                                            ];
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
