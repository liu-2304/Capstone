class Material < ActiveRecord::Base
	validates :name, :presence => true
	validates :material_type, :inclusion => { :in => ['Liquid', 'Metal', 'Misc', 'Mixture', 'Plastic', 'Rubber'], :message => "%{value} is not a valid type" }
	validates_uniqueness_of :name, scope: [:material_type]

	has_many :testfiles, dependent: :destroy
	has_one :properties, dependent: :destroy

	#attr_accessible :name, :material_type, :id

	filterrific(
	:default_settings => { :sorted_by => 'name_asc' },
	:available_filters => [:search_query, :sorted_by, :direction_order, :with_created_at_gte, :with_mat_type, :col_name, :range_query])

	def self.to_csv(options = {})
        	CSV.generate(options) do |csv|
			csv << column_names
			all.each do |material|
				csv << material.attributes.values_at(*column_names)
			end
		end
	end
#self.per_page = 100

	scope :search_query, lambda { |query|
	  return nil if query.blank?
	  #condition query, parse into individual keywords
	  terms = query.downcase.split(/\s+/)
	  #replace '*' with '%' for wildcard searches
	  #append '%' and remove duplicate '%'s
	  terms = terms.map { |e|
	    (e.sub('*', '%') + '%').gsub(/%+/, '%')
	  }
	  #configure number of OR conditions for provision of interpolation arguments
	  #need to adjust this if you change the number of OR conditions
	  num_or_conditions = 2
	  where(
	    terms.map {
	      or_clauses = [ "LOWER(materials.name) LIKE ?", "LOWER(materials.material_type)   LIKE ?"].join(' OR ')
	  "(#{ or_clauses })"}.join(' AND '),
	  *terms.map { |e| [e] * num_or_conditions }.flatten)
	  }
	
	def self.options_for_order
		[
			['asc'],
			['desc']
		]
	end

	scope :col_name, lambda { |colname|
	  @@column = colname.to_s
	  case colname.to_s
	  when /^desc$/
	    Material.col_name(session[:filterrific_materials].col_name.to_s)
	  else
	    order("materials.#{ colname.to_s } asc")
	  end
	}

	scope :direction_order, lambda { |direction|
	  Material.col_name('desc')
	}

	scope :sorted_by, lambda { |direction|
	  direction = (sort_option =~ /asc$/) ? 'asc' : 'desc'
	  case sort_option.to_s
	  when /^id_/
            order("materials.id #{ direction }")
	  when /^name_/
            order("LOWER(materials.name) #{ direction }")
	  when /^material_type_/
            order("materials.id #{ direction }")
	  when /^created_at_/
 	    order("materials.created_at #{ direction }")
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
	}

	scope :with_created_at_gte, lambda { |ref_date|
	  where('materials.created_at >= ?', ref_date)
       	}

	scope :sorted_by_type, lambda { |sort_option_type|
	  direction = (sort_option_type =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option_type.to_s
	  when /^type_/
	    order("materials.type")
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
	}

	scope :sorted_by_material_type, lambda { |material_type|
	  where(:material_type => [*material_type])
	}

	def self.options_for_sorted_by
	  [
	    ['Name (a-z)', 'name_asc'],
	    ['Date Added (most recent first)', 'created_at_desc'],
	    ['Date Added (oldest first)', 'created_at_asc'],
	  ]
	end

	def self.options_for_sorted_by_type
	  [
	    ['Liquid'],
	    ['Metal'],
	    ['Misc'],
	    ['Mixture'],
	    ['Plastic'],
	    ['Rubber']
	  ]
	end
	
	def decorated_created_at
	  created_at_to_date.to_s(:long)
	end
	
end
