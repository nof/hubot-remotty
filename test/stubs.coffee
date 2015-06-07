{EventEmitter} = require 'events'
{Brain} = require 'hubot'

beforeEach ->
  @stubs = {}
  @stubs.robot = do ->
    robot = new EventEmitter
    # noop the logging
    robot.logger =
      info: ->
      debug: ->
    # record all received messages
    robot.received = []
    robot.receive = (msg) ->
      @received.push msg
    # attach a real Brain to the robot
    robot.brain = new Brain robot
    robot
