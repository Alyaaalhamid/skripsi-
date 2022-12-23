import 'package:skripsi/distribusi/model.dart';

class DistribusiModel extends Model {
  static String table = 'matkul';
  int? id;
  String? Nilai;
  String nama;
  String? ket;
//nilai
  DistribusiModel({
    this.id,
    required this.nama,
    this.Nilai,
    //this.nilai,
    this.ket,
  });

  // DistribusiModel.map(dynamic obj) {
  //   this.nama = obj['nama'];
  //   this.nilai = obj['nilai'];
  //   this.ket = obj['ket'];
  //   this.createdAt = obj['createdAt'];
  //   this.updatedAt = obj['updatedAt'];
  // }

  // String? get _nama => nama;
  // String? get _nilai => nilai;
  // String? get _ket => ket;
  // String? get _createdAt => createdAt;
  // String? get _updatedAt => updatedAt;
  static DistribusiModel fromMap(Map<String, dynamic> json) {
    return DistribusiModel(
      id: json['id'],
      nama: json['nama'].toString(),
      Nilai: json['nilai'],
      //nilai: json['nilai'].toString(),
      ket: json['keterangan'],
    );
  }
  // Map<String, dynamic> toMap() {
  //   var map = Map<String, dynamic>();

  //   map['nama'] = nama;
  //   map['nilai'] = nilai;
  //   map['ket'] = ket;
  //   map['createdAt'] = createdAt;
  //   map['updatedAt'] = updatedAt;

  //   return map;
  // }

  // void setMatkuld(int id) {
  //   this.id = id;
  // }
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'nama': nama,
      'nilai': Nilai,
      //'nilai': nilai,
      'keterangan': ket,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}


// List<DistribusiModel> nama = [
//     'name': 'Algoritma dan Pemrograman I'
//     'name': 'Aljabar Linier'
//     'name': 'Kalkulus I'
//     'name': 'Pengantar Teknologi Komunikasi dan Informatika'
//     'name': 'TIK dan Masyarakat'
//     'name': 'Pendidikan Kewarganegaraan'
//     'name': 'Bahasa Indonesia'
//     'name': 'Bahasa Inggris'
//     'name': 'Algoritma dan Pemrograman II'
//     'name': 'Kalkulus II'
//     'name': 'Komunikasi Data dan Jaringan Komputer'
//     'name': 'Matematika Diskrit'
//     'name': 'Pemrograman Web'
//     'name': 'Pendidikan Agama'
//     'name': 'Pendidikan Pancasila'
//     'name': 'Arsitektur dan Organisasi Komputer'
//     'name': 'Basis Data'
//     'name': 'Kecerdasan Artifisial'
//     'name': 'Perancangan dan Analisis Algoritma'
//     'name': 'Sistem Digital'
//     'name': 'Statistika dan Probabilitas'
//     'name': 'Struktur Data dan Algoritma'
//     'name': 'Automata dan Kompilasi'
//     'name': 'Interaksi Manusia dan Komputer'
//     'name': 'Machine Learning'
//     'name': 'Metode Numerik'
//     'name': 'Mobile Programming'
//     'name': 'Rekayasa Perangkat Lunak'
//     'name': 'Data Science'
//     'name': 'Manajemen Proyek'
//     'name': 'Pemrograman Game'
//     'name': 'Pengolahan Citra'
//     'name': 'Sistem Operasi'
//     'name': 'Kewirausahaan'
//     'name': 'Olahraga/Seni'
//     'name': 'Konservasi Alam dan Lingkungan'
//     'name': 'Pendidikan Anti Korupsi'
//     'name': 'Algoritma Paralel'
//     'name': 'Augmented and Virtual Reality'
//     'name': 'Cloud Computing'
//     'name': 'Keamanan Siber'
//     'name': 'Kriptografi'
//     'name': 'Simulasi dan Pemodelan'
//     'name': 'Kerja Praktek'
//     'name': 'Deep Learning'
//     'name': 'Etika Profesi Teknologi Informasi'
//     'name': 'Natural Language Processing'
//     'name': 'Sistem Terdistribusi'
//     'name': 'Metodologi Penelitian'
//     'name': 'ICT Technopreneurship and Leadership'
//     'name': 'Internet of Things'
//     'name': 'Skripsi'

// ];