local function sti_renderorder(map, renderorder_layer, location)
  local orig_draw = renderorder_layer.draw

  -- find layers that could overlap & disable drawing (keeping a ref to original draw)
  local layers = {}
  for i=1,#map.layers do
    local layer = map.layers[i]
    if layer.properties.ysort then
      layer.orig_draw = layer.draw
      function layer:draw() end
      table.insert(layers, layer)
    end
  end

  -- overwrite the renderlayer's draw function to account for front/behind
  function renderorder_layer:draw()
    
    local targetx, targety = map:convertPixelToTile (location.x, location.y)
    targetx = math.floor(targetx)
    targety = math.floor(targety)
    
    -- list of square-positions to check for overlap
    local matrix = {
      { targetx, targety},
      -- { targetx, targety + 1},
      -- { targetx, targety - 1},
      -- { targetx-1 , targety},
      -- { targetx+1, targety},
    }

    if map.sti_renderorder_debug then
      love.graphics.setColor(1,0,0,0.2)
      for _,m in pairs(matrix) do
        love.graphics.rectangle("fill", m[1]*32, m[2]*32, 32,32)
      end
      love.graphics.setColor(1,1,1,1)
    end

    orig_draw()

    for _,layer in pairs(layers) do
      local found = false
      for _,m in pairs(matrix) do
        if layer.data[m[2]] and layer.data[m[2]][m[1]] then
          found = true
        end
      end
      if found then
        layer:orig_draw()
        orig_draw()
      else
        layer:orig_draw()
      end
    end
  end
end

return sti_renderorder
