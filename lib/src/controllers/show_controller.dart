import 'package:flutter/material.dart';

import '../models/show.dart';
import '../repositories/show_repository.dart';

class ShowController {
  List<Show> shows = [];
  final repository = ShowRepository();
  final state = ValueNotifier<ShowState>(ShowState.start);

  Future start(bool load) async {
    if (load) {
      state.value = ShowState.loading;
    }

    try {
      shows = await repository.fetchShow();
      state.value = ShowState.success;
    } catch (e) {
      shows.add(Show(
          cache: 0,
          contratante: Contratante(
              nome: e.toString(),
              bairro: '',
              cidade: '',
              id: '',
              logradouro: '',
              numero: 0),
          dataHora: DateTime.now()));
      state.value = ShowState.success;
    }
  }

  Future buscarHistorico() async {
    state.value = ShowState.loading;
    try {
      shows = await repository.fetchShowHistorico();
      state.value = ShowState.success;
    } catch (e) {
      //state.value = HomeState.error;
      shows.add(Show(
          cache: 0,
          contratante: Contratante(
              nome: e.toString(),
              bairro: '',
              cidade: '',
              id: '',
              logradouro: '',
              numero: 0),
          dataHora: DateTime.now()));
      state.value = ShowState.success;
    }
  }
}

enum ShowState { start, loading, success, error, log }
