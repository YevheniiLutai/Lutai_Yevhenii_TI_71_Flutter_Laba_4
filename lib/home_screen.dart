import 'package:flutter/material.dart';
import 'person.dart';
import 'person_network_service.dart';

class HomeScreenDemo extends StatefulWidget {
  static String routeName = 'home_screen';

  @override
  _HomeScreenDemoState createState() => _HomeScreenDemoState();
}
class _HomeScreenDemoState extends State<HomeScreenDemo> {
  final PersonNetworkService personService = PersonNetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://picsum.photos/200/300/?blur"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: FutureBuilder(
            future: personService.fetchPersons(100),
            builder:
                (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Card(
                          color: Colors.black.withOpacity(0.5),
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentPerson = snapshot.data[index];

                                return ListTile(
                                  title: Text(currentPerson.name),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(currentPerson.imageUrl),
                                  ),
                                  subtitle: Text(
                                      "Phone: ${currentPerson.phoneNumber}"),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                );
              }

              if (snapshot.hasError) {
                return Center(
                    child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 82.0,
                ));
              }

              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Loading at the moment, please hold the line.")
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
