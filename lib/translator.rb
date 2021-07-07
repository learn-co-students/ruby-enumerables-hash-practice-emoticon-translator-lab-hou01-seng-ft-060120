# require modules here
 require "yaml"
def load_library (file_path)
  # code goes here
  
  library = YAML.load_file("lib/emoticons.yml")
library.each do | emoticon, language|
  library [emoticon] = {}
  library [emoticon][:english] = language[0]
  library [emoticon][:japanese] = language[1]
end
 library
end

def get_japanese_emoticon(file_path,emoticon)
  # code goes here
  library = load_library (file_path)
 
library.each do |key, value|
 
if emoticon == value[:english]
    return value[:japanese]
 
     end
  
 end
    return "Sorry, that emoticon was not found"
end
 

  

def get_english_meaning (file_path,emoticon)
  library = load_library (file_path)
 
library.each do |key, value|
 
if emoticon == value[:japanese]
    return key
 
     end
  
 end
    return "Sorry, that emoticon was not found"
end
