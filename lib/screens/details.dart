import 'package:flutter/material.dart';
import 'package:greenapp/models/people.dart';
import 'dart:convert';

class PeopleDetail extends StatefulWidget {
  final Data detailData;
  final List<Data> allPeopleData;
  PeopleDetail(
      {Key key, @required this.detailData, @required this.allPeopleData})
      : super(key: key);
  @override
  _PeopleDetailState createState() => _PeopleDetailState();
}

class _PeopleDetailState extends State<PeopleDetail> {
  @override
  Widget build(BuildContext context) {
    print('all people list: ' + widget.allPeopleData.toString());
    List<Data> findLeader = [];
    if (!widget.detailData.isTeamLead) {
      findLeader = widget.allPeopleData
          .where((allppl) =>
              allppl.jobTitleName == widget.detailData.jobTitleName &&
              allppl.isTeamLead &&
              allppl.employeeCode != widget.detailData.employeeCode)
          .toList();
    } else {
      if (widget.detailData.jobTitleName != 'General Manager') {
        findLeader = widget.allPeopleData
            .where((allppl) => allppl.jobTitleName == 'General Manager')
            .toList();
      } else {
        //findLeader =
      }
    }
    print('isLeader: ' + widget.detailData.isTeamLead.toString());
    //  print('findleader ' + findLeader[0].firstName);
    return Scaffold(
      appBar: AppBar(
        title: Text('details'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            peopleDetails(
                'Duties',
                widget.detailData.duties.isEmpty
                    ? 'N/A'
                    : widget.detailData.duties),
            SizedBox(
              height: 10,
            ),
            peopleDetails('Email address', widget.detailData.emailAddress),
            SizedBox(
              height: 10,
            ),
            peopleDetails('Age', widget.detailData.employeeAge),
            SizedBox(
              height: 10,
            ),
            peopleDetails('Code', widget.detailData.employeeCode),
            SizedBox(
              height: 10,
            ),
            peopleDetails('First Name', widget.detailData.firstName),
            SizedBox(
              height: 10,
            ),
            peopleDetails('Last Name', widget.detailData.lastName),
            SizedBox(
              height: 10,
            ),
            peopleDetails('Job Title', widget.detailData.jobTitleName),
            SizedBox(
              height: 10,
            ),
            peopleDetails('Phone Number', widget.detailData.phoneNumber),
            SizedBox(
              height: 10,
            ),
            findLeader.length > 0
                ? peopleDetails('Reporting To',
                    '${findLeader[0].firstName} ${findLeader[0].lastName}')
                : Container(),
          ],
        ),
      ),
    );
  }

  Row peopleDetails(String heading, String detail) {
    print(detail.startsWith('['));
    if (detail.startsWith('[')) {
      List<String> dutiesList = detail.split(",");
      print('dutiesList' + dutiesList.toString());
    }

    return Row(
      children: <Widget>[
        Text(
          '$heading: ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          detail,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
