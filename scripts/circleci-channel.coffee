# Description:
#   Get notifications on channel when CircleCI builds finish
#

module.exports = (robot) ->
  robot.router.post '/hubot/circleci', (req, res) ->
    payload = req.body.payload
    branch = payload.branch.toLowerCase()
    repo = payload.reponame.toLowerCase()
    message = "Build for #{repo} - #{branch}: #{payload.outcome.toUpperCase()}. See more at #{payload.build_url}"
    robot.send {room:  process.env['HUBOT_CIRCLECI_ROOM']}, message
    res.send 'Users alerted of build status.'

