import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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

  const PersonalInfoCard({super.key, 
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 300, // Reduced width for compact card
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 98, 120, 182).withOpacity(0.5),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Car & Personal Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            // Shaded Boxes for Data
            _buildShadedBox('First Name', firstName),
            _buildShadedBox('Date of Birth', dateOfBirth),
            _buildShadedBox('Email', email),
            _buildShadedBox('Phone no', phoneNumber),
            _buildShadedBox('Country', country),
            _buildShadedBox('City', city),
            _buildShadedBox('Driving Experience', drivingExperience),
          ],
        ),
      ),
    );
  }

  Widget _buildShadedBox(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, ),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParkingSpaceCard extends StatelessWidget {
  final String section;
  final String row;
  final String space;

  const ParkingSpaceCard({super.key, 
    required this.section,
    required this.row,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 200, // Reduced width for compact card
        height: 270,
        padding: const EdgeInsets.all(10),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading for the Parking Space Card
           Text(
              'Parking Space',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            // Shaded Boxes for Data arranged in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShadedBox('Section', section),
                _buildShadedBox('Row', row),
                _buildShadedBox('Space', space),
              ],
            ),
            SizedBox(height: 16),
            // Centering the button within the container
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Reassign',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShadedBox(String label, String value) {
    return Container(
      width: 150,
      height: 150, // Ensuring the boxes are square-shaped
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 167, 181, 237),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
