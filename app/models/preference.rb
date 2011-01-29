class Preference < ActiveRecord::Base
  belongs_to :user

  def group=(group)
    if group && group.length > 0
      g = Group.find_or_create_by_name(group)
      user.group_id = g.id
    else
      user.group_id = nil
    end

    # There *really* ought to be some error checking here.
    user.save!
  end

  def group
    user.group.try(:name)
  end
end
