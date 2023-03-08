import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectionSystem extends StatelessWidget {
  InternetConnectionSystem({super.key});

  Connectivity connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Internet Connectivity Checker')),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<ConnectivityResult>(
        stream: connectivity.onConnectivityChanged,
        builder: (_, snapshot) {
          return InternetConnectionWidget(
              snapshot: snapshot,
              // widget: const Text('Connected'),
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Icon(
                      Icons.wifi_rounded,
                      size: 46,
                      color: Colors.red,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Connected',
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}

class InternetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;
  const InternetConnectionWidget(
      {super.key, required this.snapshot, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Icon(
                    Icons.wifi_off_rounded,
                    size: 52,
                    color: Colors.red,
                  ),
                ),
                const Center(
                  child: Text(
                    'No Internet',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
                ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title: Text('Data'),
                      );
                    })
              ],
            );
          default:
            return widget;
        }
      default:
        return const Text('');
    }
  }
}
