# Commands:
#   status
#

_ = require('underscore')
child_process = require('child_process')

module.exports = (robot) ->
  _.each process.env, (v, k) ->
    indent = (str) ->
      '    ' + str.split('\n').join('\n    ')
    if command = k.match(/npm_package_config_hubot_command_(\w+)/)?[1]
      robot.logger.info 'Registering command "' + command.replace(/_/g, ' ') + '"'
      robot.respond new RegExp(command.replace(/_/g, '\\s+'), 'i'), (msg) ->
        robot.logger.info 'Running command', v
        child_process.exec v, {}, (error, out, err) ->
          if error
            msg.send indent(err)
          else
            msg.send indent(out)
      robot.commands.push "Hubot " + command.replace(/_/g, ' ') + ' - Run shell command "' + v + '"'
