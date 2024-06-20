import 'dart:convert';

import 'package:flutter/material.dart';

import '../shared/image/colors.dart';
import 'package:http/http.dart' as http;

class DadosPet extends StatefulWidget {
  const DadosPet({super.key});

  @override
  State<DadosPet> createState() => _DadosPetState();
}

class _DadosPetState extends State<DadosPet> {
  List<dynamic> petsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllPets();
  }

  Future<void> getAllPets() async {
    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse('http://10.0.2.2:5185/v1/pets');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          petsList = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          petsList = [];
        });
        print('Failed to load pets. Status code: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        petsList = [];
      });
      print('Error loading pets: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var pet; //so para parar o erro
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          "Perfil Pet",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ligthCoral,
                        borderRadius: BorderRadius.circular(20)),
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 130),
                    child: const CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 55,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/pet.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Cazé",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 360,
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
                      title: Text('Raça'),
                      subtitle: Text('Nome'),
                    ),
                    Divider(
                      color: midleLightGreyColor,
                    ),
                    ListTile(
                      title: Text('Peso'),
                      subtitle: Text('Nome'),
                    ),
                    Divider(
                      color: midleLightGreyColor,
                    ),
                    ListTile(
                      title: Text('Idade'),
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
