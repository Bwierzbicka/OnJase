
SavedItem.destroy_all
Phrase.destroy_all
Word.destroy_all
User.destroy_all

user = User.create!(
  email: "test@example.com",
  password: "password123",
  password_confirmation: "password123"
)

word1 = Word.create!(
  french: "maison",
  english: "house",
  definition: "A building used as a home",
  word_type: "noun"
)

word2 = Word.create!(
  french: "courir",
  english: "to run",
  definition: "To move swiftly on foot",
  word_type: "verb"
)

phrase1 = Phrase.create!(
  french: "Bonjour, comment ça va ?",
  english: "Hello, how are you?"
)

phrase2 = Phrase.create!(
  french: "Je ne comprends pas",
  english: "I don't understand"
)

SavedItem.create!(user: user, saveable: word1)
SavedItem.create!(user: user, saveable: word2)
SavedItem.create!(user: user, saveable: phrase1)
SavedItem.create!(user: user, saveable: phrase2)
