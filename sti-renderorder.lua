local function in_front(location, layer)
  -- always "behind"
  return false
end


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
    orig_draw()
    for _,layer in pairs(layers) do
      if in_front(location, layer) then
        layer:orig_draw()
        orig_draw()
      else
        layer:orig_draw()
      end
    end
  end
end

return sti_renderorder