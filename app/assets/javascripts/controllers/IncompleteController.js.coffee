angular.module('todoApp').controller "IncompleteController", ($scope, $timeout, $routeParams, $location, Incomplete) ->

  $scope.init = ->
    @incompleteService = new Incomplete(serverErrorHandler)
    $scope.tasks = @incompleteService.all()

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")