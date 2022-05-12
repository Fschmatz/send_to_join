import 'package:send_to_join/db/send_history_dao.dart';

void saveSend(String text) async {
  final db = SendHistoryDao.instance;
  Map<String, dynamic> row = {
    SendHistoryDao.columnText: text,
    SendHistoryDao.columnDate: DateTime.now().toString(),
  };
  await db.insert(row);
}