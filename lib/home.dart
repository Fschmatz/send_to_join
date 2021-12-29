import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:send_to_join/api_key.dart';
import 'package:send_to_join/util/info_dialog.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController messageText = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> sendMessage() async {
    if (messageText.text.isNotEmpty) {
      String urlToSend =
          "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=" +
              ApiKey.key +
              "&text=" +
              messageText.text +
              "&deviceId=" +
              ApiKey.deviceID;

      final response = await http.get(Uri.parse(urlToSend));

      if (response.body.contains('true')) {
        Fluttertoast.showToast(
          msg: "Message Sent",
        );
      }

      messageText.text = '';
    } else {
      Fluttertoast.showToast(
        msg: "Message is Empty",
      );
    }
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
            title: const Text('Send To Join Fschmatz'),
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
            ],
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text("Message".toUpperCase(),
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary)),
                ),
                ListTile(
                  title: TextField(
                    autofocus: true,
                    minLines: 1,
                    maxLines: 10,
                    maxLength: 2000,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    textInputAction: TextInputAction.go,
                    controller: messageText,
                    decoration: InputDecoration(
                      counterText: "",
                      focusColor: Theme.of(context).colorScheme.primary,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    onEditingComplete: () => {sendMessage()},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 120,
                    height: 45,
                    child: ElevatedButton.icon(
                      label: const Text('Send'),
                      icon: const Icon(Icons.send_rounded),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () {
                        sendMessage();
                      },
                      //child:
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
