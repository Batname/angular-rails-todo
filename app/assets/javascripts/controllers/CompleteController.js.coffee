angular.module('todoApp').controller "CompleteController", ($scope, $timeout, $routeParams, $location, Complete) ->

  $scope.init = ->
    @completeService = new Complete(serverErrorHandler)
    $scope.tasks = @completeService.all()

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")