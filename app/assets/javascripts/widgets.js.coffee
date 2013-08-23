# http://docs.angularjs.org/#!angular.widget

myAppModule.directive 'my:cycle', (expr,el) ->
  (container) ->
    @$watch ->
      if $(container).children().length
        $(container).cycle
          fx: 'fade'
          speed: 500
          timeout: 3000
          pause: 1
          next: '#next'
          prev: '#prev'