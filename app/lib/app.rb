def welcome_user
    puts "Welcome to TacoLandia!!!"
    puts "Tell us who you are"
end

def runner
    prompt = TTY::Prompt.new
    welcome_user
    names = User.get_user_names
    selection = prompt.select("What is your name friend?", names)
end