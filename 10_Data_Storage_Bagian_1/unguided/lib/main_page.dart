import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'input_mahasiswa_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> _daftarMahasiswa = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMahasiswa();
  }

  Future<void> _loadMahasiswa() async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      final data = await DatabaseHelper.getMahasiswa();
      setState(() {
        _daftarMahasiswa = data;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _tambahMahasiswa() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InputMahasiswaPage()),
    );
    
    if (result == true) {
      await _loadMahasiswa();
    }
  }

  void _editMahasiswa(Map<String, dynamic> mahasiswa) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputMahasiswaPage(mahasiswa: mahasiswa),
      ),
    );
    
    if (result == true) {
      await _loadMahasiswa();
    }
  }

  void _hapusMahasiswa(int id) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hapus Data'),
        content: Text('Apakah Anda yakin ingin menghapus data ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await DatabaseHelper.deleteMahasiswa(id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Data berhasil dihapus!')),
              );
              await _loadMahasiswa();
            },
            child: Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Mahasiswa'),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadMahasiswa,
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _daftarMahasiswa.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people_alt_outlined, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'Belum ada data mahasiswa',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tap + untuk menambah data',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _tambahMahasiswa,
                        child: Text('Tambah Data Pertama'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadMahasiswa,
                  child: ListView.builder(
                    itemCount: _daftarMahasiswa.length,
                    itemBuilder: (context, index) {
                      final mahasiswa = _daftarMahasiswa[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[100],
                            child: Text(
                              mahasiswa['nama'].toString().substring(0, 1).toUpperCase(),
                              style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            mahasiswa['nama'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              Text('NIM: ${mahasiswa['nim']}'),
                              SizedBox(height: 2),
                              Text('Alamat: ${mahasiswa['alamat']}'),
                              SizedBox(height: 2),
                              Text('Hobi: ${mahasiswa['hobi']}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _editMahasiswa(mahasiswa),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _hapusMahasiswa(mahasiswa['id']),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahMahasiswa,
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}