# Commands:
#   status
#

_ = require('underscore')
child_process = require('child_process')

module.exports = (robot) ->
  _.each process.env, (v, k) ->
    if command = k.match(/npm_package_config_hubot_command_(\w+)/)?[1]
      robot.respond new RegExp(command, 'i'), (msg) ->
        child_process.exec v, {}, (error, out, err) ->
          msg.send out
