# App Controllers

window.PhotoGalleryCtrl = ->

window.PhotographersCtrl = ($scope, Photographer) ->
  $scope.photographers = Photographer.query()

PhotographersCtrl.$inject = ['$scope', 'Photographer']

window.GalleriesCtrl = ($scope, Gallery, Photographer, $routeParams) ->
  $scope.photographer = Photographer.get(photographer_id: $routeParams.photographer_id)
  $scope.galleries = Gallery.query(photographer_id: $routeParams.photographer_id)
GalleriesCtrl.$inject = ['$scope', 'Gallery', 'Photographer', '$routeParams']

window.PhotosCtrl = ($scope, Photo, Gallery, Photographer, SelectedPhoto, $routeParams) ->
  $scope.photographer = Photographer.get(photographer_id: $routeParams.photographer_id)
  $scope.gallery = Gallery.get(photographer_id: $routeParams.photographer_id, gallery_id: $routeParams.gallery_id)
  $scope.photos = Photo.query(photographer_id: $routeParams.photographer_id, gallery_id: $routeParams.gallery_id)
  $scope.selected_photos = SelectedPhoto.query()


  $scope.selectPhoto = (photo) ->
    selected_photo = new SelectedPhoto(selected_photo: {photo_id: photo.id})
    selected_photo.$save -> $scope.selected_photos.push(selected_photo)

  $scope.deleteSelectedPhoto = (selected_photo) ->
    $scope.selected_photos.splice($scope.selected_photos.indexOf(selected_photo), 1)
    selected_photo.$delete(selected_photo_id: selected_photo.id)

  $scope.saveSelectedPhoto = (selected_photo) ->
    selected_photo.$update(selected_photo_id: selected_photo.id)
    $('input').blur()

PhotosCtrl.$inject = ['$scope', 'Photo', 'Gallery', 'Photographer', 'SelectedPhoto', '$routeParams']
