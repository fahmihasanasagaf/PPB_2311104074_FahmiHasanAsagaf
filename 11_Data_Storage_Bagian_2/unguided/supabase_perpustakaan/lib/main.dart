import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://pxiqbghphqolgmvtckru.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB4aXFiZ2hwaHFvbGdtdnRja3J1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0NTQ0MDgsImV4cCI6MjA3OTAzMDQwOH0.d7Y-FjMuQPYHsmA8Ic53WbMCxfvRA6hMkzozHhceCSc',
  );

  runApp(const MyApp());

  fetchData(); // ambil data
}

Future<void> fetchData() async {
  final data = await Supabase.instance.client
      .from('perpustakaan')
      .select();

  print(data);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Cek terminal output'),
        ),
      ),
    );
  }
}
