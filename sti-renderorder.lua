-- TODO: this is just a stub

local function sti_renderorder(map, renderorder_layer)
  function map:renderorder(location)
    for gid, tileset in pairs(map.tileInstances) do
      for tid, tile in pairs(tileset) do
        if tile.layer.type == 'tilelayer' and tile.layer.properties.ysort and math.floor(tile.x/32) == math.floor((location.x + tile.layer.width)/32) then
            if not tile.layer.renderorder then
              tile.layer.renderorder=true
              local d = tile.layer.draw
              function tile.layer:draw()
                if tile.y <= location.y then
                  d()
                  renderorder_layer:draw()
                else
                  d()
                end
              end
            end
        end
      end
    end
  end
end

return sti_renderorder