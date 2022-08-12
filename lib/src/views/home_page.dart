import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _success() {
    return ListView.builder(
      itemCount: controller.shows.length,
      itemBuilder: (context, index) {
        var show = controller.shows[index];
        final dateFormat = DateFormat('dd/MM');
        final hourFormat = DateFormat('HH:mm');
        return Center(
          child: Card(
            color: Colors.grey[100],
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ListTile(
                    leading: Column(
                      children: [
                        Text(dateFormat.format(show.dataHora!),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                        Text(hourFormat.format(show.dataHora!),
                            style: const TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic)),
                      ],
                    ),
                    title: Text(show.contratante!.nome!),
                    subtitle: Text(
                        '${show.contratante!.logradouro}, ${show.contratante!.numero}\r\n${show.contratante!.bairro} - ${show.contratante!.cidade}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('Cachê: ${show.cache}')],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start(true);
        },
        child: const Text("Tentar novamente"),
      ),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shows Integrantes de Narnia'),         
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.start(false),
          child: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return stateManagement(controller.state.value);
            },
          ),
        ));
  }
}
