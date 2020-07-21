import 'package:flutter/material.dart';
import 'package:greenapp/bloc/peopleBloc.dart';
import 'package:greenapp/models/people.dart';
import 'package:greenapp/provider/peopleProvider.dart';
import 'package:greenapp/screens/details.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final peoples = PeopleProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: StreamBuilder<People>(
          stream: peoples.fetchAllPeople(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            }
            List<Data> peopleList = snapshot.data.data;
            return Center(
                child: ListView.builder(
                    itemCount: peopleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PeopleDetail(detailData: peopleList[index], allPeopleData: peopleList,),
                            )),
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            peopleList[index].profileImage,
                          ),
                        ),
                        title: Text(
                            '${peopleList[index].firstName} ${peopleList[index].lastName}'),
                        subtitle: Text('${peopleList[index].employeeAge}'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      );
                    }));
          }),
    );
  }
}
