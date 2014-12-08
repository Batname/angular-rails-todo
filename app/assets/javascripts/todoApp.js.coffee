todoApp = angular.module('todoApp', ['ngResource', 'ngRoute', 'mk.editablespan', 'ui.sortable'])


todoApp.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/', templateUrl: '/templates/todo.html', controller: 'IndexController'
  $routeProvider.when '/complete', templateUrl: '/templates/complete.html', controller: 'CompleteController'
  $routeProvider.when '/incomplete', templateUrl: '/templates/incomplete.html', controller: 'IncompleteController'

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
