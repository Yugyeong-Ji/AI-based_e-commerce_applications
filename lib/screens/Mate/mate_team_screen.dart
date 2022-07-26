import 'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

var description = [
  '현재 팀 구성 현황입니다.'
];

class mateTeamScreen extends StatelessWidget {
  const mateTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width*0.6;
    return Scaffold(
      body:ListView.builder(
          itemCount: 3,
          //teamList.length,
          itemBuilder: (context, index){
            return Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            '아아아',
                           //teamList[index],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                                description[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500]
                            ),
                            ),
                          )
                        ],
                      ),
                  ),
                ],
              ),
            );
          },
      ),
    );
  }
}
class Team {
  String title;
  String date;
  int participants;

  Team(this.title, this.date, this.participants);
}
// final teamList = List<Team>(
//
// );

/*class teamTile extends StatelessWidget {
  teamTile(this._team);

  final Team _team;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: Icon(Icons.person),
      title: Text(_team.title),
      subtitle: Text("${_team.date}까지 배송 총${_team.participants}명 참여중"),
    );
  }
}
*/
/*class UsingBuilderListConstructing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
        itemCount: team.length,
        itemBuilder: (BuildContext context, int index)
    );
  }
}
*/

/*
Widget buildTeamCard(Team team) {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          //Image.asset(recipe.imageUrl!),
          const SizedBox(height: 10.0,),
          Text(team.title,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, fontFamily: 'palatino'),
          ),
        ],
      ),
    ),
  );
}
*/