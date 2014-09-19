# Commands:
#   status
#

module.exports = (robot) ->
  robot.respond /status/, (msg) ->
    msg.send "All systems go"
