def require_all(_absolute_path, _dir)
  dir = File.expand_path(File.join(File.dirname(_absolute_path), _dir)) + "/**/*.rb"
  Dir[dir].each do |file|
    require file
  end
end
