# chatbot

Requirements: ruby, yaml, sqlite3, active_record

## Usage

Just type in a project's folder:

```
$ ruby chatbot.rb
```
You can modify questions and bot's behavior in config/tree.yml. Build conversation's tree step by step.  
There are three possible types of behavior on each step: question, final, branch.
Question can have subquestions, variants of answers(with subnodes), link to other question's node(branch), or a 'final' - end of conversation, final phrase, exit from a program.

