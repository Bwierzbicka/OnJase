class FlashcardReviewService
  def self.review(word, quality)
    flashcard = Repetition::Flashcard.new(
      easiness_factor: word.easiness_factor,
      interval: word.interval,
      repetitions: word.repetitions
    )

    next_review = flashcard.recall(quality)

    word.update!(
      easiness_factor: flashcard.easiness_factor,
      interval: flashcard.interval,
      repetitions: flashcard.repetitions,
      next_review_at: next_review
    )
  end
end
