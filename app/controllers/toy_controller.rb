module ToyController
  def self.index
    [
      {name:     "Finn McMissle",
       material: "diecast",
       talking:   true,
       size:     "normal"},
      {name:     "Lightning McQueen",
       material: "diecast",
       talking:   false,
       size:     "normal"},
      {name:     "Mater",
       material: "diecast",
       talking:   true,
       size:     "normal"}
    ]
  end
end
