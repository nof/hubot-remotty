assert = require('power-assert')
{Robot, Adapter} = require 'hubot'
Remotty = require '../src/remotty'

describe 'Remotty', ->
  it 'set client', ->
    remotty = Remotty.use(@stubs.robot)
    assert remotty
    assert remotty.client
