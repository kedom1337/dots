#!/usr/bin/fish

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color red
      echo '[n] '
    case insert
      set_color green
      echo '[i] '
    case replace_one
      set_color green
      echo '[r] '
    case visual
      set_color brmagenta
      echo '[v] '
    case '*'
      set_color red
      echo '[?] '
  end
  set_color normal
end
