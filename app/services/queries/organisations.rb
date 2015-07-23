module Queries
  module Organisations

    def self.order_by_most_recent
      # users included for later query about icon size
      Organisation.includes(:users).order_by_most_recent
    end

    def self.search_by_keyword_and_category(parsed_params)
      organisations = order_by_most_recent.search_by_keyword(
        parsed_params.query_term
      )

      if parsed_params.what_who_how_ids.any?
        organisations.filter_by_categories(
          parsed_params.what_who_how_ids
        )
      else
        organisations
      end
    end

    FORMAT = '%Y-%m-%d %H:%M:%S.%N'

    def self.add_recently_updated_and_has_owner(organisations)
      if organisations.method(:select).arity == 0
        return add_recently_update_and_has_owner_to_enumerable(organisations)
      end
      one_year_ago = Time.current.advance(years: -1)
      recently_updated = "organisations.updated_at > '#{one_year_ago.strftime(FORMAT)}'"
      # recently_updated = "organisations.updated_at > #{one_year_ago.strftime}"
      has_owner = "organisations.id IN (SELECT users.organisation_id FROM users)"
      condition =
        "CASE WHEN #{recently_updated} AND #{has_owner} THEN TRUE ELSE FALSE END"
      organisations
        .select("organisations.*, (#{condition}) as recently_updated_and_has_owner")
    end

  private
    def self.add_recently_update_and_has_owner_to_enumerable(organisations)
      organisations.each do |o|
        o.instance_eval %{
            def recently_updated_and_has_owner
              !not_updated_recently? && !self.users.empty?
            end
         }
      end
      return organisations
    end
  end
end
