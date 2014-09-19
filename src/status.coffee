# Commands:
#   status
#

module.exports = (robot) ->
  console.log process.env
  robot.respond /status/i, (msg) ->
    msg.send "All systems go"
