function add_html_dependencies()
  quarto.doc.add_html_dependency({
    name = "my-dependency",
    version = "1.0.0",
    resources = {
      { name = "white-logo.svg",  path = "www/white-logo.svg" },
      { name = "black-logo.svg",  path = "www/black-logo.svg" },
      { name = "88x31-light.png", path = "www/88x31-light.png" },
      { name = "88x31-dark.png",  path = "www/88x31-dark.png" },
    },
  })
end

local function is_empty(s)
  return s == nil or s == ''
end

return {
  ['brainmade-light'] = function(args, kwargs, meta)
    add_html_dependencies()
    -- www_dir = quarto.utils.resolve_path("www")
    -- local ref_image = www_dir .. "/white-logo.svg"
    -- quarto.log.output(ref_image)
    -- local ref_image = "_extensions/brainmade/www/white-logo.svg"
    -- quarto.doc.add_format_resource("www/" .. ref_image)
    local ref_image = quarto.utils.resolve_path("www/white-logo.svg")
    ref_image = string.sub(ref_image, string.find(ref_image, "_extensions/") + 0 )
    local attributes = ""
    local width = pandoc.utils.stringify(kwargs["width"])
    if not is_empty(width) then
      attributes = attributes .. ' width="' .. width .. '"'
    end
    local height = pandoc.utils.stringify(kwargs["height"])
    if not is_empty(height) then
      attributes = attributes .. ' height="' .. height .. '"'
    end
    if quarto.doc.is_format("html:js") then
      return pandoc.RawBlock(
        "html",
        string.format(
          "<img src='%s' alt='Brainmade'%s/>",
          ref_image,
          attributes
        )
      )
    end
  end,
  ['brainmade-dark'] = function(args, kwargs, meta)
    add_html_dependencies()
    -- www_dir = quarto.utils.resolve_path("www")
    -- local ref_image = www_dir .. "/black-logo.svg"
    -- local ref_image = "_extensions/brainmade/www/black-logo.svg"
    -- quarto.doc.add_format_resource("www/" .. ref_image)
    local ref_image = quarto.utils.resolve_path("www/black-logo.svg")
    ref_image = string.sub(ref_image, string.find(ref_image, "_extensions/") + 0)
    local attributes = ""
    local width = pandoc.utils.stringify(kwargs["width"])
    if not is_empty(width) then
      attributes = attributes .. ' width="' .. width .. '"'
    end
    local height = pandoc.utils.stringify(kwargs["height"])
    if not is_empty(height) then
      attributes = attributes .. ' height="' .. height .. '"'
    end
    if quarto.doc.is_format("html:js") then
      return pandoc.RawBlock(
        "html",
        string.format(
          "<img src='%s' alt='Brainmade'%s/>",
          ref_image,
          attributes
        )
      )
    end
  end,
  ['brainmade-light-btn'] = function(args, kwargs, meta)
    add_html_dependencies()
    -- www_dir = quarto.utils.resolve_path("www")
    -- local ref_image = www_dir .. "/88x31-light.png"
    -- local ref_image = "_extensions/brainmade/www/88x31-light.png"
        -- quarto.doc.add_format_resource("www/" .. ref_image)
    local ref_image = quarto.utils.resolve_path("www/88x31-light.svg")
    ref_image = string.sub(ref_image, string.find(ref_image, "_extensions/") + 0)
    if quarto.doc.is_format("html:js") then
      return pandoc.RawBlock(
        "html",
        string.format(
          "<img src='%s' alt='Brainmade'/>",
          ref_image
        )
      )
    end
  end,
  ['brainmade-dark-btn'] = function(args, kwargs, meta)
    add_html_dependencies()
    -- www_dir = quarto.utils.resolve_path("www")
    -- local ref_image = www_dir .. "/88x31-dark.png"
    -- local ref_image = "_extensions/brainmade/www/88x31-dark.png"
        -- quarto.doc.add_format_resource("www/" .. ref_image)
    local ref_image = quarto.utils.resolve_path("www/88x31-dark.svg")
    ref_image = string.sub(ref_image, string.find(ref_image, "_extensions/") + 0)
    if quarto.doc.is_format("html:js") then
      return pandoc.RawBlock(
        "html",
        string.format(
          "<img src='%s' alt='Brainmade'/>",
          ref_image
        )
      )
    end
  end
}
