window.TasksListCtrl = ['$rootScope', 'Restangular', (self, Restangular) ->
  
  self.tasks = Restangular.all('tasks').getList()

  self.new_task = ->
    bootbox.prompt 'Task name', (name) ->
    no
]