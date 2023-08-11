import 'package:flutter/material.dart';

class TravelApp extends StatefulWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form Pemesanan'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Pemesanan'),
              Tab(text: 'Selesai'),
              Tab(text: 'Dibatalkan'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            BookingTabPage(title: 'Pemesanan'),
            SelesaiTabPage(title: 'Selesai'),
            DibatalkanTabPage(title: 'Dibatalkan'),
          ],
        ),
      ),
    );
  }
}

class BookingTabPage extends StatefulWidget {
  final String title;

  const BookingTabPage({Key? key, required this.title}) : super(key: key);

  @override
  State<BookingTabPage> createState() => _BookingTabPageState();
}

class _BookingTabPageState extends State<BookingTabPage> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Pilih Jenis Pemesanan',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'Hotel', child: Text('Hotel')),
              DropdownMenuItem(
                  value: 'Penerbangan', child: Text('Penerbangan')),
            ],
            onChanged: (value) {
              // Lakukan tindakan saat jenis pemesanan dipilih
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Tanggal Keberangkatan',
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            controller: TextEditingController(
              text: _selectedDate != null
                  ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                  : '',
            ),
            onTap: () {
              _selectDate(context);
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Lakukan tindakan saat tombol ditekan
                // Misalnya, simpan pemesanan ke database
              },
              child: const Text(
                'Pesan Sekarang',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelesaiTabPage extends StatelessWidget {
  final String title;

  const SelesaiTabPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(0.0),
      // Atur warna latar belakang container
      child: Column(children: [
        Container(
          color: const Color.fromARGB(255, 131, 210, 249),
          width: screenWidth,
          padding: EdgeInsetsDirectional.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // spacing: 8, // Jarak horizontal antar elemen
            // runSpacing: 8, // Jarak vertikal antar baris
            children: [
              TabOption(
                icon: Icons.hotel,
                label: 'HOTEL',
              ),
              TabOption(
                icon: Icons.flight,
                label: 'TIKET',
              ),
              TabOption(
                icon: Icons.access_time_rounded,
                label: 'AKTIVITAS',
              ),
            ],
          ),
        ),
        Image.asset("assets/images/rumah pemesanan.png"),
        Text("Anda Belum Melakukan Pemesanan")
      ]),
    );
  }
}

class TabOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const TabOption({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 15, 0, 0),
      child: Container(
        width: 150,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              child: Icon(
                icon,
                color: Theme.of(context).textTheme.bodyText1!.color,
                size: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DibatalkanTabPage extends StatelessWidget {
  final String title;

  const DibatalkanTabPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(0.0),
      // Atur warna latar belakang container
      child: Column(children: [
        Container(
          color: const Color.fromARGB(255, 131, 210, 249),
          width: screenWidth,
          padding: EdgeInsetsDirectional.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // spacing: 8, // Jarak horizontal antar elemen
            // runSpacing: 8, // Jarak vertikal antar baris
            children: [
              TabOption(
                icon: Icons.hotel,
                label: 'HOTEL',
              ),
              TabOption(
                icon: Icons.flight,
                label: 'TIKET',
              ),
              TabOption(
                icon: Icons.access_time_rounded,
                label: 'AKTIVITAS',
              ),
            ],
          ),
        ),
        Image.asset("assets/images/rumah pemesanan.png"),
        Text("Anda Belum Melakukan Pembatalan Pemesanan")
      ]),
    );
  }
}

class TabOptionBatal extends StatelessWidget {
  final IconData icon;
  final String label;

  const TabOptionBatal({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 15, 0, 0),
      child: Container(
        width: 150,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              child: Icon(
                icon,
                color: Theme.of(context).textTheme.bodyText1!.color,
                size: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
