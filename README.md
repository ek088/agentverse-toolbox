# agentverse-toolbox

The machine an [AgentVerse](https://github.com/ek088/AgentVerse) agent works on.

An agent runs shell commands on a rented sandbox. Which sandbox is a choice, and
this repository is one answer to it: a small image with the command-line tools a
team already uses, plus that team's own scripts on the `PATH`.

```
bin/toolbox          what is on this machine, in one command
bin/release-notes    Markdown changelog -> .docx with a title page and a contents
```

Point an AgentVerse environment at this repository (Library → Environments →
New → A repository), build it, and attach the result to an agent. The agent then
has `pandoc`, `qpdf`, `jq` and both scripts, in every conversation, without
installing anything.
