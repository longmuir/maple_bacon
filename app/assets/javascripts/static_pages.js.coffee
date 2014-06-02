$ ->
  $("#piggy").mouseover(->
    $(".right-arm-wave", this).addClass()
    $(".left-arm").addClass "move"
    $(".right-arm").addClass "move2"
    return
  ).mouseleave ->
    $ ".right-arm"
    $(".left-arm").removeClass "move"
    $(".right-arm").removeClass "move2"
    return
