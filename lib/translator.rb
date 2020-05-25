# require modules here
require "yaml"
require "pry"

def load_library(yaml_file)
  # code goes here
  emotis = YAML.load_file(yaml_file)
  new_hash = {}
  emotis.each do |name, symbols| 
   new_hash[name] = {
     english: symbols[0],
     japanese: symbols[1]
   }
  end
  new_hash
end

def get_japanese_emoticon(yaml_file, eng_emoti)
  # code goes here
  translation = ""
  new_hash = load_library(yaml_file)
  new_hash.each do |name, languages|
      if languages[:english] == eng_emoti
      translation = languages[:japanese]
    end
  end
    if translation == ""
      return "Sorry, that emoticon was not found"
    else 
      return translation
    end
end

def get_english_meaning(yaml_file, jap_emoti)
  # code goes here
   translation = ""
  new_hash = load_library(yaml_file)
  new_hash.each do |name, languages|
      if languages[:japanese] == jap_emoti
      translation = name
    end
  end
    if translation == ""
      return "Sorry, that emoticon was not found"
    else 
      return translation
    end
end