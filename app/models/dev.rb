class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one? (item_name)
        !!self.freebies.find_by(item_name: item_name)
    end

    def give_away(dev, freebie)
        if self.id == freebie.dev_id
            freebie.update(dev_id: dev.id)
        else
            "Can't give away this freebie"
        end
    end

end
