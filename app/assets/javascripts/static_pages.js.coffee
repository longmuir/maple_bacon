$ ->
  $("#piggy").mouseover(->
    $(".left-arm").addClass "move2"
    $(".right-arm").addClass "move"
    return
  ).mouseleave ->
    $(".left-arm").removeClass "move2"
    $(".right-arm").removeClass "move"
    return
