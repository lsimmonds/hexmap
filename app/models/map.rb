class Map < ActiveRecord::Base
  include Authority::Abilities
  resourcify
  has_many :countries
  before_save :set_creator

  def set_creator
    if defined? current_user
      self.new_record? && self.creator=current_user
      self.updater=current_user
    end
  end

  def hex_images
    images=[]
    Dir.glob("app/assets/images/hex_*.{jpg,png,gif}").each do |image|
      images.push({:name => image[0,image.length-4].gsub(/.*\/hex_/,'').gsub(/[-_](.)/){$1.upcase},
                   :display => image[0,image.length-4].gsub(/.*\/hex_/,'').split(/[-_]/).map { |w| w.capitalize }.join(" "),
                   :path => image});
    end
    return images
  end

  def addon_images
    images=[]
    Dir.glob("app/assets/images/adn_*.{jpg,png,gif}").each do |image|
      images.push({:name => image[0,image.length-4].gsub(/.*\/adn_/,'').gsub(/[-_](.)/){$1.upcase},
                   :display => image[0,image.length-4].gsub(/.*\/adn_/,'').split(/[-_]/).map { |w| w.capitalize }.join(" "),
                   :path => image});
    end
    return images
  end

  def mbu_images
    images=[]
    Dir.glob("app/assets/images/mbu_*.{jpg,png,gif}").each do |image|
      images.push({:name => image[0,image.length-4].gsub(/.*\/mbu_/,'').gsub(/[-_](.)/){$1.upcase},
                   :display => image[0,image.length-4].gsub(/.*\/mbu_/,'').split(/[-_]/).map { |w| w.capitalize }.join(" "),
                   :path => image});
    end
    return images
  end
end
