# hubot-command

Run shell commands from hubot.

The commands to be run should be defined in the `package.json` of your hubot instance like so

```
"config": {
    "hubot-command": {
        "runme": "echo 'foobar'"
    }
}
```

hubot needs to be started with `npm start` so that the environment variables are read from the `package.json` so you will need to define also a start script in your `package.json`. If you are using just the standard hubot startup script then add this:

```
"scripts": {
    "start": "bin/hubot"
}
```
