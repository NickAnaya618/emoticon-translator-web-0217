require "yaml"
require "pry"
require "pry-nav"


def load_library(file_name)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(file_name).each do |meaning, array|
    english, japanese = array
    library["get_meaning"][japanese] = meaning
    library["get_emoticon"][english] = japanese
  end
  library
end

def get_japanese_emoticon(file_name, emoticon)
  library = load_library(file_name)
  if library["get_emoticon"][emoticon]
    return library["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_name, emoticon)
  library = load_library(file_name)
  if library["get_meaning"][emoticon]
    return library["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
