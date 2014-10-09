# hubot-command

Run shell commands from hubot.

The commands to be run should be defined in the `command.json` in your
hubot dir. The following example will register two commands:
`runme one` and `runme two` to hubot.

```
{
    "runme one": "echo 'one'",
    "runme two": "echo 'two'"
}
```

The you can call them using

```
# print whan commands can be run
hubot command

# run "runme one", hubot will respond "one"
hubot runme one
```
