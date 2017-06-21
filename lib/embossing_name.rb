module EmbossingName
  class EmbossingName
  require "active_support/inflector"
    
    class << self

      def normalize_name_to_embossing(full_name, size_name = 19)
      embossing_name = remove_accents(full_name)
      embossing_name = remove_abreviate(embossing_name)
      embossing_name = reduct_name(embossing_name, size_name)
      embossing_name = embossing_name.upcase[0..size_name]
      end

      def reduct_name(full_name, size_name = 19)
        if full_name.size > size_name
          full_name = full_name.split
          reduce_name = ""
          full_name.each_with_index { |n, i| reduce_name += (i == 0 || i == full_name.size-1 ? " #{n}" : " #{n[0]}") }
          reduce_name[1...reduce_name.size]
        else
          full_name
        end
      end

      def remove_abreviate(name_card)
        name_card = name_card.split
        abreviate = ['da', 'do', 'das', 'dos']
        abreviate.each { |ab| name_card.delete(ab) }
        name_card.join(" ")
      end

      def remove_accents(full_name)
        ActiveSupport::Inflector.transliterate(full_name)
      end

    end
  end
end
