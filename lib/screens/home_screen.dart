import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EcoTrack"), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Olá Erika!", style: TextStyle(fontSize: 24)),
                    Text(
                      "Bem vinda ao EcoTrack",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Text("Resumo", style: TextStyle(fontSize: 24)),
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              key: Key("Coletas"),
                              color: Colors.white70,
                              child: SizedBox(
                                width: 75,
                                height: 75,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.recycling),
                                        Text("67"),
                                      ],
                                    ),
                                    Text("Coletas"),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              key: Key("Pontos"),
                              color: Colors.white70,
                              child: SizedBox(
                                width: 75,
                                height: 75,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star_rate_rounded),
                                        Text("340"),
                                      ],
                                    ),
                                    Text("Pontos"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ações Rápidas", style: TextStyle(fontSize: 24)),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            key: Key("registrarColeta"),
                            color: Colors.white70,
                            child: SizedBox(
                              width: double.infinity,
                              height: 35,
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  Text("Registrar coleta"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            key: Key("pontosColeta"),
                            color: Colors.white70,
                            child: SizedBox(
                              width: double.infinity,
                              height: 35,
                              child: Row(
                                children: [
                                  Icon(Icons.place),
                                  Text("Pontos de Coleta"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            key: Key("relatorios"),
                            color: Colors.white70,
                            child: SizedBox(
                              width: double.infinity,
                              height: 35,
                              child: Row(
                                children: [
                                  Icon(Icons.report),
                                  Text("Relatórios"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            key: Key("historico"),
                            color: Colors.white70,
                            child: SizedBox(
                              width: double.infinity,
                              height: 35,
                              child: Row(
                                children: [
                                  Icon(Icons.history),
                                  Text("Histórico"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Atividades Recentes", style: TextStyle(fontSize: 24)),
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              color: Colors.white70,
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.recycling),
                                        Text("+67 pts"),
                                      ],
                                    ),
                                    Text("Plástico Reciclado"),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white70,
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.api),
                                        Text("+41 pts"),
                                      ],
                                    ),
                                    Text("Plástico Reciclado"),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white70,
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.api),
                                        Text("+727 pts"),
                                      ],
                                    ),
                                    Text("Vidro Reciclado"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report, color: Colors.black),
            label: "Histórico",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place, color: Colors.black),
            label: "Locais",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
