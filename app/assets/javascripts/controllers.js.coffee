# App Controllers

window.PhotoGalleryCtrl = ($route, $http) ->
  token = $("meta[name='csrf-token']").attr('content')

  $httpProvider.defaults.headers.post['X-CSRF-Token'] = token;
  $http.defaults.headers.put['X-CSRF-Token'] = token;
  $http.defaults.headers['delete']['X-CSRF-Token'] = token;

  $http.defaults.headers.post['Content-Type'] = 'application/json'
  $http.defaults.headers.put['Content-Type'] = 'application/json'

  $route
    .when("/photographers",
      controller: PhotographersCtrl
      template: "/assets/photographers.html")
    .when("/photographers/:photographer_id/galleries",
      controller: GalleriesCtrl
      template: "/assets/galleries.html")
    .when("/photographers/:photographer_id/galleries/:gallery_id/photos",
      controller: PhotosCtrl
      template: "/assets/photos.html")
    .otherwise(redirectTo: '/photographers')

PhotoGalleryCtrl.$inject = ['$route', '$http']



PhotographersCtrl = ['Photographers', (Photographers) ->
  @photographers = Photographers.index()
]

GalleriesCtrl = [
  'Galleries', 'Photographers', '$routeParams',
  (Galleries, Photographers, $routeParams) ->
    @photographer = Photographers.get(photographer_id: $routeParams.photographer_id)
    @galleries = Galleries.index(photographer_id: $routeParams.photographer_id)
]

PhotosCtrl = [
  'Photos', 'Galleries', 'Photographers', 'SelectedPhotos', '$routeParams',
  (Photos, Galleries, Photographers, SelectedPhotos, $routeParams) ->
    @photographer = Photographers.get(photographer_id: $routeParams.photographer_id)
    @gallery = Galleries.get(photographer_id: $routeParams.photographer_id, gallery_id: $routeParams.gallery_id)
    @photos = Photos.index(photographer_id: $routeParams.photographer_id, gallery_id: $routeParams.gallery_id)
    @selected_photos = SelectedPhotos.index()

    @selectPhoto = (photo) =>
      selected_photo = new SelectedPhotos(selected_photo: {photo_id: photo.id})
      selected_photo.$create => @selected_photos.push(selected_photo)

    @deleteSeletedPhoto = (selected_photo) =>
      angular.Array.remove(@selected_photos, selected_photo)
      selected_photo.$destroy(selected_photo_id: selected_photo.id)

    @saveSelectedPhoto = (selected_photo) =>
      selected_photo.$update(selected_photo_id: selected_photo.id)
      $('input').blur()
]
