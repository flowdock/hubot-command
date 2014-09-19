# Commands:
#   status
#

module.exports = (robot) ->
  robot.respond /status/i, (msg) ->
    msg.send "All systems go"
