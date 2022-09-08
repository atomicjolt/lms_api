module CanvasApi
  def nested_arg(str)
    # update_list_of_blackout_dates has a parameter named 'blackout_dates:'
    # This results in a parameter in the resolver named 'blackout_dates::'
    # which causes a syntax error.
    if str[str.length() - 1] == ":"
      str = str.chop
    end

    # TODO/HACK we are replacing values from the string here to get things to work for now.
    # However, removing these symbols means that the methods that use the arguments
    # generated herein will have bugs and be unusable.
    str.gsub("[", "_").
      gsub("]", "").
      gsub("*", "star").
      gsub("<", "_").
      gsub(">", "_").
      gsub("`", "").
      gsub("https://canvas.instructure.com/lti/", "lti_").
      gsub("https://www.instructure.com/", "").
      gsub("https://purl.imsglobal.org/spec/lti/claim/", "lti_claim_").
      gsub(".", "")
  end
end
