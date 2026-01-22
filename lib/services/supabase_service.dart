import 'package:supabase_flutter/supabase_flutter.dart';
import '../dashboard/task_model.dart';

class SupabaseService {
  final _client = Supabase.instance.client;

  Future<List<Task>> fetchTasks() async {
    final userId = _client.auth.currentUser!.id;
    final data = await _client.from('tasks').select().eq('user_id', userId);
    return (data as List).map((e) => Task.fromJson(e)).toList();
  }

  Future<void> addTask(String title) async {
    await _client.from('tasks').insert({
      'title': title,
      'user_id': _client.auth.currentUser!.id,
    });
  }

  Future<void> deleteTask(String id) async {
    await _client.from('tasks').delete().eq('id', id);
  }
}
