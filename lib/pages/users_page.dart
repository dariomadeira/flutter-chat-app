import 'package:chat/models/users_test.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    UsersTest(uid: '1', email: 'test1@test.com', name: 'María', online: true),
    UsersTest(uid: '2', email: 'test2@test.com', name: 'José', online: false),
    UsersTest(uid: '3', email: 'test3@test.com', name: 'Javier', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mi nombre",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black54,
          ), 
          onPressed: () {

          }
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            // child: Icon(
            //   Icons.check_circle,
            //   color: Colors.blue[400],
            // ),
            child: Icon(
              Icons.offline_bolt,
              color: Colors.red[400],
            ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        child: _listViewUsers(),
        onRefresh: _cargarUsuarios,
      ),
   );
  }

  ListView _listViewUsers() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]), 
      separatorBuilder: (_, i) => Divider(), 
      itemCount: usuarios.length,
    );
  }

  ListTile _usuarioListTile(UsersTest usuario) {
    return ListTile(
        title: Text(usuario.name),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          child: Text(usuario.name[0] + usuario.name[1]),
          backgroundColor: Colors.blue[100],
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red[500],
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }

  void _cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}