import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MemberListPage(),
    );
  }
}

class MemberListPage extends StatelessWidget {
  final List<Member> members = [
    Member(name: 'Nicholas Febrian', nim: '32210094', birthDate: '17-02-2003'),
    Member(name: 'Reggy Unjaya', nim: '32210095', birthDate: '18-04-2003'),
    Member(name: 'Joezer Dovan', nim: '32210103', birthDate: '19-04-2004'),
    // Tambahkan anggota kelompok lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota Kelompok'),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(members[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailPage(member: members[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Member {
  final String name;
  final String nim;
  final String birthDate;

  Member({required this.name, required this.nim, required this.birthDate});
}

class MemberDetailPage extends StatelessWidget {
  final Member member;

  MemberDetailPage({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Anggota'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NIM: ${member.nim}'),
            Text('Tanggal Lahir: ${member.birthDate}'),
          ],
        ),
      ),
    );
  }
}
