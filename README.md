# Personal Agile Board

## Summary
Personal Agile Board - simple project (can be even called super cool todo list - but let's not call it that please) created to learn about creating local database in device memory (hive package - https://pub.dev/packages/hive) and some draggable interaction (native flutter draggable widget - https://api.flutter.dev/flutter/widgets/Draggable-class.html) and fix a little bit previous default clean architecture.

## Technology stack
auto_route, get_it, injectable, equatable, uuid, hive

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
![Screenshot 2024-04-09 at 19 51 08](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/9d74e053-9605-4744-bd38-725dc9911b6b)
![Screenshot 2024-04-09 at 19 50 32](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/080d6a65-37cb-4a9f-b99d-c170b3b27f30)
![Screenshot 2024-04-09 at 19 51 22](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/a150932c-8674-459e-b051-6a51b3c6da76)
![Screenshot 2024-04-09 at 19 51 31](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/89a47383-7f94-473f-97a1-0784fde3f892)
![Screenshot 2024-04-09 at 19 52 06](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/558bc1ee-b1ee-46e6-9e9f-2c379da98ad4)
![Screenshot 2024-04-09 at 19 52 44](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/d6cdbb12-5ddb-4439-8666-0a545ab7c2b5)
![Screenshot 2024-04-09 at 19 53 20](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/882873a4-25ea-45fc-a472-712c1e1713a8)
![Screenshot 2024-04-09 at 19 54 00](https://github.com/KamilMicota42/Personal-Agile-Board/assets/85360923/b2a86e44-234b-4c6a-bc1b-5a63da4b60d1)

