#= require_self
#= require services
#= require controllers
#= require filters
#= require widgets

window.galleryModule = angular.module('gallery', ['galleryServices', 'galleryWidgets'])
  .config [ '$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/photographers',
        controller: PhotographersCtrl
        templateUrl: '/assets/photographers.html')
      .when('/photographers/:photographer_id/galleries',
        controller: GalleriesCtrl
        templateUrl: '/assets/galleries.html')
      .when('/photographers/:photographer_id/galleries/:gallery_id/photos',
        controller: PhotosCtrl
        templateUrl: '/assets/photos.html')
      .otherwise(redirectTo: '/photographers')
  ]
