class CatRentalRequest < ApplicationRecord
    validates :cat_id, :start_date, :end_date, :status, presence:true
    validates :status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED']}
    belongs_to :cat

    def overlapping_requests
        CatRentalRequest
            .where(cat_id: self.cat_id)
            .where("start_date <= ?", self.end_date)
            .where("end_date <= ?", self.start_date)
    end

    def overlapping_approved_requests
        overlapping_requests
            .where(status: "APPROVED")
    end

    def does_not_overlap_approved_requests
        !overlapping_approved_requests.exists?
    end
end
