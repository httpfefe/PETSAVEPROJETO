//custon d=rawimport 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../shared/image/colors.dart';

class DadosTutor extends StatefulWidget {
  const DadosTutor({super.key});

  @override
  State<DadosTutor> createState() => _DadosTutorState();
}

class _DadosTutorState extends State<DadosTutor> {
  List<dynamic> tutorList = [];
  bool isLoading = true;

  Future<void> getAllPets() async {
    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse('http://10.0.2.2:5185/v1/pets');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          tutorList = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          tutorList = [];
        });
        print('Failed to load pets. Status code: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        tutorList = [];
      });
      print('Error loading pets: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          "Perfil tutor",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ligthCoral,
                        borderRadius: BorderRadius.circular(20)),
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 130),
                    child: const CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 55,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/images/perfiltutor.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ricardo",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 460,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(20)),
                child: const Column(
                  children: [
                    ListTile(
                      //pet['name']
                      //'Age: ${pet['age']}'
                      title: Text('Nome'),
                      subtitle: Text('10'),
                    ),
                    Divider(
                      color: midleLightGreyColor,
                    ),
                    ListTile(
                      title: Text('Email'),
                      subtitle: Text('Nome'),
                    ),
                    Divider(
                      color: midleLightGreyColor,
                    ),
                    ListTile(
                      title: Text('Telefone'),
                      subtitle: Text('Nome'),
                    ),
                    Divider(
                      color: midleLightGreyColor,
                    ),
                    ListTile(
                      title: Text('Cidade/Estado'),
                      subtitle: Text('Nome'),
                    ),
                    Divider(
                      color: midleLightGreyColor,
                    ),
                    ListTile(
                      title: Text('Data de nascimento'),
                      subtitle: Text('Nome'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
