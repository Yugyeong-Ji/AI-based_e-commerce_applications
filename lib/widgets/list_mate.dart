import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListMate extends StatelessWidget {
  const ListMate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    //double width = MediaQuery.of(context).size.width*0.6;
    return Container(
      //height: 3000,

      child: Column(
        children: [
          SizedBox(height: 5),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('team').snapshots(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              return SizedBox(
                //height: 1500,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) => Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            SpecialOfferCard(
                              image: snapshot.data!.docs[index]['img'],
                              date: snapshot.data!.docs[index]['date'],
                              products: snapshot.data!.docs[index]['product'],
                              participants: snapshot.data!.docs[index]['participants'],
                            ),
                          ],
                        )
                    )
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
class SpecialOfferCard extends StatelessWidget {

  final int? participants;
  final String? products;
  final String? date;
  final String? image;

  SpecialOfferCard({
    @required this.products,
    @required this.date,
    @required this.image,
    @required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  "$image",
                  // fit: BoxFit.cover,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffffcd7d),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$products",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: "  현재 $participants명 참여\n",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black45,
                            )
                        ),
                        TextSpan(
                          text: "\n$date 배송예정",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}