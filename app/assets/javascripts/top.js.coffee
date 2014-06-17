# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  $ ->

    accordionItem = $('#accordion')

    $('#accordion dl').hide()

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
