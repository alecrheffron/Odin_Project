require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone_number(phone_number)
  stripped_number = phone_number.gsub(/\D/, '')

  # If number has 11 digits and starts with '1', strip the '1', otherwise invalid
  if stripped_number.length == 11 && stripped_number[0] == '1'
    stripped_number = stripped_number[1..-1]
  end

  # Should have exactly 10 digits
  stripped_number.length == 10 ? stripped_number : 'Invalid Number'
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def parse_date(reg_dates)
  DateTime.strptime(reg_dates, '%m/%d/%y %H:%M')
rescue ArgumentError
  nil
end

def reg_hour(dates)
  dates.map { |date| parse_date(date)&.hour }.compact.tally
end

def reg_day_of_week(dates)
  dates.map { |date| parse_date(date)&.strftime('%A') }.compact.tally
end

puts 'EventManager initialized.'

total_hour_counts = Hash.new(0)
total_day_counts = Hash.new(0)

contents = CSV.open(
  'data/event_attendees.csv',
  headers: true,
  header_converters: :symbol
)
contents.each do |row|
  reg_dates = Array(row[:regdate])
  hour_counts = reg_hour(reg_dates)
  hour_counts.each { |hour, count| total_hour_counts[hour] += count }
  day_counts = reg_day_of_week(reg_dates)
  day_counts.each { |day, count| total_day_counts[day] += count}
end

sorted_hours = total_hour_counts.sort_by { |_, count| -count }
sorted_days = total_day_counts.sort_by { |_, count| -count }

puts 'Hour counts:'
sorted_hours.each { |hour, count| puts "#{hour}:00 - #{count}" }
puts 'Day count:'
sorted_days.each { |day, count| puts "#{day}: #{count}" }

template_letter = File.read('./form_letter.erb')
erb_template = ERB.new template_letter
'''
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone_number = clean_phone_number(row[:homephone])
  reg_date = clean_date(row[:regdate])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)

end
'''