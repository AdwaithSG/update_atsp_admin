import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget { // Renamed from DashboardPage to ProfilePage
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Make the page scrollable
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // First existing widget (same as before)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Client Picture
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/sample_client.jpg', // Replace with your image path
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),

                  // Client Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Reg No: ABC1234',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  // Parking Start Date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Date',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '2024-12-10',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  Spacer(),

                  // Parking End Date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Date',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '2024-12-12',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  Spacer(),

                  // Timer and Payment Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Timer (Progress Bar)
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 10,
                            child: LinearProgressIndicator(
                              value: 0.7, // 70% Progress Example
                              backgroundColor: Colors.grey[300],
                              color: const Color.fromARGB(255, 22, 194, 77),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '70%',
                            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Payment Info
                      Row(
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            size: 16,
                            color: Colors.green,
                          ),
                          Text(
                            '500',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            // New Booking Progress Section
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Step 1: New Booking
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'New Booking',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 31, 123, 197), // Active step in blue
                            ),
                          ),
                        ],
                      ),
                      // Horizontal Line after New Booking
                      Container(
                        width: 180,
                        height: 2,
                        color: const Color.fromARGB(255, 36, 138, 222), // Line color for active step
                      ),
                      // Step 2: Waiting for Car
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Waiting for Car',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Default color
                            ),
                          ),
                        ],
                      ),
                      // Horizontal Line after Waiting for Car
                      Container(
                        width: 180,
                        height: 2,
                        color: Colors.black, // Line color for default steps
                      ),
                      // Step 3: Car Parked
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Car Parked',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Default color
                            ),
                          ),
                        ],
                      ),
                      // Horizontal Line after Car Parked
                      Container(
                        width: 180,
                        height: 2,
                        color: Colors.black, // Line color for default steps
                      ),
                      // Step 4: Exited from Slot
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Exited from Slot',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Default color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Main horizontal line connecting all steps
                  Container(
                    height: 2,
                    color: Colors.white, // Line connecting all steps
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            // Row to display both Personal Info and Parking Space cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PersonalInfoCard(
                    firstName: 'Pranav',
                    dateOfBirth: '9 Jan 2003',
                    email: 'Pranav334@gmail.com',
                    phoneNumber: '93343223664274',
                    country: 'India',
                    city: 'Thrissur',
                    drivingExperience: '4 yr',
                  ),
                ),
                SizedBox(width: 10), // Space between the cards
                Expanded(
                  child: ParkingSpaceCard(
                    section: 'C',
                    row: '31',
                    space: '#C31',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalInfoCard extends StatelessWidget {
  final String firstName;
  final String dateOfBirth;
  final String email;
  final String phoneNumber;
  final String country;
  final String city;
  final String drivingExperience;

  const PersonalInfoCard({
    super.key,
    required this.firstName,
    required this.dateOfBirth,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.drivingExperience,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 236, 240, 255),
            const Color.fromARGB(255, 205, 230, 255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car & Personal Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[900],
            ),
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.grey[300], thickness: 1),
          const SizedBox(height: 12),
          _buildRow(
            _buildShadedBox(Icons.person, 'First Name', firstName),
            _buildShadedBox(Icons.cake, 'Date of Birth', dateOfBirth),
          ),
          const SizedBox(height: 12),
          _buildRow(
            _buildShadedBox(Icons.email, 'Email', email),
            _buildShadedBox(Icons.phone, 'Phone No.', phoneNumber),
          ),
          const SizedBox(height: 12),
          _buildRow(
            _buildShadedBox(Icons.flag, 'Country', country),
            _buildShadedBox(Icons.location_city, 'City', city),
          ),
          const SizedBox(height: 12),
          Center(
            child: _buildShadedBox(Icons.car_repair, 'Driving Experience', drivingExperience),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(Widget left, Widget right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: left),
        const SizedBox(width: 16), // Space between two fields
        Expanded(child: right),
      ],
    );
  }

  Widget _buildShadedBox(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 247, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.indigo[400]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class ParkingSpaceCard extends StatelessWidget {
  final String section;
  final String row;
  final String space;

  const ParkingSpaceCard({
    super.key,
    required this.section,
    required this.row,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,  // Set a fixed width for the card
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 236, 240, 255),
            const Color.fromARGB(255, 205, 230, 255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Parking Space Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[900],
            ),
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.grey[300], thickness: 1),
          const SizedBox(height: 12),

          // Details in Shaded Boxes
          _buildRow(
            _buildShadedBox('Section', section),
            _buildShadedBox('Row', row),
          ),
          const SizedBox(height: 10),
          Center(
            child: _buildShadedBox('Space', space),
          ),
          const SizedBox(height: 20),

          // Centered Reassign Button
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[700],
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Reassign',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(Widget left, Widget right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,  // Center the row
      children: [
        SizedBox(
          width: 250,  // Width for each box in the row
          child: left,
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 250,  // Width for each box in the row
          child: right,
        ),
      ],
    );
  }

  Widget _buildShadedBox(String label, String value) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 247, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,  // Center content inside shaded box
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

