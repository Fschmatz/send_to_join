import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
import 'package:http/http.dart' as http;
import '../api_key.dart';

class HistoryTile extends StatefulWidget {
  String? text;
  String? date;

  @override
  _HistoryTileState createState() => _HistoryTileState();

  HistoryTile({Key? key, required this.text, required this.date})
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

  @override
  Widget build(BuildContext context) {
    Color detailsColor =
        Theme.of(context).textTheme.headline6!.color!.withOpacity(0.7);

    return ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
        title: Text(
          widget.text!,
        ),
        subtitle: Text(
          Jiffy(widget.date!).yMMMMEEEEd,
          style: TextStyle(fontSize: 12, color: detailsColor),
        ),
        trailing: IconButton(
            onPressed: () => {sendMessage()},
            icon: Icon(
              Icons.keyboard_return_outlined,
              color: detailsColor,
            )));
  }
}
//Jiffy(widget.date!).format("dd/MM/yyyy")
