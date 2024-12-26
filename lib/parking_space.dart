import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parking Space Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const ParkingSpacePage(),
    );
  }
}

class ParkingSpacePage extends StatefulWidget {
  const ParkingSpacePage({super.key});

  @override
  _ParkingSpacePageState createState() => _ParkingSpacePageState();
}

class _ParkingSpacePageState extends State<ParkingSpacePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _floors = [
    "Ground Floor",
    "1st Floor",
    "2nd Floor",
    "3rd Floor",
  ];

  final Map<String, List<String>> _parkingSpaces = {
    "Ground Floor": ["A01", "A02", "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A010", "A011", "A012", "A013", "A014"],
    "1st Floor": ["B01", "B02", "B03", "B04", "B05", "B06"],
    "2nd Floor": ["C01", "C02", "C03", "C04", "C05", "C06", "C07"],
    "3rd Floor": ["D01", "D02", "D03", "D04", "D05", "D06"],
  };

  final Set<String> _bookedSpaces = {"A01", "B02", "C03", "D04"};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _floors.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Parking Space",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: TabBarView(
        controller: _tabController,
        children: _floors.map((floor) => _buildFloorPage(floor)).toList(),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicator: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: _floors.map((floor) {
            return Tab(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  floor,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildFloorPage(String floor) {
    final slots = _parkingSpaces[floor]!;
    final int slotCount = slots.length;

    int rows = 1; 
    int columns = slotCount;

    // If the number of slots is greater than or equal to 10, split into rows with a maximum of 5 columns
    if (slotCount >= 10) {
      columns = 5;
      rows = (slotCount / columns).ceil(); // Adjust rows dynamically
    } else {
      // For fewer than 10 slots, distribute them evenly across 2 rows
      rows = 2;
      columns = (slotCount / rows).ceil();
    }

    final double slotWidth = 140.0 * 1.75; // Increased by 1.75 (0.75x increase)
    final double slotHeight = 180.0 * 1.75; // Increased by 1.75 (0.75x increase)
    final double horizontalPadding = 15.0;
    final double verticalPadding = 15.0;

    final double gridWidth = columns * (slotWidth + 2 * horizontalPadding);
    final double gridHeight = (rows * (slotHeight + 2 * verticalPadding));

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView( // Make the content scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              floor,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: gridWidth,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: _buildParkingGrid(floor, rows, columns, slotWidth, slotHeight),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParkingGrid(String floor, int rows, int columns, double slotWidth, double slotHeight) {
    final slots = _parkingSpaces[floor]!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < rows; i++)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int j = 0; j < columns; j++)
                    if (i * columns + j < slots.length)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                        child: Container(
                          width: slotWidth,
                          height: slotHeight,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/parking_bg4.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: _getParkingSlotContent(floor, i * columns + j),
                          ),
                        ),
                      ),
                ],
              ),
              // Add a central container after each row (except the last row)
              if (i < rows - 1) 
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 80, // Adjust the height as per your needs
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background_image.png'), // Use your desired background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }

  Widget _getParkingSlotContent(String floor, int index) {
    final slot = _parkingSpaces[floor]![index];
    final isBooked = _bookedSpaces.contains(slot);

    if (isBooked) {
      return Image.asset(
        'assets/car_icon.png',
        width: 280,
        height: 280,
      );
    } else {
      return Text(
        slot,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.black87,
        ),
      );
    }
  }
}
