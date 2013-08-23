# http://docs.angularjs.org/#!angular.service
window.myAppModule = angular.module('myApp', [])

myAppModule.service 'Photographers', ($resource) ->
  $resource 'photographers/:photographer_id', {},
    index: {method: 'GET', isArray: true}

myAppModule.service 'Galleries', ($resource) ->
  $resource 'photographers/:photographer_id/galleries/:gallery_id', {},
    index: {method: 'GET', isArray: true}

myAppModule.service 'Photos', ($resource) ->
  $resource 'photographers/:photographer_id/galleries/:gallery_id/photos', {},
    index: {method: 'GET', isArray: true}

myAppModule.service 'SelectedPhotos', ($resource) ->
  $resource 'selected_photos/:selected_photo_id', {},
    index: {method: 'GET', isArray: true}
    create: {method: 'POST'}
    update: {method: 'PUT'}
    destroy: {method: 'DELETE'}
