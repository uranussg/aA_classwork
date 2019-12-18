class Student
    def initialize(first, last)
        @first_name = first
        @last_name = last
        @courses = []
    end

    def first_name
        @first_name
    end

    def last_name
        @last_name

    end

    def courses
        @courses
    end
    
    def name 
        @first_name + ' ' + @last_name
    end

    def enroll(c)
        raise 'error' if @courses.any? { |ele| ele.conflicts_with?(c) }
        if !@courses.include?(c)
            c.students << self 
            @courses << c 
        end
    end
    
    def course_load
        h = Hash.new(0)
        @courses.each do |course|
            h[course.department] += course.credits
        end
        h
    end
    
end

