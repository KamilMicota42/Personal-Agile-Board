# Personal Agile Board

## Summary
Personal Agile Board - simple project (can be even called super cool todo list - but let's not call it that please) created to learn about creating local database in device memory (hive package - https://pub.dev/packages/hive) and some draggable interaction (native flutter draggable widget - https://api.flutter.dev/flutter/widgets/Draggable-class.html) and fix a little bit previous default clean architecture.

## Use case
Because of native device memory we don't need authentication so user has access to all the functionalities from the start. The app is very simple user can just add tasks and change their status to organize their daily "quests".
• Add task
• Edit task (also their status via changing whole task or just pressing "fixed/restore" button)
• View tasks in simple todo list
• View tasks in agile board
• View archived tasks 
• Archive all tasks (to put aside tasks that user is no longer intrested in)

## Database
The only object in project is Task and it has values like:
• Uuid
• Name
• Description
• Status

## User interface
![Screenshot 2024-04-09 at 19 49 29](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/225c3c02-2e09-44e0-9488-f6f8da1a8991)
![Screenshot 2024-04-09 at 19 50 21](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/99aeb831-b1eb-48cf-8a0a-d8ed7f42841f)
![Screenshot 2024-04-09 at 19 50 32](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/080d6a65-37cb-4a9f-b99d-c170b3b27f30)
