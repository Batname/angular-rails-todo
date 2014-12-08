angular.module('todoApp').controller "IndexController", ($scope, $timeout, $routeParams, $location, Task) ->
  $scope.sortMethod = 'priority'
  $scope.sortableEnabled = true

  $scope.init = ->
    @tasksService = new Task(serverErrorHandler)
    $scope.tasks = @tasksService.all()

  $scope.addTask = ->
    raisePriorities()
    task = @tasksService.create(description: $scope.taskDescription)
    task.priority = 1
    $scope.tasks.unshift(task)
    $scope.taskDescription = ""

  $scope.deleteTask = (task) ->
    lowerPrioritiesBelow(task)
    @tasksService.delete(task)
    $scope.tasks.splice($scope.tasks.indexOf(task), 1)

  $scope.toggleTask = (task) ->
    @tasksService.update(task, completed: task.completed)

  $scope.toggleTask = (task) ->
    @tasksService.update(task, completed: task.completed)

  $scope.taskEdited = (task) ->
    @tasksService.update(task, description: task.description)

  $scope.dueDatePicked = (task) ->
    @tasksService.update(task, due_date: task.due_date)

  $scope.priorityChanged = (task) ->
    @tasksService.update(task, priority: task.priority)
    updatePriorities()


  $scope.sortableOptions =
    update: (e, ui) ->
      domIndexOf = (e) -> e.siblings().andSelf().index(e)
      newPriority = domIndexOf(ui.item) + 1

      task = ui.item.scope().task
      task.priority = newPriority

      $scope.priorityChanged(task)

  $scope.changeSortMethod = (sortMethod) ->
    $scope.sortMethod = sortMethod
    if sortMethod == 'priority'
      $scope.sortableEnabled = true
    else
      $scope.sortableEnabled = false

  $scope.dueDateNullLast = (task) ->
    task.due_date ? '3999-12-31'


  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")

  updatePriorities = ->
    # During reordering it's simplest to just mirror priorities based on task
    # positions in the list.
    $timeout ->
      angular.forEach $scope.tasks, (task, index) ->
        task.priority = index + 1

  raisePriorities = ->
    angular.forEach $scope.tasks, (t) -> t.priority += 1


  lowerPrioritiesBelow = (task) ->
    angular.forEach tasksBelow(task), (t) ->
      t.priority -= 1

  tasksBelow = (task) ->
    $scope.tasks.slice($scope.tasks.indexOf(task), $scope.tasks.length)
