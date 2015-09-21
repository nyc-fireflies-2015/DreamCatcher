def populate_steps
  Step.create(description: "Upon awakening, remain absolutely still while you recall the essential elements of the dream and log it in DreamCatcher.", default: true)
  Step.create(description: "Wear a digital watch and read the words or numbers on the watch. If the characters are normal, stable, and sensible, then you probably aren't dreaming.", default: true)
  Step.create(description: "Look for dream signs (elements that indicate that you are dreaming).", default: true)
  Step.create(description: "Awaken one hour earlier than usual, stay awake for 30 to 60 minutes, then go back to sleep.", default: true)
  Step.create(description: "Imagine your surroundings are a dream. Intently imagine that what you are seeing, hearing, smelling, and feeling is all a dream.", default: true)
  Step.create(description: "Try to fly! If it works, you're most likely dreaming", default: true)
end
