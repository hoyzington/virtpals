a = Creator.new(username: "Spikehead", password: "password")

b = Creator.new(username: "Baldy", password: "password")


c = Virtpal.new(name: "Kinchlow", color: 'green', height: 'tall', build: 'skinny', mood: 'happy')
c.creator = a
c.save

d = Virtpal.new(name: "Babby", color: 'red', height: 'short', build: 'medium', mood: 'silly')
d.creator = a
d.save

e = Virtpal.new(name: "Foofoo", color: 'blue', height: 'medium', build: 'fat', mood: 'stoked')
e.creator = b
e.save

f = Virtpal.new(name: "George", color: 'blue', height: 'short', build: 'fat', mood: 'silly')
f.creator = b
f.save