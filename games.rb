require 'gosu'

class HelloWorldGame < Gosu::Window
    def initialize(width=800, height=600, fullscreen=false)
        super
        self.caption = "Hello World!"
        @song = Gosu::Song.new self, "mking.mp3"
        # @sound = Gosu::Sample.new self, "name.mp3"
        @song.play
        @image = Gosu::Image.from_text self,
                        "Hey Tejas",
                        Gosu.default_font_name,
                        100
    end

    def button_down id
        close if id == Gosu::KbEscape
        #@sound.play if id == Gosu::KbX
    end


    def update
        @x = self.width/2 - @image.width/2 + Math.sin(Time.now.to_f)*150
        @y = self.height/2 - @image.height/2 + Math.cos(Time.now.to_f)*200
    end
    def draw
        @image.draw @x,
                    @y,
                    0

    end
end
HelloWorldGame.new.show