
class jenkins::plugins::remove {

  ###
  ### my extra plugins: bye-bye.....
  ###

  $adios = [
#   'git',
#   'greenballs',
#   'chucknorris',
    'gravatar',
    'github-oauth',
  ]

  jenkins::plugin::remove { $adios : }


} # class

# vim:ft=puppet:


