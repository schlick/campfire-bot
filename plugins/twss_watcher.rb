require 'twss'

class TwssWatcher < CampfireBot::Plugin
  on_message /.+/, :check_for_match
  
  def check_for_match(m)
    if TWSS(m[:message])
      m.speak("That's what she said!  ☺")
      # FIXME: it appears that the bot can't handle saying two things at once
      # not just limited to two actions per plugin but also across plugins
      # ie if two plugin events match both will trigger but the bot will crash and
      # stop listening for future events
      # m.play(random_sound)
    end
  end
  
  private
  
  # DEPRECATION WARNING: Array#rand is deprecated and will be removed in Rails 3. Use "random_element" instead
  # ALSO #sample is available in ruby 1.9 and #choice in ruby 1.8
  # TODO: how to handle this difference across versions? specify minimum version or allow for range? or make it work for all?
  def random_sound
    %w{ rimshot trombone crickets vuvuzela }.rand
  end
end