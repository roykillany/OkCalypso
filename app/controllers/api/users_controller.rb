class Api::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render json: @user
  end

  # def show
  #   @user = User.find(params[:id])
  #   if @user
  #     render :show
  #   else
  #     redirect_to :index
  #   end
  # end

  def create
    @user = User.new(user_params)
    @user.profile = Profile.new(user_id: @user.id)
    @user.preferences = Preference.new(user_id: @user.id)
    if @user.save
      p "SAVED!"
      log_in(@user)
      render json: @user
    else
      p "NOT SAVED!"
      flash.now[:errors] = @user.errors.full_messages
      render json: @user.errors.full_messages, status: 422
    end
  end

  def guest_create
    orientation = ["Straight", "Gay", "Bisexual", "Demisexual",
    "Heteroflexible", "Homoflexible", "Lesbian", "Pansexual", "Queer",
    "Questioning", "Sapiosexual"]
    gender = ["Woman", "Man", "Agender", "Androgynous", "Bigender",
    "Cis Man", "Cis Woman", "Genderfluid", "Genderqueer", "Gender Nonconforming",
    "Hijira", "Intersex", "Non-binary", "Other", "Pangender", "Transfeminine",
    "Transgender", "Transmasculine", "Transsexual", "Trans Man", "Trans Woman",
    "Two Spirit"]

    guest_orientation = orientation[rand(orientation.length)]
    guest_gender = gender[rand(gender.length)]

    guest_username = Faker::Internet.user_name
    while User.all.pluck("username").include?(guest_username)
      guest_username = Faker::Internet.user_name
    end
    guest_pass = Faker::Internet.password(6)
    guest_email = Faker::Internet.free_email
    guest_country = Faker::Address.country
    guest_zip = Faker::Address.zip_code
    guest_avatar = process_uri(UIFaces::face)

    userData = {
      username: guest_username,
      email: guest_email,
      password: guest_pass,
      orientation: guest_orientation,
      gender: guest_gender,
      country: guest_country,
      zip_code: guest_zip,
      avatar: guest_avatar,
      is_guest: true,
      searchable: true,
    }

    @guest = User.new(userData)



    if @guest.save
      log_in(@guest)

      generate_profile
      generate_preferences
      generate_details
      generate_user_answers
      generate_likes
      generate_messages

      render json: @guest
    else
      flash.now[:errors] = @guest.errors.full_messages
      render json: @guest.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    log_out!
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render json: @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :orientation, :gender, :country, :zip_code, :avatar)
  end

  def process_uri(uri)
    require 'open-uri'
    require 'open_uri_redirections'
    open(uri, :allow_redirections => :safe) do |r|
      r.base_uri.to_s
    end
  end

  def generate_profile

    self_sum = ["Okay so I'm a gamer mostly Xbox some pc plus any other console
    within reach :x . I am a pre-nursing student at CCC, I've always loved
    the medical field so I'm really excited to be pursuing a nursing career.
    I love to travel and have actually been to a few different countries
    beside the US. Yeah so I'm not good at writing about myself I'm better
    at answering questions and having conversations with people so,
    I guess you shouldn't judge a book by its...self-summary ? lolz",
    "I'm forging ahead into my 60s, hoping the rest of my life will continue
    to be a happy and exciting adventure. The book of my life has had many
    varied chapters and I've led quite a few different lives ...from single,
    to married with children, to divorced, to partnered. I have two adult
    children who are my best friends and four beautiful and funny grandchildren.
    My hair is usually on the longer side, but I will cut it for the right part
    in a play or movie. I'm most proud of being a cancer survivor for 8 years
    now.",
    "I'm 28 years old. Very laid back and family oriented. Love to hang out and
    have fun. Big college sports fan. WAR EAGLE!!!!! I have to boys 10 & 6 who
    is my world. Like to know anything else, feel free to ask.",
    "I feel so lucky to have been brought up in the bay area, a place rich in
    culture and steeped in natural beauty. Growing up in such a unique environment
    has helped shape who I am today, a woman who notices and appreciates the
    simple things in life, and doesn't put much value on the material. But don't
    get me wrong, although I am a woman who doesn't mind getting her hands dirty,
    I also love putting heels on and getting dressed up for a night out.",
    "I'm a DC transplant working in the design field. I live in SF and enjoy
    life in the city and all that it offers. Being active is important to me,
    and yoga, barre and exploring SF are my preferred modes of exercise.",
    "Hello stranger. Quite literally. This isn't daunting at all, is it?

    I'm the eldest of five, and I think family is the most important part of my
    life - immediate and extended.

    I'm friendly and really enjoy the company of others, but I can be quite
    sparing about the particulars of my life until I get to know you. Despite
    this, I'll be able to make you laugh or think right off the mark.

    Social justice, human rights - particularly rights of the child and women's
    rights - are important to me. I'm a feminist - if you get pictures of bra-burning,
    hairy-legged women in your head when you think of that, you should message
    me and I'll try to fix that!

    Let's have a really interesting conversation. Right now.",
    "Coming to Australia was my biggest life-changing event. I'm proud of myself
    for being able to speak like a native speaker while enjoying the occasional
      'communication breakdown' moments (I'm getting better these days!)

    Friends say I'm bubbly and curious, genuine and sweet. I'd like to think I
    have a positive outlook on life but I also see things for what they are. I
    like to maintain a healthy lifestyle by eating healthy and exercising regularly.

    I'm adventurous when it comes to food and experiences, don't mind giving
    anything a go at least once.

    I love dumplings. And as much as I enjoy eating them, the joy is in the
    making (more so when you work as a team :D). They are well received among
    my friends which is always a good sign!

    If you're interested, drop a message and let's get to know each other over
    a chat or a coffee!

    P.S. please excuse me for not replying if I think we are truly not compatible,
    thanks."]

    life_sum = ["Experimenting, enjoying, smiling a lot, wishing for warm
    weather all the time so I can enjoy outdoors more often, meeting new
    people, and learning new things",
    "Currently going to school to pursue my dreams, raising my daughter the
    best that I know how, bettering myself each day.",
    "I just moved here on May the 16, 2014. I also don't know many people. I
    have a full time job with a retail company. I also work part time at weight
    watchers.",
    "Being in a startup with strategic global partnerships is an exciting build
    phase to be in. Its the roll up your sleeves and let's go and see what
    happens. Its my dream and decided to follow it before I die.
    Hill running, everywhere I go I look for the worst hill nearby and try it.
    Sometimes I scream and cry from the lactic acid burn but the feeling of
    accomplishment afterward is great! chasing the perfect butt.
    My bucket list has become the center of my life and hopefully that won't
    change. I like creating memorable moments for myself and for my friends.",
    "I'm self sufficient with no baggage and in a great place in my life. I'm
    looking to meet someone to become a special part of it.",
    "Right now I'm waiting to start a new job in Sydney, and am working on my
    tan. I've also been dogsitting, but I have to give him back soon.",
    "Work & study part-time.
    Work in Arts/Health
    I am happy in my life but really missing a man who brings out the best in me
    - some one special to journey through life with."]

    skills = ["Gaming! Logical puzzles and programming on my computer as well,
    though I do it more on a \"need to\" basis for my classes than a hobby.
    Oh, and adapting! I'm constantly striving to better myself, so I tend to
    try and shift myself to accommodate my significant other and become a
    better and more likable person!",
    "Being Straightforward lol. I would say I'm pretty decent at writing as well.
    Writing is the best way that I can express myself I believe. I love to tell
    a story and be apart of one through role playing. I also like to write my
    own rhymes and raps for fun sometimes :P And I'm a good sleeper and eater
    too.",
    "Baking from a recipe. Making costumes. Dedicating myself to shows on
    netflix. I had dance classes for 7 years and martial arts for 6. I love to
    sing... in the car... so no one can hear me. I am a professional sleeper
    and night owl. I'm great at losing my temper... sometimes. I don't know,
    I'll try most things. I really enjoy being active, but activity is only fun
    if there is someone else to share it with."]

    favorites = ["I can't really say I have a favorite book, but if I had to
    choose, I'd say the Alex Rider series~I loved Harry potter too, as well as
    the hunger games. My favorite movie of all time has to be Avatar~ (No, not
    the air ender) oh, and pretty much every Tim burton movie ever! Lol~
    Anything marvel, and now, GODZILLA! Favorite shows? Oh man... So many...
    I'm the usual fandom guy ._. supernatural, Dr who, Sherlock, breaking bad,
    walking dead, leverage, adventure time, ruby gloom, regular show, invader
    zim, lots of adult swim shows and lots of 90s toons~ Oh and uh... My little
    pony. Yeah, I said it. OH! And if you've ever seen potter puppet pals, DBZ
    abridged, or just watch youtube a lot for the funny, then you are awesome...
    Music? Man, lol... I like things no one else seems to like, XD. I hate
    country with a passion, but I'll tolerate it. Some country is ok. Raps
    alright as long as it sounds good. I'm huge into rave music, dubstep,
    techno, and pop. But seriously... Dubstep... Favorite food would HAVE to be
    ribs~Ribs and twizzlers ._.",
    "Movies--Cloudy with a chance of meatballs 1 & 2, Perks of being a wallflower,
    Despicable me 1 & 2, Beauty and the beast, Mulan 1 & 2, Lion king, Enemy at
    the gates, Ice castles, Snow white and the huntsman, Maleficent, She's the
    man, The vow, Titanic, A walk to remember, Save the last dance, The notebook,
    Phantom of the opera, Harry Potter series

    Shows--I love Lucy, Switched at birth, Pawn stars, Ink master, Boy meets
    world

    Music--Fireflight, Flyleaf, Skillet, Plumb, Christina Perri, Audra Lynn
    Hartke, Evanescence, 30 seconds to Mars, Yiruma, Breaking Benjamin, Lindsey
    Stirling, Brian Crain, Crowder, Casting crowns, Kutless, Wavorly, Vitamin
    string quartet, Vitamin piano series, Paramore, Underoath, Anberlin, Chris
    Tomlin, For today, Red, Disciple, Train, Paul Cardall, Jeremy Camp

    Food--chicken, rice, potatoes, nutella, soup, noodles, cranberry sauce,
    apples, grapes, mangoes, coconut, pomegranate",
    "I devour all books; comedy, horror, anything remotely thought-provoking;
    GOT, Cosmos, Always Sunny, Flight of the Conchords, The Office, Rick & Morty,
    Girls; Radiohead, Bon Iver, The xx, Audioslave, Muse, Black Keys, Interpol,
    Daft Punk, Smashing Pumpkins, Coldplay, Muse, & so so much more; blueberry
    pancakes, chocolate"]

    needs = ["Integrity
      Smartphone
      Pups
      Food
      Patience
      Spell check",
      "Besides the obvious, friends and family, I can't live without:
      My dog and cat
      Sushi
      The color pink (the actual color, not the Victoria Secret fashion line)
      Wikipedia (I know it's not a legitimate source, but it is full of
      information about everything)
      Coffee
      Adventurous vacations",
      "Music
      Love
      Sunshine
      All things green...like TREES
      Laughter
      Dancing"]

    thoughts = ["How I can better myself, when I'm going to sleep, and what I'm
    eating for dinner. I'm exciting, aren't I?",
    "helping animals, what muscle group(s) to work out next at the gym, purely
    hypothetical world domination, humanity",
    "The future. I'm a right brained person and a Gemini, so I can be all over
    the place. I wonder how in the hell am I going to settle on something. I
    promise I'm not sketchy, I'm just scattered."]

    fun_acts = ["It depends. Normally with friends or watching Netflix.",
    "Eating takeout and watching movies. Pretty laid back in general, but I like
    to go out every now and then.",
    "When I'm not studying, I'm hanging out with friends, watching a movie,
    baking, or going to a potluck!"]

    msg_reason = ["you have a French bull dog.",
    "You are genuinely interested in meeting someone new, you believe in
    chivalry, are confident, you have a sense of humor, you're close with your
    family, you have goals {and are not crazy}!",
    "You are smart, fun, stylish and handsome. Bonus points if you can show me
    to the best coffee shop in town."]

    profileData = {
      user_id: @guest.id,
      self_sum: self_sum[rand(self_sum.length)],
      life_sum: life_sum[rand(life_sum.length)],
      skills: skills[rand(skills.length)],
      favorites: favorites[rand(favorites.length)],
      needs: needs[rand(needs.length)],
      thoughts: thoughts[rand(thoughts.length)],
      fun_acts: fun_acts[rand(fun_acts.length)],
      msg_reason: msg_reason[rand(msg_reason.length)]
    }

    Profile.create!(profileData)
  end

  def generate_preferences
    preferencesData = {
      user_id: @guest.id,
    }

    Preference.create!(preferencesData)
  end

  def generate_user_answers
  end

  def generate_likes
    2.times do
      user_id = User.all[rand(User.all.count)].id
      p @guest.id

      while User.all.pluck("id") == user_id || user_id == @guest.id
        user_id = User.all[rand(User.all.count)].id
      end

      Like.create!({ liker_id: @guest.id, likee_id: user_id})
    end
  end

  def generate_messages
  end

  def generate_details
  end
end
