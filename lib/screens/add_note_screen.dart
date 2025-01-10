import 'package:flutter/material.dart';
import 'package:secure_note/services/api_service.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Note'),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: titleController, hintText: 'Title'),
            const SizedBox(height: 16),
            CustomTextField(controller: contentController, hintText: 'Content', maxLines: 5),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Save',
              onPressed: () {
                ApiService.addNote(context,titleController.text,contentController.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
