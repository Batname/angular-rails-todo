angular.module('todoApp').factory 'Incomplete', ($resource, $http) ->
  class Complete
    constructor: ( errorHandler) ->
      @service = $resource('/api/incomplete',
        {})
      @errorHandler = errorHandler


    all: ->
      @service.query((-> null), @errorHandler)
