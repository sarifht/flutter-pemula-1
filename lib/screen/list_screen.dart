import 'package:flutter/material.dart';
import 'package:pemulafluttersarif_1/data/data_wisata.dart';
import 'package:pemulafluttersarif_1/screen/detail_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 91, 66, 1),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //headersection
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Halo, Pengunjung",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Selamat Datang di Kabupaten Lebak",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //body section
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        backgroundColor: const Color.fromARGB(255, 0, 150, 191),
        onClosing: () {},
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * .8,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                lokasiWisata.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(data: lokasiWisata[index]),
                        ),
                      );
                    },
                    isThreeLine: true,
                    contentPadding: const EdgeInsets.all(0),
                    leading: Hero(
                      tag: lokasiWisata[index]['image'],
                      child: Container(
                        height: 100,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(lokasiWisata[index]['image']),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      lokasiWisata[index]['title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18), // h1 style
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        text: lokasiWisata[index]['deskrip'].length > 100
                            ? '${lokasiWisata[index]['deskrip'].substring(0, 150)}...'
                            : lokasiWisata[index]['deskrip'],
                        children: [
                          TextSpan(
                            text: ' Lebih Lanjut',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
