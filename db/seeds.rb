# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all 
Mood.destroy_all
Blurb.destroy_all
DailyPost.destroy_all 
Holiday.destroy_all


esther = User.create(name: "Esther", username: "ekang", password: "password", location: "Columbia, MD")
pepper = User.create(name: "Pepper", username: "pepperthecat", password: "password", location: "Columbia, MD")
luna = User.create(name: "Luna", username: "lunathecat", password: "password", location: "Seattle, WA")

def get_national_holidays_2020
    info_string = RestClient.get('https://calendarific.com/api/v2/holidays?api_key=46249050e48d8ac4bcaf6995811d9ba26a2115cc&country=US&year=2020&type=national')
    info_hash = JSON.parse(info_string)
    all_holiday_info = info_hash["response"]["holidays"]
end 

def get_national_holidays_2021
    info_string_2021 = RestClient.get('https://calendarific.com/api/v2/holidays?api_key=46249050e48d8ac4bcaf6995811d9ba26a2115cc&country=US&year=2021&type=national')
    info_hash_2021 = JSON.parse(info_string_2021)
    all_holiday_info_2021 = info_hash_2021["response"]["holidays"]
end 

#event: title, type, start_date, end_date, notes, completed?

# get_national_holidays.each do |holiday| 
#     Event.create(title: holiday["name"], event_type: "National Holiday", start_date: holiday["date"]["iso"], end_date: holiday["date"]["iso"], completed: false, notes: "")
# end

get_national_holidays_2020.each do |holiday|
    Holiday.create(title: holiday["name"], start_date: holiday["date"]["iso"], notes: "")
end 

get_national_holidays_2021.each do |holiday|
    Holiday.create(title: holiday["name"], start_date: holiday["date"]["iso"], notes: "")
end 

estherbday = Event.create(title: "My Birthday", event_type: "Birthday", user_id: esther.id, start_date: "2020-09-14", end_date: "2020-09-14", notes: "", completed: false)


# mood: title, color, hexcode
red = Mood.create(title: "very stressed, angry, frustrated", color: "Muted Red", hexcode: "#d66857", image: "https://cdn.discordapp.com/attachments/749783037281042626/749783922153488424/redmood.jpg")
orange = Mood.create(title: "alert, cautious, slightly stressed", color: "Pale Orange", hexcode: "#6d977d", image: "https://cdn.discordapp.com/attachments/749783037281042626/749783890260000849/orangemood.jpg")
green = Mood.create(title: "neutral, calm", color: "Pale Green", hexcode: "#7d977d", image: "https://cdn.discordapp.com/attachments/749783037281042626/749784683188846602/greenmood.jpg")
blue = Mood.create(title: "happy, lively, hopeful", color: "Dusty Blue", hexcode: "#b5bcc1", image: "https://cdn.discordapp.com/attachments/749783037281042626/749784804425465946/bluemood.jpg")
purple = Mood.create(title: "tired, down, drained, sad",  color: "Dusty Lavender", hexcode: "#cdc3c9", image: "https://cdn.discordapp.com/attachments/749783037281042626/749784898243526716/lavendermood.jpg")
pink = Mood.create(title: "great, best day eva, good mood", color: "3Pastel Pink", hexcode: "#e3b7bd", image: "https://cdn.discordapp.com/attachments/749783037281042626/749784942128660650/pinkmood.jpg")

# blurb: thankful, struggle, day_summary

blurb1 = Blurb.create(thankful: "Friends who check up on me", struggle: "Working on this project", day_summary: "Started the morning a little slow, but getting back into working on my project")
blurb2 = Blurb.create(thankful: "Food on the table", struggle: "Finding a job", day_summary: "Job search is tough but I ate well today!")

# dailypost: date, day, userid, moodid, blurbid
DailyPost.create(user_id: esther.id, mood_id: green.id, thankful: "Friends who check up on me", struggle: "Working on this project", summary: "Started the morning a little slow, but getting back into working on my project", date: "2020-08-26", day: "Wednesday")

# def get_local_holidays 
#     info_string = RestClient.get('https://calendarific.com/api/v2/holidays?api_key=46249050e48d8ac4bcaf6995811d9ba26a2115cc&country=US&year=2020&type=local')
#     info_hash = JSON.parse(info_string)
#     local_holiday_info = info_hash["response"]["holidays"]
# end 

# md_holidays = get_local_holidays.each do |holiday|
#     if holiday["locations"].include?("MD")
#         Event.create(title: holiday["name"], event_type: "Local Holiday", start_date: holiday["date"]["iso"], end_date: holiday["date"]["iso"], completed: false, notes: "Maryland Holiday")
#     end 
# end 

# wa_holidays = get_local_holidays.each do |holiday|
#     if holiday["locations]"].include?("WA")
#         Event.create(title: holiday["name"], event_type: "Local Holiday", start_date: holiday["date"]["iso"], end_date: holiday["date"]["iso"], completed: false, notes: "Washington Holiday")
#     end 
# end 



