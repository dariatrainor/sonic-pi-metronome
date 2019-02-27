#Config. Set the values of the metronome here

#Number of beats per minute
bpm = 50

# Pattern for the beat 1 to play the beat, 0 to skip the beat, any other positive integer for the amplitude
clicks_per_beat = (ring 3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

# Randomly mutes beats. The bigger the number, the more beats will be muted. Set to 1 to not mute at all
mute_probability = 1

#----------------------------------------------------------------------

sleep_value = 1.0/clicks_per_beat.length

live_loop :metronome do
  use_bpm bpm
  clicks_per_beat.length.times do
    tick
    
    sample :elec_flip, amp: clicks_per_beat.look if  (clicks_per_beat.look > 0) || one_in(mute_probability)
    
    sleep sleep_value
  end
end