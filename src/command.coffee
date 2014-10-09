# Description
#   Run predefined shell commands with hubot
#
# Configuration:
#   HUBOT_COMMAND_CONFIG - Which configuration file to use for commands. By default commands.json
#
# Commands:
#   hubot command <name> - Run a predefined command in shell

childProcess = require 'child_process'
fs = require 'fs'

CONFIG_FILE = process.env.HUBOT_COMMAND_CONFIG || 'commands.json'

indent = (str) ->
  '    ' + str.split('\n').join('\n    ')

module.exports = (robot) ->

  try
    commands = JSON.parse(fs.readFileSync(CONFIG_FILE).toString())
  catch e
    robot.logger.error "Unable to parse your #{CONFIG_FILE} file in hubot-command"
    commands = {}

  robot.respond /command(?:\s+(.+))?$/i, (msg) ->
    command = msg.match[1]
    if !command || command.match /^\s+$/
      if Object.keys(commands).length > 0
        msg.send(
          """
          I know how to run these commands:
          #{indent(("#{name} - #{script}" for name, script of commands).join('\n'))}
          """
        )
      else
        msg.send "I don't know about any commands to run. Specify them in #{CONFIG_FILE}"
    else
      if commands[command]
        robot.logger.info 'Running command', commands[command]
        childProcess.exec commands[command], {}, (error, out, err) ->
          if error
            msg.send indent(err)
          else
            msg.send indent(out)
      else
        msg.send "I don't know about such command"

