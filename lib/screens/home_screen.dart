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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            children: [
              Column(
                children: [Text("Olá Erika!"), Text("Bem vinda ao EcoTrack")],
              ),
              Column(
                children: [
                  Text("Resumo"),
                  Row(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Icon(Icons.recycling), Text("38")],
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.safety_check),
                                  Text("40"),
                                ],
                              ),
                              Text("Pontos"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Ações Rápidas"),
                  Column(
                    children: [
                      Text("Registrar Coleta"),
                      Text("Pontos de Coleta"),
                      Text("Relatórios"),
                      Text("Histórico"),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Atividades Recentes"),
                  Column(
                    children: [
                      Text("Plástico Reciclado"),
                      Text("Papel Descartado"),
                      Text("Vidro Reciclado"),
                    ],
                  ),
                ],
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
            icon: Icon(Icons.list, color: Colors.black),
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
