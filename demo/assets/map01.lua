return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 20,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 10,
  nextobjectid = 2,
  properties = {},
  tilesets = {
    {
      name = "terrain",
      firstgid = 1,
      filename = "lpc_terrain.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "terrain_atlas.png",
      imagewidth = 1024,
      imageheight = 1024,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 1024,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      id = 1,
      name = "ground 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzrZGJg6ALibiDuAeJOCvnYxLqgmFhxZD4+u7ooNLuHBDW41FHbv7j45MYLpfGJzqeWOaPuG3UfOXxqmtWJQ44Uc4gp/+jJJ6d8poQPALXl234="
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      id = 2,
      name = "ground 2",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgFIxEEAHEgEg6i0LwCIC5EwkVUMo+ByuaNFPdNAOKJSHgSheaNglGADQAAHOEOkg=="
    },
    {
      type = "group",
      id = 3,
      name = "renderorder",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["z"] = "y"
      },
      layers = {
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 20,
          height = 20,
          id = 5,
          name = "stuff",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          properties = {},
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBj8YAIjA8NEIJ4MxFMYKTdvA9CMjUC8GYi3kGFeJBMq/wLQjIskmgMyA2YOunmkgiqg/mogrmFCZZMLZgH1zgbiOUyo7FFAHpjHzMAwH4gXMFNmDiyd7AOasx+ID1BgHnI6uQc05z4QP6DAPOR08g9ozn+QWSzkm0cumESF8gEZbKKyecMNAAA4bByM"
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 20,
          height = 20,
          id = 8,
          name = "stuff2",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          properties = {},
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFwwFUMTEwVANxDRN1zJsFNGc2EM+hknmDHfxkZGD4BcS/GaljniQw3KSAWJpK4WcJNMcKiK1HSHyMgqEBAFp/B0g="
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 9,
      name = "player",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "player",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      id = 4,
      name = "over1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJztzMERgCAQBMEj/wgUJQ8FzUNAY3Fi4B762Knq567Zv1qC2YoUxj8mtjMiCg6cjr+N7Y6MjhuP4+9iW9EcH0op9XUv20oNQg=="
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      id = 7,
      name = "over2",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgcYA4jA8NcIJ7HSB3z9gDN2QvE+6hk3h2gOXeB+B6VzBsFo2AUjIKhDgDOJAav"
    }
  }
}
