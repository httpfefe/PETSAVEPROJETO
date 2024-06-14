import 'package:city/pages/dados_cadastrais.dart';
import 'package:city/pages/home_page.dart';
import 'package:city/shared/image/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  //ao inves de variaves, usamos o texteditingcontroller para salvar oq foi digitado no input
  TextEditingController senhaController = TextEditingController();
  String errorMsg = '';

  String? validadeLogin(String? value) {
    if (emailController.text.isEmpty) {
      return 'entre com um valido';
    }
    if (senhaController.text.isEmpty) {
      return 'uma senha valida';
    }

    return null;
  }

  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/PETSAVE.png',
                        width: 250,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Ja tem uma conta?',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: darkGreyColor),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: emailController,
                      onChanged: (value) {
                        print(value);
                      },
                      style: const TextStyle(color: darkGreyColor),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: -5), // faz com que o intText fique alinhado
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ligthCoral,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ligthCoral,
                          )),
                          hintText: "Email",
                          hintStyle: TextStyle(color: darkGreyColor),
                          prefixIcon: Icon(
                            Icons.person,
                            color: ligthCoral,
                          )),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                      controller: senhaController,
                      obscureText: isObscureText,
                      onChanged: (value) {
                        print(senhaController);
                      },
                      style: const TextStyle(color: darkGreyColor),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: -5),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ligthCoral,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: ligthCoral,
                        )),
                        hintText: "senha",
                        hintStyle: const TextStyle(color: darkGreyColor),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: ligthCoral,
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 400,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(ligthCoral),
                    ),
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          emailController.text.contains('@') &&
                          senhaController.text.isNotEmpty) {
                        //pushreplacement pois nao pdoe voltar para a page de login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                        return print('fd');
                      } else {
                        print('login nao efetuado');
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 400,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(midleLightGreyColor),
                    ),
                    onPressed: () {
                      //pushreplacement pois nao pdoe voltar para a page de login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DadosCadastrais(),
                        ),
                      );
                    },
                    child: const Text(
                      "Cadastre-se",
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
