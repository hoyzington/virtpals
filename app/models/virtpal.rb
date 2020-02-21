class Virtpal < ActiveRecord::Base

  belongs_to :creator

  @@options = {"color" => {"blue" => "00F",
                           "red" => "F00",
                           "green" => "090"},
                          
               "height" => {"short" => 0,
                            "medium" => 1,
                            "tall" => 2},
                          
               "build" => {:head => {"skinny" => [" ", [" ", ""]],
                                     "medium" => [" ", [" ", ""]],
                                     "fat" => ["_", ["", " "]]},
                           :body => {"skinny" => ["  ", "", ""],
                                     "medium" => [" ", " ", "_"],
                                     "fat" => ["", "  ", "__"]}},
                                    
               "mood" => {"happy" => [" ^ ^", "  = ", "X", "X"],
                          "silly" => ["O  ^", "( ~)", "}", "{"],
                          "stoked" => ["o`'o", " <> ", "d", "b"]}}

  def self.options
    @@options
  end

  def settings
    @top = @@options["build"][:head][self.build][0]
    @hs_a = @@options["build"][:head][self.build][1][0]
    @hs_b = @@options["build"][:head][self.build][1][1]
    @eyes = @@options["mood"][self.mood][0]
    @mouth = @@options["mood"][self.mood][1]
    @bs_a = @@options["build"][:body][self.build][0]
    @bs_b = @@options["build"][:body][self.build][1]
    @hand_a = @@options["mood"][self.mood][2]
    @hand_b = @@options["mood"][self.mood][3]
    @btm = @@options["build"][:body][self.build][2]
    @h = @@options["height"][self.height]
    @color = @@options["color"][self.color]
  end
  
  def creation
    build = []
    build[0] = "          " + @top + "__" + @top
    build[1] = "         " + @hs_a + "/" + @hs_b + "  " + @hs_b + "\\"
    build
  end

end