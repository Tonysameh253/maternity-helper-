import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class Doctor {
  final String name;
  final String address;

  Doctor({required this.name, required this.address});

  factory Doctor.fromMap(Map<String, dynamic> data) {
    return Doctor(
      name: data['name'] ?? '',
      address: data['address'] ?? '',
);
}
}


class DoctorListPage extends StatelessWidget {
  final CollectionReference doctors = FirebaseFirestore.instance.collection('doctors');

   DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: doctors.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              final doctor = Doctor.fromMap(data.docs[index].data() as Map<String, dynamic>);
              return ListTile(
                title: Text(doctor.name),
                subtitle: Text(doctor.address),
              );
            },
          );
        },
     ),
);
}
}