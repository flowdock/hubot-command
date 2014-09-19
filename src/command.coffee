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
      console.log 'registering command', command
      robot.respond new RegExp(command, 'i'), (msg) ->
        console.log 'running', v
        child_process.exec v, {}, (error, out, err) ->
          if error
            msg.send indent(err)
          else
            console.log 'success'
            msg.send indent(out)
