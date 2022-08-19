import 'package:flutter/material.dart';
import '../controllers/show_controller.dart';
import '../widgets/state_management.dart';

class HistoricoShowsPage extends StatefulWidget {
  const HistoricoShowsPage({super.key});

  @override
  State<HistoricoShowsPage> createState() => _HistoricoShowsPageState();
}

class _HistoricoShowsPageState extends State<HistoricoShowsPage> {
  final controller = ShowController();

  @override
  void initState() {
    super.initState();
    controller.buscarHistorico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Histórico de Shows Realizados'),
        ),
        body: RefreshIndicator(
          onRefresh: () => _startRefresh(),
          child: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return StateManagement(controller);
            },
          ),
        ));
  }

  Future<void> _startRefresh() async {
    setState(() {
      controller.start(false);
    });
  }
}
