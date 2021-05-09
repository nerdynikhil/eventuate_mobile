import 'package:flutter/material.dart';

class AddCampaign extends StatefulWidget {
  @override
  _AddCampaignState createState() => _AddCampaignState();
}

class _AddCampaignState extends State<AddCampaign> {

  TextEditingController _titleController, _bodyController;
  GlobalKey<ScaffoldState> _myKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  //submit();
                },
                child: Icon(Icons.check)),
          )
        ],
        title: Text('Add new project'),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            padding: EdgeInsets.only(
                left: 20
            ),
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: 'Caption',
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.title,
                    color: Colors.grey[900],)
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  )
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            padding: EdgeInsets.only(
                left: 20
            ),
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: TextField(
              controller: _bodyController,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Description',
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.description,
                    color: Colors.grey[900],)
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  )
                ]
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text('Posting as ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          //       FutureBuilder(
          //         builder: (context,snapshot){
          //           if(snapshot.hasData) {
          //             String res = snapshot.data;
          //             var jsonObject = json.decode(res);
          //             return Text(
          //               '${jsonObject['name']}',
          //               style: TextStyle(
          //                   fontSize: 18,
          //                   color: Colors.pink
          //               ),
          //             );
          //           }
          //           else
          //             return Center(child: CircularProgressIndicator());
          //         },
          //         future: getData(),
          //       )
          //     ],
          //   ),
          // )


        ],
      ),
    );
  }
}
