module DecafSucks
  module Web
    module View
      class Context
        attr_reader :attrs

        def initialize(attrs = {})
          @attrs = attrs
        end

        def assets
          self[:assets]
        end

        def csrf_token
          self[:csrf_token]
        end

        def flash
          self[:flash]
        end

        def flash?
          %i[notice alert].any? { |type| flash[type] }
        end

        def with(new_attrs)
          self.class.new(attrs.merge(new_attrs))
        end

        private

        def [](name)
          attrs.fetch(name)
        end
      end
    end
  end
end
