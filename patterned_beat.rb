#Config. Set the values of the metronome here

#Number of beats per bar (e.g. 4 beats per bar, 1 beat per bar)
beats_per_bar = 4

#Number of beats per minute
use_bpm 70

#Accent the first note of the bar (true to accent, false to not accent)
accent_first = true

# Pattern for the beat (e.g. 1-1-, 1-1, 11--). 1 to play the beat, - to skip the beat
clicks_per_beat = "1-1"

#----------------------------------------------------------------------
define :check_beat do |pat|
  (ring
   *pat
   .split(" ")
   .map{|bar| bar.split("")}
   .flatten
   .map{|d| d=="1" ? 1 : 0})
end

clicks_per_bar = clicks_per_beat.length * beats_per_bar
sleep_value = 1.0/clicks_per_beat.length

live_loop :metronome do
  clicks_per_beat.length.times do |i|
    tick
    
    if accent_first && (look % clicks_per_bar == 0)
      amplitude = 6
    else
      amplitude = 1
    end
    
    #check with the pattern if we need to play the tick
    if (check_beat(clicks_per_beat).look == 1)
      sample :elec_tick, amp: amplitude
    else
      sleep sleep_value
    end
    
    sleep sleep_value
  end
end
