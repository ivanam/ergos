class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    setInterval (=>
        @crearNotificaciones()
      ), 10000

    if @notifications.length > 0
      @handleSuccess @notifications.data("notifications")
      $("[data-behavior='notification-items']").on "click", @handleClick

      setInterval (=>
        @getNewNotifications()
        @crearNotificacionesReuniones()
      ), 10000



  getNewNotifications: ->
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  crearNotificaciones: ->
    $.post '/notifications/verificar'


  crearNotificacionesReuniones: ->
    $.post '/notifications/verificarReuniones'

  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      method: "POST"
      success: ->
        $("[data-behavior='unread-count']").text(0)
    )

  handleSuccess: (data) =>
    if data.length > 0 
      items = $.map data, (notification) ->
        if notification.unread
          notification.template

      unread_count = 0
      $.each data, (i, notification) ->
        if notification.unread
          unread_count += 1
      if unread_count == 0
        $("[data-behavior='unread-count']").text(unread_count)
        $("[data-behavior='notification-items']").html("<p><center>No hay nuevas notificaciones</center></p>")
      else
        $("[data-behavior='unread-count']").text(unread_count)
        $("[data-behavior='notification-items']").html(items)

    else
      $("[data-behavior='unread-count']").text(0)
      $("[data-behavior='notification-items']").html("<p><center>No hay nuevas notificaciones</center></p>")


jQuery ->
  new Notifications

sleep = (ms) ->
  start = new Date().getTime()
  continue while new Date().getTime() - start < ms


