import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controllers/show_controller.dart';

class StateManagement extends StatefulWidget {
  final ShowController controller;
  const StateManagement(this.controller, {super.key});

  @override
  State<StateManagement> createState() => _StateManagementState();
}

class _StateManagementState extends State<StateManagement> {
  @override
  Widget build(BuildContext context) {
    return stateManagement(widget.controller.state.value);
  }

  stateManagement(ShowState state) {
    switch (state) {
      case ShowState.start:
        return _start();
      case ShowState.loading:
        return _loading();
      case ShowState.success:
        return _success();
      case ShowState.error:
        return _error();
      default:
        return _start();
    }
  }

  _success() {
    return ListView.builder(
      itemCount: widget.controller.shows.length,
      itemBuilder: (context, index) {
        var show = widget.controller.shows[index];
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
          setState(() {
            widget.controller.start(true);
          });
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
}
