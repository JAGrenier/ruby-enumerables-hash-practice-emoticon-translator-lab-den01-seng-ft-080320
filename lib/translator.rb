# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticon = {"get_meaning" => {},"get_emoticon" =>{}}
  YAML.load_file(path).each do |meaning, describe|
  eng,jan = describe
  emoticons["get_meaning"][jan] = meaning
  emoticons["get_emoticon"][eng]= jan
  end
  emoticons
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result

end
