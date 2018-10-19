module DecafSucks
  module Persistence
    module Relations
      class Reviews < ROM::Relation[:sql]
        schema :reviews, infer: true
      end
    end
  end
end
