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
    
    -- list of square-positions to check for overlap
    local matrix = {
      { math.floor(targetx), math.floor(targety)},
      { math.ceil(targetx), math.ceil(targety)},
      { math.floor(targetx), math.ceil(targety)},
      { math.ceil(targetx), math.floor(targety)}
    }

    if map.sti_renderorder_debug then
      for _,m in pairs(matrix) do
        local hit = false
        for _,layer in pairs(layers) do
          if layer.data[m[2]] and layer.data[m[2]][m[1]] then
            hit = true
          end
        end
        if hit then
          love.graphics.setColor(1,0,0,0.2)
        else
          love.graphics.setColor(0,0,1,0.2)
        end
        love.graphics.rectangle("fill", m[1]*32, m[2]*32, 32,32)
      end
      love.graphics.setColor(1,1,1,1)
    end

    orig_draw()

    local overlapping = {}
    for _,layer in pairs(layers) do
      local found = false
      
      for _,m in pairs(matrix) do
        if layer.data[m[2]] and layer.data[m[2]][m[1]] then
          found = true
          if map.sti_renderorder_debug then
            table.insert(overlapping, {layer, m})
          end
        end
      end
      if found then
        layer:orig_draw()
        orig_draw()
      else
        layer:orig_draw()
      end
    end
    if map.sti_renderorder_debug then
      -- add labels for overlaps and show them
      local text = {}
      for _,overlap in pairs(overlapping) do
        local layer = overlap[1]
        local m = overlap[2]
        table.insert(text, layer.name)
        love.graphics.print(layer.data[m[2]][m[1]].id, m[1]*32, m[2]*32 )
      end
      love.graphics.print(table.concat(text, ","), 0, 0 )
    end
  end
end

return sti_renderorder
