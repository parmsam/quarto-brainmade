function add_html_dependencies()
  quarto.doc.add_html_dependency({
    name = "my-dependency",
      version = "1.0.0",
      resources = {
      { name = "white-logo.svg", path = "www/white-logo.svg"},
      { name = "black-logo.svg", path = "www/black-logo.svg"},
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
    local ref_image = "_extensions/brainmade/www/white-logo.svg"
    add_html_dependencies()
    -- quarto.doc.add_format_resource("www/" .. ref_image)
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
    local ref_image = "_extensions/brainmade/www/black-logo.svg"
    add_html_dependencies()
    -- quarto.doc.add_format_resource("www/" .. ref_image)
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
    local ref_image = "_extensions/brainmade/www/88x31-light.png"
    add_html_dependencies()
    -- quarto.doc.add_format_resource("www/" .. ref_image)
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
    local ref_image = "_extensions/brainmade/www/88x31-dark.png"
    add_html_dependencies()
    -- quarto.doc.add_format_resource("www/" .. ref_image)
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
