# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  $("form.edit_shorter").submit ->
    dataSet = $(this).serialize()
    $.ajax $(this).attr('action')+".json",
      type: 'POST'
      data: dataSet
      dataType: 'html'
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        data = JSON.parse(data)
        alert(data.message)

    return false

  $("form.new_shorter").submit ->
    dataSet = $(this).serialize()
    $.ajax $(this).attr('action')+".json",
      type: 'POST'
      data: dataSet
      dataType: 'html'
      error: (jqXHR, response, errorThrown) ->
        errors = JSON.parse(jqXHR.responseText)
        text = ''
        for key, value of errors
          text += capitaliseFirstLetter(key)+" "+value+ "\n"
        alert(text)
      success: (data, textStatus, jqXHR) ->
        data = JSON.parse(data)
        showNewUrl(data.url)

    return false



capitaliseFirstLetter = (string) ->
  string.charAt(0).toUpperCase() + string.slice(1);

showNewUrl = (url) ->
  $("#new_url a").attr("href", url).text(url)
