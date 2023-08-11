import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _favoriteDestination = true;
  bool _vipMember = false;
  bool _paymentCash = true;
  bool _notificationEnabled = true;
  bool _showPrices = true;

  void _saveSettings() {
    // Simpan pengaturan ke penyimpanan lokal
    // (bisa menggunakan Shared Preferences atau cara lain sesuai kebutuhan)
    // ...
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pengaturan disimpan.')),
    );
  }

  void _logOut() {
    // Implementasi logika untuk proses logout
    // ...
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Anda telah keluar.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Aplikasi Travel'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logOut,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pengaturan Umum',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favorit Destinasi'),
                trailing: Switch(
                  value: _favoriteDestination,
                  onChanged: (value) {
                    setState(() {
                      _favoriteDestination = value;
                    });
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.star_border),
                title: Text('Member VIP'),
                trailing: Switch(
                  value: _vipMember,
                  onChanged: (value) {
                    setState(() {
                      _vipMember = value;
                    });
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('Tunai'),
                trailing: Switch(
                  value: _paymentCash,
                  onChanged: (value) {
                    setState(() {
                      _paymentCash = value;
                    });
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.g_translate),
                title: Text('Bahasa'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Tampilkan pengaturan bahasa
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Pemberitahuan'),
                trailing: Switch(
                  value: _notificationEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationEnabled = value;
                    });
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.speed),
                title: Text('Unit'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Tampilkan pengaturan unit
                },
              ),
              ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('Tampilan Harga'),
                trailing: Switch(
                  value: _showPrices,
                  onChanged: (value) {
                    setState(() {
                      _showPrices = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveSettings,
                  child: Text(
                    'Simpan Pengaturan',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
