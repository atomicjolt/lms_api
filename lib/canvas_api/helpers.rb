module CanvasApi
  def nested_arg(str)
    # TODO/HACK we are replacing values from the string here to get things to work for now.
    # However, removing these symbols means that the methods that use the arguments
    # generated herein will have bugs and be unusable.
    str.gsub("[", "_").
      gsub("]", "").
      gsub("*", "star").
      gsub("<", "_").
      gsub(">", "_").
      gsub("`", "").
      gsub("https://canvas.instructure.com/lti/", "").
      gsub("https://www.instructure.com/", "").
      gsub("https://purl.imsglobal.org/spec/lti/claim/", "").
      gsub(".", "")
  end
end
