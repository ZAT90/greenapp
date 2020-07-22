import 'package:flutter/material.dart';
import 'package:greenapp/models/people.dart';
import 'package:greenapp/provider/peopleProvider.dart';
import 'package:greenapp/screens/details.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final peoples = PeopleProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Peoples'),
      ),
      body: StreamBuilder<People>(
          stream: peoples.fetchAllPeople(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            }
            List<Data> peopleList = snapshot.data.data;
            return Container(
                color: Colors.blueGrey,
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: peopleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PeopleDetail(
                                  detailData: peopleList[index],
                                  allPeopleData: peopleList,
                                ),
                              )),
                          leading: FutureBuilder<dynamic>(
                              future:
                                  checkImageRes(peopleList[index].profileImage),
                              builder: (context, snapshot) {
                                return CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    snapshot.data != null
                                        ? snapshot.data
                                        : 'https://i.stack.imgur.com/l60Hf.png',
                                  ),
                                );
                              }),
                          title: Text(
                              '${peopleList[index].firstName} ${peopleList[index].lastName}'),
                          subtitle: Text('${peopleList[index].employeeAge}'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                      );
                    }));
          }),
    );
  }
}

checkImageRes(String imgUrl) async {
  if (imgUrl.isEmpty) {
    return 'https://i.stack.imgur.com/l60Hf.png';
  }
  final response = await http.head(imgUrl);
  if (response.statusCode == 200) {
    return imgUrl;
  }
  return 'https://i.stack.imgur.com/l60Hf.png';
}
