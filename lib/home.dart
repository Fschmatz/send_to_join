import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_to_join/api_key.dart';
import 'package:send_to_join/util/info_dialog.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController messageText = TextEditingController();

  void sendMessage() async{
    String urlToSend = "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey="+ApiKey.key+"&text="+messageText.text+"&deviceId="+ApiKey.deviceID;

    final response = await http.get(Uri.parse(urlToSend));
    print(response.body);
    //var response = await http.post(

       // Uri.https(Uri.parse(urlToSend)),
        //headers: {"Content-type": "application/json"},
        //body: json.encode(supermodel .toJson()));
        // print(response.body);
  }

  void loseFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        loseFocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Send To Join'),
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.info_outline_rounded,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const InfoDialog();
                      },
                    );
                  }),
/*
              IconButton(
                  icon: const Icon(
                    Icons.departure_board,
                  ),
                  onPressed: () {
                    print(Uri.parse(urlToSend));

                   print(urlToSend);
                  }),*/
            ],
          ),
          body: ListView(
            children: [
              ListTile(
               /* leading: const SizedBox(
                  height: 0.1,
                ),*/
                title: Text("Message".toUpperCase(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              ListTile(
                //leading: const Icon(Icons.notes_outlined),
                title: TextField(
                  autofocus: true,
                  minLines: 1,
                  maxLines: 5,
                  maxLength: 2000,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: messageText,
                  decoration: InputDecoration(
                    counterText: "",
                    focusColor: Theme.of(context).colorScheme.primary,
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  onSubmitted: (value) => {

                  },
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: () { },
                    child: const Text('Send'),
                  ),
                ),
              )
            ],
          )



      ),
    );
  }
}
