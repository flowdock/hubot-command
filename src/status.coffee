# Commands:
#   status
#

module.exports = (robot) ->
  console.log process.env
  _.each process.env, (v, k) ->
    if command = k.match(/npm_package_config_hubot_command_(\w+)/)?[1]
      robot.respond new RegExp(command, 'i'), (msg) ->
        msg.send v
