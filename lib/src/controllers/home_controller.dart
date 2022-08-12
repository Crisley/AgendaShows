import 'package:flutter/material.dart';

import '../models/show.dart';
import '../repositories/show_repository.dart';

class HomeController {
  List<Show> shows = [];
  final repository = ShowRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  Future start(bool load) async {
    if (load){
      state.value = HomeState.loading;
    }
    
    try {
      shows = await repository.fetchShow();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
