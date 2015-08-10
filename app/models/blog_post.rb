class BlogPost < ActiveRecord::Base
  include FakeSlug
  fake_slug_uses :id, :title

  # Blog posts ordered from most recent to most ancient
  default_scope -> { order(published: :desc) }

  # Only published blog posts
  scope :published, -> { where('published <= ?', DateTime.now) }

  # Author relation
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  # Fix for published time formatting
  include DatetimeAttributes
  datetime_attribute :published

  # Pagination using kaminari
  paginates_per 5

  # Blog post picture
  mount_uploader :picture, BlogPostPictureUploader

  # Validation attributes
  validates :title, :summary, :body, :author, presence: true
  validates :published, date: true
end
