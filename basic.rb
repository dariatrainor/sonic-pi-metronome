beats_per_bar = 4
clicks_per_beat = 4
use_bpm 100



clicks_per_bar = clicks_per_beat * beats_per_bar
sleep_value = 1.0/clicks_per_beat

live_loop :metronome do
  clicks_per_beat.times do
    tick
    
    if look % clicks_per_bar == 0
      amplitude = 3
    else
      amplitude = 1
    end
    
    sample :elec_tick, amp: amplitude
    sleep sleep_value
  end
end