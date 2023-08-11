import 'package:flutter/material.dart';
import 'pemesanan.dart';
import 'pengaturan.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Dashboard')),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Selamat Datang di Aplikasi Traveling',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              DashboardCard(
                icon: Icons.hotel,
                title: 'Hotel',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TravelApp(),
                    ),
                  ); // Handle hotel button tap
                },
              ),
              DashboardCard(
                icon: Icons.flight,
                title: 'Penerbangan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TravelApp(),
                    ),
                  ); // Handle flight button tap
                },
              ),
              DashboardCard(
                icon: Icons.restaurant,
                title: 'Restoran',
                onTap: () {
                  // Handle restaurant button tap
                },
              ),
              DashboardCard(
                icon: Icons.add_location_alt_rounded, // Menggunakan ikon koper
                title: 'Destinasi',
                onTap: () {
                  // Handle pengiriman button tap
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
            child: Container(
              width: 448,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.blue,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Icon(
                        Icons.airplane_ticket,
                        color: Colors.grey,
                        size: 28,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(9, 0, 0, 0),
                      child: Text(
                        'Kupon diskon 10% untuk\nPemesanan Pertama di Aplikasi',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: TextButton(
                        onPressed: () {
                          // Handle klaim button tap
                        },
                        child: const Text(
                          'Klaim',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.blue,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Pemesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Lainnya',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation item tap
          if (index == 0) {
            // Navigasi ke halaman home
            Navigator.pushNamed(context, '/dashboard');
          } else if (index == 1) {
            // Navigasi ke halaman Form Pemesanan
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TravelApp(),
              ),
            );
          } else if (index == 2) {
            // Navigasi ke halaman settings
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DashboardCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(16.0),
        color: Colors.blue[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
