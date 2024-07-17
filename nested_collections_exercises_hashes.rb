def find_language_information(languages, language_name)
  languages.select { |language, data| data if language == language_name }
end

languages = {
  ruby: {initial_release: 'December 25, 1996', is_beautiful?: true},
  javascript: { initial_release: 'December 4, 1995', is_beautiful?: false}
}
puts find_language_information(languages, :ruby)
puts
def add_information_about_language(languages, language_name, info_key, info_value)
  languages[language_name][info_key] = info_value
end

add_information_about_language(languages, :ruby, :color, 'red')
puts languages
puts

def add_language(languages, language_name, language_info_value)
  languages[language_name] = language_info_value
end
add_language(languages, :python, {year: 1996, is_beautiful?: false})
puts languages
puts

def delete_information_about_languages(languages, language_name, info_key)
  languages[language_name].delete(info_key)
end

delete_information_about_languages(languages, :ruby, :color)
puts languages
puts

def delete_language(languages, language_name)
  languages.delete(language_name)
end

delete_language(languages, :python)
puts languages
puts

def find_beautiful_languages(languages)
  languages.select { |language, data| data[:is_beautiful?] == true}
end

beautiful_languages = find_beautiful_languages(languages)
puts beautiful_languages.inspect
puts

def find_language_facts(languages, language_name, fact_index = 0)
  facts = languages[language_name][:facts]
  facts[fact_index]
end

add_information_about_language(languages, :ruby, :facts, ['Ruby fact 0', 'Ruby fact 1'])
add_information_about_language(languages, :javascript, :facts, ['Javascript fact 0', 'Javascript fact 1'])

puts find_language_facts(languages, :ruby)
puts find_language_facts(languages, :ruby, 1)