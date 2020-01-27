class CatRentalRequest < ApplicationRecord
    validates :cat_id, :start_date, :end_date, :status, presence:true
    validates :status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED']}
    belongs_to :cat

    def overlapping_requests
        CatRentalRequest
            .where(cat_id: self.cat_id)
            .where("start_date <= ?", self.end_date)
            .where("end_date >= ?", self.start_date)
            .where.not(id: self.id)
    end

    def overlapping_approved_requests
        overlapping_requests
            .where(status: "APPROVED")
    end

    def does_not_overlap_approved_requests
        !overlapping_approved_requests.exists?
    end

    def overlapping_pending_requests
        overlapping_requests
            .where(status: "PENDING")
    end

    def approve!
        self.update(status: "APPROVED")
        opr = overlapping_pending_requests.each do |request|
            request.update(status:'DENIED')
        end
    
    end

    def deny!
        self.update(status: "DENIED")
    end

    def pending?
        self.status == 'PENDING'
    end
end
