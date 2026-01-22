import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/task_model.dart';

class TaskService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Task>> fetchTasks() async {
    final user = _client.auth.currentUser;
    if (user == null) return [];

    final response = await _client
        .from('tasks')
        .select()
        .eq('user_id', user.id)
        .order('created_at');

    return (response as List).map((e) => Task.fromJson(e)).toList();
  }

  Future<void> addTask(String title) async {
    final user = _client.auth.currentUser;
    if (user == null) {
      print('❌ No logged in user');
      return;
    }

    print('🟡 Adding task for user: ${user.id}');
    print('🟡 Task title: $title');

    final response = await _client.from('tasks').insert({
      'title': title,
      'user_id': user.id,
    });

    print('🟢 Insert response: $response');
  }

  Future<void> toggleTask(Task task) async {
    await _client
        .from('tasks')
        .update({'is_completed': !task.isCompleted})
        .eq('id', task.id);
  }

  Future<void> deleteTask(String id) async {
    await _client.from('tasks').delete().eq('id', id);
  }
}
