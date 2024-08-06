languages = {
  ruby: {
    facts: ['fact 0', 'fact 1'],
    initial_release: 'December 25, 1996',
    is_beautiful: true
  },
  javascript: {
    facts: ['fact 0', 'fact 1'],
    initital_release: 'December 4, 1995',
    is_beautiful: false
  }
}

def find_language_information(languages, language_name)
  languages[language_name]
end

def add_information_about_language(languages, language_name, info_key, info_value)
  languages[language_name][info_key] = info_value
end

def add_language(languages, language_name, language_info_value)
  languages[language_name] = language_info_value
end

def delete_information_about_language(languages, language_name, info_key)
  languages[language_name].delete(info_key)
end

def delete_lanaguage(languages, language_name)
  languages.delete(language_name)
end

def find_beautiful_languages(languages)
  Array.new(languages.collect { |language, data| language if data[:is_beautiful] == true }.compact)
end

def find_language_facts(languages, language_name, fact_index = 0)
  languages[language_name][:facts][fact_index]
end

puts find_language_information(languages, :ruby)
puts

add_information_about_language(languages, :ruby, :difficulty, 'kinda hard')
puts languages.inspect
puts

add_language(languages, :python, {initial_release: 'February 20, 1991', is_beautiful: true})
puts languages.inspect
puts

delete_information_about_language(languages, :ruby, :difficulty)
puts languages.inspect
puts

delete_lanaguage(languages, :python)
puts languages.inspect
puts

beautiful_languages = find_beautiful_languages(languages)
puts beautiful_languages
puts

puts find_language_facts(languages, :ruby, 1)