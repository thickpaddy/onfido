module Onfido
  class Applicant < Resource
    def create(payload)
      post(
        url: url_for('applicants'),
        payload: payload
      )
    end

    def find(applicant_id)
      get(url: url_for("applicants/#{applicant_id}"), payload: {})
    end

    def all(opts={})
      opts = {page: 1, per_page: 20}.merge(opts)
      get(url: url_for("applicants?page=#{opts[:page]}&per_page=#{opts[:per_page]}"), payload: {})
    end
  end
end
