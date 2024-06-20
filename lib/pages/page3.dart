import 'dart:convert';
import 'package:city/shared/image/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  TextEditingController searchController = TextEditingController();
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 35, left: 13, right: 15, bottom: 10),
            decoration: const BoxDecoration(
              color: Colors.grey, // Defina a cor desejada para a barra de busca
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 5, bottom: 20),
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  // Implementar a lógica de busca conforme necessário
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Pesquise aqui",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: const Icon(
                    Icons.pets,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: petsList.length,
                    itemBuilder: (context, index) {
                      final pet = petsList[index];
                      return ListTile(
                        title: Container(
                          decoration: BoxDecoration(
                              color: ligthCoral,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(pet['name']),
                          ),
                        ),
                        subtitle: Text('Age: ${pet['age']}'),
                        // Personalize conforme as informações do pet disponíveis
                      );
                    },
                  ),
          ),
          const Divider(
            color: midleDarkGreyColor,
          )
        ],
      ),
    );
  }
}
