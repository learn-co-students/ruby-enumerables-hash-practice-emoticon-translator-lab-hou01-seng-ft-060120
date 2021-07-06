require "yaml"

def load_library(file)
emoticons = YAML.load_file(file)
emojis = {}
  emoticons.each do |mood, value|
    if !emojis.include?(mood)
    emojis[mood] = {}
    end
    if !emojis[mood].include?(value[0])
      emojis[mood] = {:english => value[0], :japanese => value[1]}
    end
  end
  emojis
end

def get_japanese_emoticon(file, emoticon)
   book_of_emoticon = load_library(file)
  book_of_emoticon.each do |english_key, english_value|
    english_value.each do |japanese_key, japanese_value|
      if emoticon.include?(japanese_value)
         return english_value[:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file,emoticon)
  book_of_emoticon = load_library(file)
  book_of_emoticon.each do |english_key, english_value|
    english_value.each do |japanese_key, japanese_value|
      if emoticon.include?(japanese_value)
         return english_key
      end
    end
  end
  return "Sorry, that emoticon was not found"
end