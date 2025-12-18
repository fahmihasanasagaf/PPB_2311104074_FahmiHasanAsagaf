import 'package:flutter/material.dart';
import 'database_helper.dart';

class InputMahasiswaPage extends StatefulWidget {
  final Map<String, dynamic>? mahasiswa;

  const InputMahasiswaPage({Key? key, this.mahasiswa}) : super(key: key);

  @override
  _InputMahasiswaPageState createState() => _InputMahasiswaPageState();
}

class _InputMahasiswaPageState extends State<InputMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _alamatController = TextEditingController();
  final _hobiController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Jika dalam mode edit, isi form dengan data yang ada
    if (widget.mahasiswa != null) {
      _namaController.text = widget.mahasiswa!['nama'] ?? '';
      _nimController.text = widget.mahasiswa!['nim'] ?? '';
      _alamatController.text = widget.mahasiswa!['alamat'] ?? '';
      _hobiController.text = widget.mahasiswa!['hobi'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mahasiswa == null 
            ? 'Tambah Mahasiswa' 
            : 'Edit Mahasiswa'),
        backgroundColor: Colors.blue[700],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama harus diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _nimController,
                      decoration: InputDecoration(
                        labelText: 'NIM',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.confirmation_number),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'NIM harus diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _alamatController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.home),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat harus diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _hobiController,
                      decoration: InputDecoration(
                        labelText: 'Hobi',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.sports_esports),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Hobi harus diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _simpanData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              widget.mahasiswa == null ? 'Simpan' : 'Update',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _simpanData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        Map<String, dynamic> mahasiswa = {
          'nama': _namaController.text,
          'nim': _nimController.text,
          'alamat': _alamatController.text,
          'hobi': _hobiController.text,
        };

        if (widget.mahasiswa != null && widget.mahasiswa!['id'] != null) {
          // Update data yang sudah ada
          mahasiswa['id'] = widget.mahasiswa!['id'];
          await DatabaseHelper.updateMahasiswa(mahasiswa);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data berhasil diperbarui!')),
          );
        } else {
          // Tambah data baru
          await DatabaseHelper.insertMahasiswa(mahasiswa);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data berhasil disimpan!')),
          );
        }

        Navigator.pop(context, true);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Gagal menyimpan data')),
        );
        print('Error saving data: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _alamatController.dispose();
    _hobiController.dispose();
    super.dispose();
  }
}