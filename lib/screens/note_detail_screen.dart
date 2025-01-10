import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/api_service.dart';
import '../widgets/custom_textfield.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: note.title);
    final contentController = TextEditingController(text: note.content);

    Future<void> updateNote(BuildContext context) async {
      final updatedTitle = titleController.text.trim();
      final updatedContent = contentController.text.trim();

      if (updatedTitle.isEmpty || updatedContent.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Title and Content cannot be empty!')),
        );
        return;
      }
        Navigator.pop(context); // Go back to the previous screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Note updated successfully!')),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Detail'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Navigate back on back icon press
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: titleController, hintText: 'Title'),
            const SizedBox(height: 16),
            CustomTextField(
              controller: contentController,
              hintText: 'Content',
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => updateNote(context),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // Full-width button
              ),
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
