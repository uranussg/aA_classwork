class Item

    attr_reader :title, :deadline, :description, :done
    attr_writer :title, :description
    def self.valid_date(date_string)
        date = date_string.split('-')
        (1..12).include?(date[1].to_i) && (1..31).include?(date[2].to_i)
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date(deadline)
            @deadline = deadline
        else   
            raise "invalid date"
        end
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        if Item.valid_date(new_deadline)
            @deadline = new_deadline
        else   
            raise "invalid date"
        end
    end

    def toggle
        @done = !@done 
    end

end