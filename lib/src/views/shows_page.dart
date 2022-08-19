import 'package:agenda/src/views/historico_shows_page.dart';
import 'package:agenda/src/widgets/state_management.dart';
import 'package:flutter/material.dart';
import '../controllers/show_controller.dart';

class ShowsPage extends StatefulWidget {
  const ShowsPage({super.key});

  @override
  State<ShowsPage> createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage> {
  final controller = ShowController();

  @override
  void initState() {
    super.initState();
    controller.start(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shows Integrantes de Narnia',
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepOrange),
                child: Image(
                  image: AssetImage('assets/images/capaIN.jpg'),
                  fit: BoxFit.cover,
                  width: 300,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Histórico de Shows'),
                subtitle: const Text("Shows já realizados"),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const HistoricoShowsPage(),
                      ));
                },
              )
            ],
          ),
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
