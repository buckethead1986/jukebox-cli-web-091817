require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:\n - help : displays this help message\n - list : displays a list of songs you can play\n - play : lets you choose a song to play\n - exit : exits this program"
end

def list(songs)
  songs.each.with_index {|song, index|
    puts "#{index + 1}. #{song}"
  }
end

def play(songs)
  puts "Please enter a song name or number:"
  user_input = gets.chomp       #The first method I made is commented out at the bottom of this page, and works. I'm just experimenting here. I wanted to code 'if the song name matches, or the index is valid, puts songs[song_name] || songs[index_value]', but couldnt figure out how have one 'puts' statement be able to handle a potential song_name string and also an index value.
  user_input_song_index = nil #probably a way too complicated way of being able to turn the input into an index regardless of if its the song name or position
  if user_input.to_i.between?(1, songs.length) #index must be between 1 and the length of the songs array (0 and length - 1, I know)
    user_input_song_index = user_input.to_i - 1 #turn the position into a proper index
  elsif songs.include?(user_input) #check for inclusion of the name
    user_input_song_index = songs.index(user_input) #if so, turn it into an index
  else
    puts "Invalid input, please try again" #any errors, default 'try again' statement.
  end
    if user_input_song_index != nil #once I have the song as a correct and proper index, simple if statement.
      puts "Playing #{songs[user_input_song_index]}"
    end
end

def exit_jukebox
  puts "Goodbye"
  #puts "And be a jukebox hero, got stars in his eyes"
end

def run(songs)
  help
    loop do
      puts "Please enter a command:"
      user_input = gets.chomp #takes input from user. chomp removes whitespace at the end
      if user_input == "help"
        help
      elsif user_input == "list"
        list(songs)
      elsif user_input == "play"
        play(songs)
      elsif user_input == "exit"
        exit_jukebox
        break
      else
        puts "Invalid input"
      end
    end
end


# def play(songs)
#   puts "Please enter a song name or number:"
#   user_input = gets.chomp
#         if songs.include?(user_input)
#           puts "Playing #{user_input}"
#         elsif user_input.to_i.between?(1, songs.length) #lol. the input is a string, not an integer. duh. I'm not stupid, I swear :D
#           puts "Playing #{songs[user_input.to_i - 1]}"
#         else
#           puts "Invalid input, please try again"
#         end
# end
