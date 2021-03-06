class Answer < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :question
  belongs_to :responder, class_name: "User"
  has_many :comments, as: :parent
  has_many :votes, as: :votable
  has_one :best_ques, class_name: "Question", foreign_key: :best_answer_id

  def order_comments
    comments = self.comments
    ordered_comments = comments.sort_by { |a| a.vote_count }.reverse

    return ordered_comments

  end

  def vote_count
    votes.where(liked: true).count - votes.where(liked: false).count
  end
end