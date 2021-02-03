-- use the parent directory to find sti-renderorder
package.path = "../?.lua;" .. package.path

local sti = require "sti"
local sti_renderorder = require "sti-renderorder"
local anim8 = require "anim8"
local pprint = require "pprint"

love.window.setMode(640, 640, {resizable=false})
love.window.setTitle("sti-renderorder demo")

local map
local player

function love.load()
  map = sti("assets/map01.lua")

  local location = { x=0, y=0 }

  -- get initial location from placement of "player" object in "player" layer
  for i,object in pairs(map.layers.player.objects) do
    if object.name == "player" then
      location = { x = object.x, y = object.y }
    end
  end

  -- turn "player" into a custom-layer that tells us where to put the player
  player = map:convertToCustomLayer("player")

  -- set location to x/y I got before the conversion
  player.location = location

  -- setup sprite-anmiations for player
  player.image = love.graphics.newImage("assets/player.png")
  local g = anim8.newGrid(32, 32, player.image:getWidth(), player.image:getHeight())
  player.animations = {
    up = anim8.newAnimation(g("1-9", 1), 0.1),
    left = anim8.newAnimation(g("1-9", 2), 0.1),
    down = anim8.newAnimation(g("1-9", 3), 0.1),
    right = anim8.newAnimation(g("1-9", 4), 0.1)
  }
  player.direction = "down"

  function player:update(dt)
    player.animations[player.direction]:update(dt)
  end

  function player:draw()
    player.animations[player.direction]:draw(player.image, player.location.x, player.location.y)
  end
end

function love.update()
end

function love.draw()
  sti_renderorder(map)
  map:draw(0, 0)
end
