
angular.module('galleryServices', ['ngResource'])
  .factory('Photographer', ($resource) -> $resource 'photographers/:photographer_id')
  .factory('Gallery', ($resource) -> $resource 'photographers/:photographer_id/galleries/:gallery_id')
  .factory('Photo', ($resource) -> $resource 'photographers/:photographer_id/galleries/:gallery_id/photos')
  .factory('SelectedPhoto', ($resource) ->
    $resource 'selected_photos/:selected_photo_id', {}, update: {method: 'PUT'})
