import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'bluetooth_page.dart';
import 'ldr_luces_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  BluetoothConnection? _connection;
  bool _isConnecting = false;
  BluetoothDevice? _deviceConnected;

  bool movimiento = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _receiveData();
  }

  void _setConnection(BluetoothConnection connection, BluetoothDevice device) {
    setState(() {
      _connection = connection;
      _deviceConnected = device;
      _isConnecting = false;
    });
  }

  void _clearConnection() {
    setState(() {
      _connection = null;
      _deviceConnected = null;
      _isConnecting = false;
    });
  }

  //Modificaciones reciente inicio
  dynamic _receiveData() {
    _connection?.input?.listen((event) {
      if (String.fromCharCodes(event) == "p1") {
        setState(() => movimiento = true);
      }
      if (String.fromCharCodes(event) == "p0") {
        setState(() => movimiento = false);
      }
    });
  }

  //Fin de modificaciones

  void _sendData(String data) {
    if (_connection?.isConnected ?? false) {
      _connection?.output.add(ascii.encode(data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            BluetoothPage(
              connection: _connection,
              isConnecting: _isConnecting,
              deviceConnected: _deviceConnected,
              setConnection: _setConnection,
              clearConnection: _clearConnection,
            ),
            LdrLucesPage(
              sendData: _sendData,
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 1, 36, 65),
          child: TabBar(
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.amber,
            indicatorWeight: 5.0,
            dividerColor: Colors.amber,
            controller: _tabController,
            tabs: const [
              Tab(
                  icon: Icon(
                    Icons.bluetooth,
                    color: Colors.white,
                  ),
                  text: 'Bluetooth'),
              Tab(
                  icon: Icon(
                    Icons.lightbulb,
                    color: Colors.white,
                  ),
                  text: 'Luces'),
            ],
          ),
        ),
      ),
    );
  }
}
