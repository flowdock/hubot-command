# Description:
#   Deploy Flowdock components
#
# Configuration:
#   Environment variables: 
#   HUBOT_GITHUB_TOKEN, required
#   GITHUB_ORGANIZATION, optional, default: 'flowdock'
#   
# Commands:
#   deploy <component> <stage> <ref>
#

api = require("octonode").client(process.env.HUBOT_GITHUB_TOKEN or '')
api.requestDefaults.headers['Accept'] = 'application/vnd.github.cannonball-preview+json'

module.exports = (robot) ->
  robot.respond /deploy ([^\s]+) ([^\s]+)( [^\s]+)?/i, (msg) ->
    organization = process.env.GITHUB_ORGANIZATION || 'flowdock'
    component = msg.match[1]
    stage = msg.match[2]
    ref = msg.match[3]?.trim() || 'master'
    repo = "#{organization}/#{component}"

    msgMeta = msg.message.user
    requestBody =
      ref: ref
      auto_merge: false
      description: "Deploying from hubot"
      payload:
        task: 'deploy'
        branch: ref
        deployer:  msg.message.user.name
        environment: stage
        notify: 
          flow: msgMeta.flow
          thread: msgMeta.thread_id || msgMeta.message

    api.post "repos/#{repo}/deployments", requestBody, (err, status, body, headers) ->
      if err
        console.log "Error from Deployment API", err
        msg.send err
      else
        console.log 'Deployment API response', body
        msg.send "Ok, deployment requested"
