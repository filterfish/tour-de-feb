class Preference < ActiveRecord::Base
  belongs_to :user

  def group=(group)
    if group
      g = Group.find_or_create_by_name(group)
      user.group_id = g.id
    else
      user.group_id = nil
    end
    user.save!
  end

  def group
    user.group.try(:name)
  end
end
