class PegDisplay
        COLOR_MAP = {
                1 => :red,
                2 => :blue,
                3 => :green,
                4 => :cyan,
                5 => :yellow,
                6 => :magenta
        }
        def self.show_peg(peg)
                color = COLOR_MAP[peg]
                "●".colorize(color)
        end

        def self.show_pegs(row)
                print "Pegs: "
                puts row.map { |peg| self.show_peg(peg) }.join(" ")
        end

        def self.display_feedback(result)
                pegs = result.shuffle.map do |color|
                        if color == 'white'
                                "●".colorize(:white)
                        else
                                "○".colorize(:white)
                        end
                end
                puts "Results: #{ pegs.join(' ')}"
        end
end
