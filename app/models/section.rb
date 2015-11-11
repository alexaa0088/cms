class Section < ActiveRecord::Base
    
    belongs_to :page
    has_many :section_edits
    has_many :editors, :through => :section_edits, :class_name => "AdminUser"
    
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
    acts_as_list :scope => :page
    
    after_save :touch_page
    
    
    CONTENT_TYPES = ['text', 'HTML']

    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates_inclusion_of :content_type, :in => CONTENT_TYPES,
    :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
    validates_presence_of :content

    
    scope :visible, lambda { where(:visible => true) }
    scope :invisible, lambda { where(:visible => false) }
    scope :sorted, lambda { order("sections.position ASC") }
    scope :newest_first, lambda { order("sections.created_at DESC")}
    
    private
    
    def touch_page
        # touch is similar to:
        # subject.update_attribute(:update_at, Time.now)
        page.touch
    end

    
end
