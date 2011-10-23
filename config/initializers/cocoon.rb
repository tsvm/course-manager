module Cocoon
  module ViewHelpers
    def render_association(association, f, new_object)
      f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
        render('solutions/' + association.to_s.singularize + "_fields", :f => builder, :dynamic => true)
      end
    end
  end
end
