import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MahasiswaPage(),
      routes: {
        '/detail': (context) => DetailPage(),
      },
    );
  }
}

class MahasiswaPage extends StatelessWidget {
  final List<Map<String, String>> mahasiswaNYA = [
    {
      "nama": "Ignasius Yoga Puji",
      "nim": "F12202200057",
      "ipk": "3.9",
      "fotoUrl":
          "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?crop=faces&fit=crop&w=100&h=100"
    },
    {
      "nama": "Dian Restu Adji",
      "nim": "F12202200056",
      "ipk": "3.99",
      "fotoUrl":
          "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?crop=faces&fit=crop&w=100&h=100"
    },
    {
      "nama": "Mukhamamd Shaunan",
      "nim": "F12202200070",
      "ipk": "4.3",
      "fotoUrl":
          "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?crop=faces&fit=crop&w=100&h=100"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aplikasi SiUdin'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Debugging: Log pesan pencarian
              print('Fitur pencarian diakses');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Daftar Mahasiswa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mahasiswaNYA.length,
              itemBuilder: (context, index) {
                final mahasiswa = mahasiswaNYA[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.network(mahasiswa["fotoUrl"]!),
                    title: Text(mahasiswa["nama"]!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(mahasiswa["nim"]!),
                        Text("IPK: ${mahasiswa["ipk"]}"),
                      ],
                    ),
                    onTap: () {
                      // Navigasi ke halaman detail dengan data mahasiswa
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: mahasiswa,
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Debugging: Print semua data mahasiswa
                print('Data mahasiswa: $mahasiswaNYA');
              },
              child: Text('Print'),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mahasiswa =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(mahasiswa["nama"]!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(mahasiswa["fotoUrl"]!),
            SizedBox(height: 16),
            Text(
              "Nama: ${mahasiswa["nama"]}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("NIM: ${mahasiswa["nim"]}"),
            Text("IPK: ${mahasiswa["ipk"]}"),
          ],
        ),
      ),
    );
  }
}
