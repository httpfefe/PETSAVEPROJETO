import 'package:city/pages/cadastro_novo_pet.dart';
import 'package:flutter/material.dart';

import '../../pages/dados_pet.dart';
import '../../pages/dados_tutor.dart';
import '../../pages/login_page.dart';
import '../../pages/termos_de_uso.dart';
import 'colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //componente que cria tipo um containter com os dados inseridos ans propriedades
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  context: context,
                  builder: (BuildContext context) {
                    return Wrap(children: [
                      Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: const Text('camera'),
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.camera_alt_outlined)),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: const Text('album'),
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.album_rounded)),
                          ),
                        ],
                      )
                    ]);
                  });
            },
            child: const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: ligthCoral),
              currentAccountPicture: CircleAvatar(
                backgroundColor: whiteColor,
                radius: 55,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/perfiltutor.png"),
                ),
              ),
              accountName: Text("Nome do tutor"),
              accountEmail: Text(""),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DadosTutor(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.person_2_rounded),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: const Text(
                      'Dados do tutor',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DadosTutor(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DadosPet(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.pets),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: const Text(
                      'Dados do Pet',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DadosPet(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CadastroNovoPet(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.pets),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: const Text(
                      'Cadastrar novo Pet',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroNovoPet(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermosDeUso(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.info_outlined),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: const Text(
                      'Termos de uso ',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermosDeUso(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.exit_to_app_rounded),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: whiteColor,
                              alignment: Alignment.centerLeft,
                              elevation: 8,
                              title: const Wrap(children: [
                                Text(
                                  'Sair',
                                )
                              ]),
                              content: const Text(
                                'Deseja sair do app?',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage())); //usuario retorna á tela de login
                                      },
                                      child: const Text(
                                        'Sair',
                                        style: TextStyle(
                                            fontSize: 16, color: darkGreyColor),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Voltar',
                                        style: TextStyle(
                                            fontSize: 16, color: darkGreyColor),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'Sair',
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
