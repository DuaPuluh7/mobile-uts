import 'package:flutter/material.dart';

class Informasi extends StatelessWidget {
  const Informasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Informasi Developer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Center(
        child: Card(
          color: Colors.grey[500],
          elevation: 8.0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            height: 200,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://webstockreview.net/images/male-clipart-professional-man-3.jpg',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          width: 150,
                          color: Colors.white, // Ubah warna latar belakang menjadi putih
                          height: 2,
                        ),
                        const SizedBox(height: 4),
                        Text('152021176', style: TextStyle(fontFamily: 'Poppins', color: Colors.white)), // Ubah warna teks menjadi putih
                        Text('Pemrograman Mobile', style: TextStyle(fontFamily: 'Poppins', color: Colors.white)), // Ubah warna teks menjadi putih
                        Text('UTS', style: TextStyle(fontFamily: 'Poppins', color: Colors.white)), // Ubah warna teks menjadi putih
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Muhammad Farhan',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ubah warna teks menjadi putih
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
