class Flight
    attr_reader :passengers
    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @capacity = capacity
        @passengers = []
    end
   
    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        if !full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        self.passengers.map{|passenger| passenger.name}
    end

    def [](idx)
        self.passengers[idx]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end