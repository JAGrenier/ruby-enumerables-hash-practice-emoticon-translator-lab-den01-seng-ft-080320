# require modules here
require 'yaml'
require 'pry'
path='lib/emoticons.yml'


def load_library(path)
 
 library=YAML.load_file('lib/emoticons.yml')
  translation_hash={}
  library.each do |emoji_name, emoji|
   translation_hash[emoji_name]={:english => emoji[0], :japanese => emoji[1]}
  end
  translation_hash 
end

def get_japanese_emoticon (path, eng_emoji)
  library=load_library(path)
  library.each do |meaning, emoji_hash|
    if emoji_hash[:english] == eng_emoji
    return emoji_hash[:japanese] 
  end  
  end 
  "Sorry, that emoticon was not found"
end

def get_english_meaning (path,jap_emoji)
  error_message='Sorry, that emoticon was not found'
  eng_meaning =''
  library=load_library(path)
    library.each do |meaning, emoji_hash|
      emoji_hash.each do |eng, jap|
        if jap == jap_emoji
          eng_meaning = meaning
        end 
       end 
    if eng_meaning == ''
      eng_meaning=error_message
    end 
  end 
  eng_meaning
end 