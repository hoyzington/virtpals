class Virtpal < ActiveRecord::Base

  belongs_to :creator

  @@options = {“color” => {“blue” => “.colorize(:light_blue)”,
                            “red” => “.colorize(:red)”,
                            “green” => “.colorize(:light_green)”},
                
                “height” => {“short” => 0,
                             “medium” => 1,
                             “tall” => 2},
                             
                “build” => [{:head => {“skinny” => [“ “, [1, 0, 0, 1]],
                                       “medium” => [“ “, [1, 0, 0, 1]],
                                       “fat” => [“_”, [0, 1, 1, 0]]}},
                            {:body => {“skinny” => [2, 0, 0, 2],
                                       “medium” => [1, 1, 1, 1],
                                       “fat” => [0, 2, 2, 0]}}],

                “mood” => {“happy” => [“ ^ ^”, “X”, “  = ”, “X”]
                           “silly” => [“O  ^”, “}”, “( ~)”, “{“]
                           “stoked” => [“ > <”, “d”, “ <> ”, “b”]}
  
  def initialize

  end

  def settings

  end
  
  def builder(settings)

  end


end