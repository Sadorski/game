require "gosu"

class Sprite
    def initialize window 
        # @window = window
        @width = @height = 160
        #@idle = Gosu::Image.new.load_tiles @window,
                                            #@window, "player.png"
                                            #@width, @height, true
        #@move = Gosu::Image.new.load_tiles @window,
                                            #@window, "player.png"
                                            #@width, @height, true
        #@x = @window.width/2 - @image.width/2
        #@y = @window.height/2 - @image.height/2
        @direction = :right
        @frame
        @moving = false
    end

    def update
        @frame += 1
        @moving = false
        if @window.button_down? Gosu::KbLeft
            @direction = :left
            @moving = true 
            @x += -5 
        end
        if @window.button_down? Gosu::KbRight
            @direction = :right 
            @moving = true
            @x += 5 
        end
    end

    def draw
        f = @frame % @idle.size
        image = @moving ? @move[f] : @idle[f]
        if @direction == :right 
            @image.draw @x, @y, 1
        else 
            @image.draw @x + @image.width, @y, 1, -1, 1
        end
    end

end


class SpriteGame < Gosu::Window
    def initialize(width=800, height=600, full=false)
        super
    end
end
SpriteGame.new.show