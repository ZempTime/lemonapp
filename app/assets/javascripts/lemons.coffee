$(document).on "turbolinks:load", ->
  $("[data-behavior='inline-lemon-edit-button']").on "click", (event) ->
    event.preventDefault()
    $.ajax
      url: $(this).data("form-url")
      dataType: "script"
