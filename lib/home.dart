import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:send_to_join/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:send_to_join/db/send_history_controller.dart';
import 'package:send_to_join/db/send_history_dao.dart';
import 'package:send_to_join/util/settings_page.dart';
import 'package:send_to_join/widgets/history_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> history = [];
  final TextEditingController messageText = TextEditingController();
  bool loadingHistory = true;

  @override
  void initState() {
    _getHistory(false);
    super.initState();
  }

  Future<void> _getHistory([bool refresh = true]) async {
    if (refresh) {
      setState(() {
        loadingHistory = true;
      });
    }
    final db = SendHistoryDao.instance;
    var resp = await db.queryAllRowsDesc();

    setState(() {
      history = resp;
      loadingHistory = false;
    });
  }

  Future<void> _saveWordToHistory(String text) async {
    saveSend(text);
  }

  Future<void> sendMessage() async {
    String textToSend = messageText.text;
    _saveWordToHistory(textToSend);
    messageText.text = '';

    if (textToSend.isNotEmpty) {
      String urlToSend =
          "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=" +
              ApiKey.key +
              "&text=" +
              textToSend +
              "&deviceId=" +
              ApiKey.deviceID;

      final response = await http.get(Uri.parse(urlToSend));
      _getHistory();

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
                    Icons.settings_outlined,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SettingsPage(),
                        ));
                  }),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: loadingHistory
                      ? const Center(child: SizedBox.shrink())
                      : ListView.builder(
                          reverse: true,
                          itemCount: history.length,
                          itemBuilder: (context, index) {
                            return history[index]['text'].toString().isNotEmpty
                                ? HistoryTile(
                                    key: UniqueKey(),
                                    refreshList: _getHistory,
                                    id: history[index]['id'],
                                    text: history[index]['text'],
                                    date: history[index]['date'],
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 15),
                child: TextField(
                  minLines: 1,
                  maxLines: 10,
                  maxLength: 2000,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  //textInputAction: TextInputAction.go,
                  controller: messageText,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      counterText: "",
                      focusColor: Theme.of(context).colorScheme.primary,
                      suffixIcon: IconButton(
                          onPressed: () => {sendMessage(), loseFocus()},
                          icon: Icon(
                            Icons.send_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ))),
                  //onEditingComplete: () => {sendMessage(), loseFocus()},
                ),
              ),
            ],
          )),
    );
  }
}
