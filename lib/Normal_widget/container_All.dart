import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<TodoItem> todos = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addTodo() {
    String todoText = _textController.text.trim();

    if (todoText.isNotEmpty) {
      setState(() {
        todos.add(TodoItem(text: todoText, isCompleted: false));
      });

      _textController.clear();
    }
  }

  void _toggleTodo(int index) {
    setState(() {
      todos[index].isCompleted = !todos[index].isCompleted;
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📝 To-Do App'),
        backgroundColor: Colors.green, centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
          children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a new task...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTodo(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Add'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child:
              todos.isEmpty
                  ? Center(
                    child: Text(
                      'No tasks yet!\nAdd a task to get started.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                  : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (_) => _toggleTodo(index),
                      ),
                      title: Text(
                        todo.text,
                        style: TextStyle(
                          decoration:
                          todo.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color:
                          todo.isCompleted
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () => _deleteTodo(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoItem {
  String text;
  bool isCompleted;

  TodoItem({required this.text, required this.isCompleted});
}