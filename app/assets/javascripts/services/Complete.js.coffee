angular.module('todoApp').factory 'Complete', ($resource, $http) ->
  class Complete
    constructor: ( errorHandler) ->
      @service = $resource('/api/complete',
        {})
      @errorHandler = errorHandler


    all: ->
      @service.query((-> null), @errorHandler)
