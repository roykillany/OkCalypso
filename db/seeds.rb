# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)
require 'users_controller.rb'

orientation = ["Straight", "Gay", "Bisexual", "Demisexual",
  "Heteroflexible", "Homoflexible", "Lesbian", "Pansexual", "Queer",
  "Questioning", "Sapiosexual"]

gender = ["Woman", "Man", "Agender", "Androgynous", "Bigender",
  "Cis Man", "Cis Woman", "Genderfluid", "Genderqueer", "Gender Nonconforming",
  "Hijira", "Intersex", "Non-binary", "Other", "Pangender", "Transfeminine",
  "Transgender", "Transmasculine", "Transsexual", "Trans Man", "Trans Woman",
  "Two Spirit"]

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
  thanks.",
  "I drove down here several years ago from the Great White North and never found
  the way back… I love to explore the many things California has to offer.",
  "",
  "I am looking for something more on the serious side, but definitely not in any
  rush. I am a fun person to hang out with - I keep things casual, light and happy.
  When in serious relationships, I commit fully - you may see the very
  domesticated side of me; I can make you laugh when you're having a bad day;
  doll myself up and go hit the town with you; or simply just give you your space
  and guy time. I'm pretty easy going.

  Born and raised in San Francisco. Work in corporate finance. Love a great
  conversation while listening to great music, along with a drink. I'm not
  always a 'girly' girl as I like Marvel movies, the NBA and dressing down sometimes.
  I am quite sociable, a little geeky and LOVE humor (I can be a big goofball).
  I have worked hard all my life, and don't take things for granted.

  I generally have a positive outlook on life and always try to find the silver
  lining. I value honesty very much, and I dislike those who beat around the bushes
  - I can be pretty direct and totally don't have patience for drama and bs. I
  don't enjoy the company of those who are pretentious and self-serving. My family
  and friends are most important to me.",
  "Nearing the milestone of 5 years as a Londoner. I’m easy-going, considerate,
  and pretty good at getting on with everyone I meet but I’m here to see if
  OkCupid can help me meet some more great new people! (Ideally that’s you,
  reader). I love escaping to the countryside but also touring and tasting
  London’s finest coffee & cake purveyors."]

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
  - some one special to journey through life with.",
  "I do research in a biotech startup. During my spare time, I enjoy cooking,
  going on long bike rides, hiking, camping, snowboarding, going to music shows
  or festivals, shopping for wine in Sonoma, finding new bars with great cocktails
  or beers, trying new restaurants, etc.",
  "Trying to improve it, one day at a time",
  "I spend my weekdays working in insurance. I enjoy it really, but as far as
  exciting jobs go it’s well down the list so let’s say no more about that.

  I love exploring the outdoors and mostly do this through mountain biking. There's
  nothing better than planning a long trip to the middle of nowhere on the back
  of a single photo I’ve seen online. Usually I’ll try and dabble in some
  photography of my own as I go too.

  I’m quite inquisitive about town too. Sometimes I take all the wrong turns home,
  just to see what's in those places I haven't been to. London is perfect for a
  weekend with no plans as there are just so many museums and slowly I’m getting
  through most of them.
  And of course I like to travel too. For 2015 I've got plans to get to Paris,
  Copenhagen, the Outer Hebrides, the Lofoten Islands and South Africa.

  I like pubs with good beer, going to gigs and going to the cinema. After work
  I often play a bit of badminton, pool, or table tennis on the table outside
  our office. I’ll always accept any invitation to go camping."]

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
  if there is someone else to share it with.",
  "My job, being a good daughter and sister, being a big dork, singing,
  recognizing patterns, being exceptionally clean and organized, and laughing
  at myself.",
  "- Finding my way without a map
  - Making carrot cake
  - Overestimating how many wasabi peas I can handle in one mouthful
  - DIY (Ok, I'm getting presumptuous with this one. I haven't had to try yet,
  but how hard can it be?)",
  "From what others have said i am apparently good at the following: Explaining
  complex issues in a very easy to understand way, listening and understanding
  people, looking at the big picture and cutting to the core of most problems.
  The less CV like answers: being tidy, well organised and cooking!"]

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
  pancakes, chocolate",
  "Favourite films include: Bourne Identity, The Godfather, Ronin, Pulp Fiction,
  A Beautiful Mind. Lately I've developed a thing for films set in the 70s (Argo,
  American Hustle). I think it's all the brown suits and moustaches. Important
  note: I don't own a brown suit, or a moustache.

  Mostly I read crime novels or travel/adventure stories. Just finished a book
  on The Great Tour Divide mountain bike race, currently reading Bill Bryson's
  A Walk in the Woods, and just bought Into Thin Air. But I also have Ian Rankin's
  latest lined up to restore the balance.

  I like to think I eat everything, and try to test this at every opportunity.
  Usually I'm a magnet to anything unusual on the menu so 4 months spent in South
  Korea were great fun. I'm eager to try surströmming. But more generally I'm a
  huge fan of pizza or any sort of curry.

  Dig through my mp3 player and there's a huge variety, but the most common
  themes would be 60s-70s rock or metal. At pub quizzes I'm known for my 90s pop
  knowledge (but maybe I'm just the only one bold enough to admit that I
  recognise them?)

  I'm not good at tv that requires a commitment to watch regularly and in a
  specified order, so I mostly watch comedy panel shows, sports and one-off
  documentaries. I love what 8 Out of 10 Cats have done to Countdown.",
  "A bit of Game of Thrones. I like a good film. Memento and Gatica are two that
  come to mind. I like trying to cook new dishes and eating out. Big fan of east
  asian food."]

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
  Dancing",
  "Human beings adapt... I can learn to do without many things, except for the
  obvious...",
  "- Cakes
  - Tea
  - My bike
  - Music
  - Friends
  - A camera",
  "Plain paper
  Pen
  Music
  Soy sauce
  Passport"]

  thoughts = ["How I can better myself, when I'm going to sleep, and what I'm
  eating for dinner. I'm exciting, aren't I?",
  "helping animals, what muscle group(s) to work out next at the gym, purely
  hypothetical world domination, humanity",
  "The future. I'm a right brained person and a Gemini, so I can be all over
  the place. I wonder how in the hell am I going to settle on something. I
  promise I'm not sketchy, I'm just scattered.",
  "Why OKCupid has ranked my personality as 'less than average' in every
  category. That's not necessarily a bad thing, right?",
  "Filling in redundant boxes.",
  "That okcupid profiles are an extreme example of personal Aestheticism."]

  fun_acts = ["It depends. Normally with friends or watching Netflix.",
  "Eating takeout and watching movies. Pretty laid back in general, but I like
  to go out every now and then.",
  "When I'm not studying, I'm hanging out with friends, watching a movie,
  baking, or going to a potluck!",
  "Depending on my level of energy, I’ll either take it easy watching a movie at
  home or I’ll start off having drinks with co-workers or friends and see where
  the night takes me.",
  "I usually prefer spending my Friday nights at home cooking dinner and getting
  some 'me' time to unwind the week. But anything goes during the weekend.",
  "The last 4 Fridays have been spent: travelling home for a weekend wedding;
  at the cinema with workfriends; staying in a hostel in the middle of nowhere
  on a bike trip; and at a ceilidh in Camden. Hard to pull out a 'typical' from
  that. This week it's curry and drinks near Waterloo.",
  "Meeting with old friends for tea and shisha",
  "Winding down. Hanging out with a few mates. Surrendering all the comfortable
  spots to my dog."]

  msg_reason = ["you have a French bull dog.",
  "You are genuinely interested in meeting someone new, you believe in
  chivalry, are confident, you have a sense of humor, you're close with your
  family, you have goals {and are not crazy}!",
  "You are smart, fun, stylish and handsome. Bonus points if you can show me
  to the best coffee shop in town.",
  "Please don't message me if you have for profile photo, a picture of yourself
  in the mirror.",
  "You are not looking to 'hook up,'' not pretentious, don't like to bs people,
  don't lie, and don't like to live in the past. Just cut the bull and keep it
  real...",
  "You want to meet someone for a good chat over a nice hot drink.",
  "You don't take match percentages too seriously.

  The voices in your head are telling you to.

  You've read enough of my profile to realise that I've already told you my name.

  Did I mention that I have a son? Because I have a son.",
  "You find any of the above remotely interesting and you fancy a chat.

  I do my utmost to converse with you if you've taken the time out to drop me a
  message."]

  target_people = ["Everyone", "Men", "Women"]

  target_age_range = rand(18..30).to_s + " to " + rand(30..50).to_s

  target_location = ["Anywhere", "Near me"]

  target_purpose = ["New friends", "Long-term dating", "Short-term dating", "Casual sex"]

# Creates my and my hunnypooh's accounts

users = [User.create!({ username: 'mebest winrar NA', email: 'me@best.na',
  password_digest: BCrypt::Password.create('mebest'), session_token: SecureRandom.urlsafe_base64,
  orientation: "Straight", gender: 'Cis Man', country:
  'United States of America', zip_code: 10012, avatar: Api::UsersController.new.process_uri(UIFaces::face) }),
  User.create!({ username: 'totallytinytina', email: 'totally@tiny.tina', password_digest:
    BCrypt::Password.create('mebest'), session_token: SecureRandom.urlsafe_base64,
    orientation: 'Straight', gender: 'Cis Woman', country:
    'Germany', zip_code: 12203, avatar: Api::UsersController.new.process_uri(UIFaces::face) })]

Profile.create!([{ user_id: 1,
  self_sum: "one time i ate a lot of dumplings and my mom was like \"Wow you eat
  a lot of dumplings\" and i was like \"guuuuurl don\'t i know it\" the end",
  life_sum: "twerking",
  skills: "licking stamps",
  favorites: "favorite books: if you give a mouse a cookie, the future simple of
  utor, gossip girls

  favorite shows: reading rainbow, naked dating, the big bang theory

  food: noodles",
  needs: "totallytinytina, hunnypooh, noodles, children's card games, NOT SHOWERING
  FOR THREE DAYS IN A ROW, 6",
  thoughts: "what i'm going to have for supper",
  fun_acts: "looking at foodporn",
  msg_reason: "don't" },
  { user_id: 2,
    self_sum: "I love to play league, I enjoy cuddling with my poohbear, and Burnese
    Mountain Dogs are the best!",
    life_sum: "eating doeners like they're going out of style",
    skills: "looking adorable",
    favorites: "poohbear",
    needs: "poohbear",
    thoughts: "when I'll get to see my poohbear next",
    fun_acts: "playing leggolegends",
    msg_reason: "if you want to play league!" }])

Preference.create!([{
  target_people: "Everyone",
  target_age_range: "98 to 98",
  target_location: "Located Anywhere",
  target_purpose: "New Friends",
  user_id: 1 },
  {
    target_people: "Everyone",
    target_age_range: "18 to 98",
    target_location: "Located Anywhere",
    target_purpose: "New Friends",
    user_id: 2 }])

Detail.create!([{ user_id: 1,
  orientation: "Straight",
  ethnicity: "Asian",
  height: "6\'",
  body_type: "Athletic",
  diet: "Anything",
  smokes: "No",
  drinks: "Socially",
  drugs: "Never",
  religion: "Agnostic",
  sign: "",
  education: "Graduated from University",
  job: "Web Developer",
  income: "",
  relationship_status: "Seeing Someone",
  relationship_type: "Strictly Monogamous",
  offspring: "",
  pets: "likes dogs",
  languages: "English"},
  {
    user_id: 2,
    orientation: "Straight",
    ethnicity: "White",
    height: "5\'9\"",
    body_type: "Curvy",
    diet: "Anything",
    smokes: "No",
    drinks: "Socially",
    drugs: "Never",
    religion: "Christianity",
    sign: "",
    education: "Master's Program",
    job: "Student",
    income: "",
    relationship_status: "Seeing Someone",
    relationship_type: "Strictly Monogamous",
    offspring: "",
    pets: "likes dogs",
    languages: "German, English"
    }])

2.times do |i|
  i = i + 1
  UserAnswer.create!([
    { user_id: i, answer_id: 1, question_id: 1 },
    { user_id: i, answer_id: 4, question_id: 2 },
    { user_id: i, answer_id: 9, question_id: 3 },
    { user_id: i, answer_id: 13, question_id: 4 },
    { user_id: i, answer_id: 17, question_id: 5 },
    { user_id: i, answer_id: 19, question_id: 6 },
    { user_id: i, answer_id: 22, question_id: 7 },
    { user_id: i, answer_id: 27, question_id: 8 },
    { user_id: i, answer_id: 30, question_id: 9 },
    { user_id: i, answer_id: 34, question_id: 10 },
    { user_id: i, answer_id: 37, question_id: 11 },
    { user_id: i, answer_id: 40, question_id: 12 },
    { user_id: i, answer_id: 42, question_id: 13 },
    { user_id: i, answer_id: 47, question_id: 14 },
    { user_id: i, answer_id: 51, question_id: 15 },
    { user_id: i, answer_id: 55, question_id: 16 },
    { user_id: i, answer_id: 57, question_id: 17 },
    { user_id: i, answer_id: 59, question_id: 18 },
    { user_id: i, answer_id: 62, question_id: 19 },
    { user_id: i, answer_id: 65, question_id: 20 }
    ])
end

# Creates other seed accounts

18.times do
  seed_username = Faker::Internet.user_name
  while User.all.pluck("username").include?(seed_username)
    seed_username = Faker::Internet.user_name
  end
  seed_pass = Faker::Internet.password(6)
  seed_email = Faker::Internet.free_email
  seed_country = Faker::Address.country
  seed_zip = Faker::Address.zip_code
  seed_avatar = Api::UsersController.new.process_uri(UIFaces::face)
  seed_orientation = orientation[rand(orientation.length)]
  seed_gender = gender[rand(gender.length)]

  User.create!({ username: seed_username, email: seed_email, password_digest:
    BCrypt::Password.create(seed_pass), session_token: SecureRandom.urlsafe_base64,
    orientation: seed_orientation, gender: seed_gender, country:
    seed_country, zip_code: seed_zip, avatar: seed_avatar})
end

18.times do |i|
  id = i + 3

  Profile.create!({
    user_id: id,
    self_sum: self_sum[rand(self_sum.length)],
    life_sum: life_sum[rand(life_sum.length)],
    skills: skills[rand(skills.length)],
    favorites: favorites[rand(favorites.length)],
    needs: needs[rand(needs.length)],
    thoughts: thoughts[rand(thoughts.length)],
    fun_acts: fun_acts[rand(fun_acts.length)],
    msg_reason: msg_reason[rand(msg_reason.length)]
  })

  Preference.create!({
    target_people: target_people[rand(target_people.length)],
    target_age_range: rand(18..30).to_s + " to " + rand(30..50).to_s,
    target_location: target_location[rand(target_location.length)],
    target_purpose: target_purpose[rand(target_purpose.length)],
    user_id: id
  })

  UserAnswer.create!([{ user_id: id, answer_id: rand(1..2), question_id: 1},
    { user_id: id, answer_id: rand(3..6), question_id: 2},
    { user_id: id, answer_id: rand(7..10), question_id: 3},
    { user_id: id, answer_id: rand(11..14), question_id: 4},
    { user_id: id, answer_id: rand(15..17), question_id: 5},
    { user_id: id, answer_id: rand(18..20), question_id: 6},
    { user_id: id, answer_id: rand(21..25), question_id: 7},
    { user_id: id, answer_id: rand(26..28), question_id: 8},
    { user_id: id, answer_id: rand(29..31), question_id: 9},
    { user_id: id, answer_id: rand(32..34), question_id: 10},
    { user_id: id, answer_id: rand(35..38), question_id: 11},
    { user_id: id, answer_id: rand(39..41), question_id: 12},
    { user_id: id, answer_id: rand(42..44), question_id: 13},
    { user_id: id, answer_id: rand(45..48), question_id: 14},
    { user_id: id, answer_id: rand(49..52), question_id: 15},
    { user_id: id, answer_id: rand(53..55), question_id: 16},
    { user_id: id, answer_id: rand(56..58), question_id: 17},
    { user_id: id, answer_id: rand(59..61), question_id: 18},
    { user_id: id, answer_id: rand(62..63), question_id: 19},
    { user_id: id, answer_id: rand(64..65), question_id: 20}
  ])
end

questions = Question.create!([{ prompt: 'Do you believe that everything happens for a reason?'},
  { prompt: 'Do you like to be the center of attention?'},
  { prompt: 'How tall are you?'},
  { prompt: 'In terms of relationships, which of these is the most important to find?'},
  { prompt: 'Would you date someone who was only interested in a committed, long-term relationship?'},
  { prompt: 'Are you friends with mostly men or mostly women?'},
  { prompt: 'Not to be racist but which ethnicity do you find to be most attractive?'},
  { prompt: 'Do you keep your sexual exploits private?'},
  { prompt: 'Are you more likely to assume someone of the opposite sex is flirting with you or just being nice?'},
  { prompt: 'Are you scared of commitment?'},
  { prompt: 'If you were involved in a serious relationship, at which of the following points would you being looking for new potential partners?'},
  { prompt: 'If you took nude photos of your lover, would you give them the prints and negatives (or destroy them) if you broke up?'},
  { prompt: 'Suppose a close friend\'s partner is very attractive and thinks you\'re attractive, too. If you could enjoy a few hours of sex with them and your friend would never find out about it, would you do it?'},
  { prompt: 'How do you feel about germs?'},
  { prompt: 'Would you consider being part of a committed polyamorous relationship (i.e., three or ore people but no sex outside of the group)?'},
  { prompt: 'Your friends are:'},
  { prompt: 'What is your position on hunting?'},
  { prompt: 'Is it wrong to cultivate or manufacture illegal drugs?'},
  { prompt: 'Do you try to draw attention to your body by wearing seductive clothing?'},
  { prompt: 'Do you ever feel the need to pick at other people\'s blemishes?'}])

# question-answer ranges
# q1 => (1..2)
# q2 => (3..6)
# q3 => (7..10)
# q4 => (11..14)
# q5 => (15..17)
# q6 => (18..20)
# q7 => (21..25)
# q8 => (26..28)
# q9 => (29..31)
# q10 => (32..34)
# q11 => (35..38)
# q12 => (39..41)
# q13 => (42..44)
# q14 => (45..48)
# q15 => (49..52)
# q16 => (53..55)
# q17 => (56..58)
# q18 => (59..61)
# q19 => (62..63)
# q20 => (64..65)

Answer.create!([{ question_id: 1, content: 'Yes'},
  { question_id: 1, content: 'No'},
  { question_id: 2, content: 'Yes, Always'},
  { question_id: 2, content: 'Yes, sometimes'},
  { question_id: 2, content: 'Not really, no'},
  { question_id: 2, content: 'Definitely not'},
  { question_id: 3, content: '5ft 3in (1.61m) or shorter'},
  { question_id: 3, content: '5ft 4in to 5ft 8n (1.62 to 1.74m)'},
  { question_id: 3, content: '5ft 9in to 6ft 1in (1.74 to 1.86m)'},
  { question_id: 3, content: '6ft 2in or taller (1.87m)'},
  { question_id: 4, content: 'Someone for whom you would do anything.'},
  { question_id: 4, content: 'Someone who turns you on.'},
  { question_id: 4, content: 'Someone you feel like you\'ve known forever.'},
  { question_id: 4, content: 'Someone with goals similar to yours.'},
  { question_id: 5, content: 'Yes'},
  { question_id: 5, content: 'No'},
  { question_id: 5, content: 'I\'m not sure'},
  { question_id: 6, content: 'Mostly men'},
  { question_id: 6, content: 'Mostly women'},
  { question_id: 6, content: 'It\'s pretty mixed'},
  { question_id: 7, content: 'White'},
  { question_id: 7, content: 'Black'},
  { question_id: 7, content: 'Latino'},
  { question_id: 7, content: 'Asian/Indian'},
  { question_id: 7, content: 'Igbo'},
  { question_id: 8, content: 'Yes, always.'},
  { question_id: 8, content: 'No, I\'m an open book.'},
  { question_id: 8, content: 'Sometimes.'},
  { question_id: 9, content: 'People constantly flirt with me.'},
  { question_id: 9, content: 'Being nice doesn\'t mean flirting.'},
  { question_id: 9, content: 'I\'m oblivious when it comes to interaction.'},
  { question_id: 10, content: 'Yes'},
  { question_id: 10, content: 'No'},
  { question_id: 10, content: 'I\'m not sure'},
  { question_id: 11, content: 'When the relationship was not going well.'},
  { question_id: 11, content: 'When I was certain the relationship was ending.'},
  { question_id: 11, content: 'After the relationship was formally terminated.'},
  { question_id: 11, content: 'All of the time.'},
  { question_id: 12, content: 'Yes'},
  { question_id: 12, content: 'No'},
  { question_id: 12, content: 'I\'m Not Sure'},
  { question_id: 13, content: 'Yes'},
  { question_id: 13, content: 'No'},
  { question_id: 13, content: 'Maybe'},
  { question_id: 14, content: 'Obsessed: I bleach anything I can\'t trust!'},
  { question_id: 14, content: 'Careful: I was my hands and cover my sneezes.'},
  { question_id: 14, content: 'Polite: I always wash up when someone\'s watching'},
  { question_id: 14, content: 'Unconcerned: I don\'t actively lick doorknobs.'},
  { question_id: 15, content: 'Yes, I like that type of polygamy.'},
  { question_id: 15, content: 'I could be convinced by the right people.'},
  { question_id: 15, content: 'I am commited to total monogamy.'},
  { question_id: 15, content: 'I have open relationships only.'},
  { question_id: 16, content: 'mostly guys'},
  { question_id: 16, content: 'mostly girls'},
  { question_id: 16, content: 'both guys and girls'},
  { question_id: 17, content: 'I approve of hunting for food and sport.'},
  { question_id: 17, content: 'I approve of hunting for food only.'},
  { question_id: 17, content: 'I do not approve of hunting at all.'},
  { question_id: 18, content: 'Yes, always'},
  { question_id: 18, content: 'No, never'},
  { question_id: 18, content: 'Sometimes'},
  { question_id: 19, content: 'Yes'},
  { question_id: 19, content: 'No'},
  { question_id: 20, content: 'Yes'},
  { question_id: 20, content: 'No'},])
