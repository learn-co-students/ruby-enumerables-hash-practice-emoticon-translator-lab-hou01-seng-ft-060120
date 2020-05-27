require 'yaml'
require 'pry'

def load_library(file_path)
library = YAML.load_file("lib/emoticons.yml")
final_result = {}
library.each do |key, value|
  final_result[key] || final_result[key] = {}
  final_result[key][:english] = value[0]
  final_result[key][:japanese] = value[1]
end
final_result
end

def get_english_meaning(file_path, jap_emoticon)
  library = load_library(file_path)
  library.each do |key, value|
    if value[:japanese] == jap_emoticon
    return key
  end
end
"Sorry, that emoticon was not found"
end

def get_japanese_emoticon (file_path, eng_emoticon)
  library = load_library(file_path)
  library.each do |key, value|
    if value[:english] == eng_emoticon
      return value[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end


 