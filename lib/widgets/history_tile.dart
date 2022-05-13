import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
import 'package:http/http.dart' as http;
import 'package:linkwell/linkwell.dart';
import 'package:send_to_join/db/send_history_controller.dart';
import '../api_key.dart';

class HistoryTile extends StatefulWidget {

  Function() refreshList;
  int? id;
  String? text;
  String? date;

  @override
  _HistoryTileState createState() => _HistoryTileState();

  HistoryTile({Key? key,  this.text,  this.date, this.id, required this.refreshList})
      : super(key: key);
}

class _HistoryTileState extends State<HistoryTile> {

  Future<void> sendMessage() async {
    if (widget.text!.isNotEmpty) {
      String urlToSend =
          "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=" +
              ApiKey.key +
              "&text=" +
              widget.text! +
              "&deviceId=" +
              ApiKey.deviceID;

      final response = await http.get(Uri.parse(urlToSend));

      if (response.body.contains('true')) {
        Fluttertoast.showToast(
          msg: "Message Sent",
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Message is Empty",
      );
    }
  }

  /*Future<void> deleteAndRefresh() async{
    deleteSend(widget.id!);
    widget.refreshList();
  }*/

  @override
  Widget build(BuildContext context) {
    Color detailsColor =
        Theme.of(context).textTheme.headline6!.color!.withOpacity(0.7);

    return ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
        //onLongPress: () => deleteAndRefresh(),
        title:  LinkWell(widget.text!,
            linkStyle: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .secondary,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context)
                    .textTheme
                    .headline6!
                    .color!)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            Jiffy(widget.date!).yMMMMEEEEd,
            style: TextStyle(fontSize: 12, color: detailsColor),
          ),
        ),
        trailing: IconButton(
            onPressed: () => {sendMessage()},
            icon: Icon(
              Icons.keyboard_return_outlined,
              color: detailsColor,
            )));
  }
}