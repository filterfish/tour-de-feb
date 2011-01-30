class Preference < ActiveRecord::Base
  belongs_to :user

  def group=(group)
    if group && group.length > 0
      g = Group.where(['name ~* ?', group]).first
      if g.nil?
        g = Group.create(:name => group)
      end
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
