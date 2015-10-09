class Subject < ActiveRecord::Base
    
    scope :visible, lambda { where(:visible => ture) }
    scope :invisible, lambda { where(:visible => false) }
    scope :sorted, lambda { order("subjects.position ASC") }
    scope :newest_first, lambda { order("subjects.created_at DESC") }
    scope :search, lambda {|query|
      where(["name LIKE ?", "%#{query}%"])
    }
    
end
