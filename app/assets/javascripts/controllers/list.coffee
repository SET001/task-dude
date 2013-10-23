window.TasksListCtrl = ['$scope', '$http', 'Restangular', '$translate', (self, $http, Restangular, $translate) ->

  self.save = (task = null) ->
    bootbox.prompt 
      title: $translate('task_mame')
      value: if task then task.name else ''
      callback: (name) ->
        if name
          if !task 
            $http.post('tasks', name:name).then (task) ->
              self.tasks.push task.data
          else
            $http.put('tasks', {id: task.id, name: name}).then (response)->
              task.name = response.data.name
              console.log task
              console.log self.tasks
    no

  self.fetch_list = ->
    # self.tasks = Restangular.all('tasks').getList()
    $http.get('tasks').then (tasks)->
      self.tasks = tasks.data

  self.fetch_list()


  self.remove = (task) ->
    bootbox.confirm $translate('indeed_remove'), ->
      $http.delete("tasks/#{task.id}").then ->
        self.tasks = _.reject self.tasks, id:task.id
    no
]