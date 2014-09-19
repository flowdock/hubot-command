# hubot-command

Run shell commands from hubot.

The commands to be run should be defined in the `package.json` of your
hubot instance. The following example will register two commands:
`runme one` and `runme two` to hubot. Generally any amount of nesting
can be done.

```
"config": {
    "hubot-command": {
        "runme":
            "one": "echo 'one'",
            "two": "echo 'two'"
        }
    }
}
```



hubot needs to be started with `npm start` so that the environment variables are read from the `package.json` so you will need to define also a start script in your `package.json`. If you are using just the standard hubot startup script then add this:

```
"scripts": {
    "start": "bin/hubot"
}
```
