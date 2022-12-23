import 'package:flutter/material.dart';

class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(130, 198, 149, 1),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.count(
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('Prof. Dr. Iskandar Fitri, S.T, M.T',
                    'assets/images/dosen/Prof-Is.jpg', 'See All', context),
                _buildCard('Dr. Septi Andryana, S.Kom, MMSI',
                    'assets/images/dosen/bu seprti.jpg', 'See All', context),
                _buildCard('Dr. Ucuk Darusalam, M.T, S.T',
                    'assets/images/dosen/Pak-Ucuk-.jpg', 'See All', context),
                _buildCard('Dr. Fauziah, S.Kom, MMSI',
                    'assets/images/dosen/bu fauziah.jpg', 'See All', context),
                _buildCard('PDr. Agung Triayudi, S.Kom., M.Kom',
                    'assets/images/dosen/pak agung.jpg', 'See All', context),
                _buildCard('Aris Gunaryati, S.Si, MMSI',
                    'assets/images/dosen/buaris.jpg', 'See All', context),
                _buildCard('Agus Iskandar, S.Kom, M.Kom',
                    'assets/images/dosen/Pak-Agus.jpg', 'See All', context),
                _buildCard('Andrianingsih, S.Kom, MMSI',
                    'assets/images/dosen/Bu-Andri-.jpg', 'See All', context),
                _buildCard('Albaar Rubhasy, S.Si, MTI',
                    'assets/images/dosen/Pak-Albaar.jpg', 'See All', context),
                _buildCard('Ira Diana Sholihati, S.Si, MMSI',
                    'assets/images/dosen/Bu-Ira-3.jpg', 'See All', context),
                _buildCard('Rima Tamara Aldisa, S.Kom., M.Kom',
                    'assets/images/dosen/bu rima.jpg', 'See All', context),
                _buildCard('Yunan Fauzi Wijaya, S.Kom., MMSI',
                    'assets/images/dosen/pak yunan.jpg', 'See All', context),
                _buildCard('Nurhayati, S.Si., MTI',
                    'assets/images/dosen/bu nur.jpg', 'See All', context),
                _buildCard('Ratih Titi Komalasari, S.T., M.M., MMSI',
                    'assets/images/dosen/Bu-Ratih.jpg', 'See All', context),
                _buildCard('H. Benrahman, B.Sc, S.Kom, MMSI',
                    'assets/images/dosen/Pak-Ben.jpg', 'See All', context),
                _buildCard('Eri Mardiani, S.Kom., M.Kom',
                    'assets/images/dosen/bu eri.jpg', 'See All', context),
                _buildCard('Sigit Wijanarko, S.T., M.Kom',
                    'assets/images/dosen/pa Sigit.jpg', 'See All', context),
                _buildCard('Ahmad Rifqi, S.Kom, MMSI',
                    'assets/images/dosen/pak-rifky.jpg', 'See All', context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(String name, String imgPath, String seeall, context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5)
              ],
              color: Colors.white38),
          child: Column(
            children: [
              SizedBox(
                height: 7,
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 180,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.contain),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Varela',
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      seeall,
                      style: TextStyle(
                          color: Colors.black38,
                          fontFamily: 'Varela',
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Colors.black38,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
