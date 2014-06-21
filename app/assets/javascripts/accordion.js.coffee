$ ->

  accordionItem = $('#accordion')

  $('#accordion dl').hide()
  console.log 'aaa'

  accordionItem.find('h3').click ->
    $(@).toggleClass('active')
    hitItem = $(this).next()
    openItem = hitItem.siblings('dl:visible')
    if openItem.length
      openItem.prev().removeClass('active')
      openItem.slideUp 'fast',()=>
        hitItem.slideToggle('fast')
    else
      hitItem.slideToggle('fast')
