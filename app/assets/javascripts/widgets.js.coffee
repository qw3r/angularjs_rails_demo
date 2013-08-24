# http://docs.angularjs.org/#!angular.widget

angular.module('galleryWidgets', [])
  .directive 'myCycle', () ->
    link: ($scope, elem, attrs) ->
      $scope.$watch ->
        if $(elem).children().length
          $(elem).cycle
            fx: 'fade'
            speed: 500
            timeout: 3000
            pause: 1
            next: '#next'
            prev: '#prev'
