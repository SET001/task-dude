window.TasksListCtrl = ['$scope', '$http', 'Restangular', '$translate', (self, $http, Restangular, $translate) ->
  Tasks = Restangular.all('tasks')
  Tasks.getList().then (tasks) ->
      self.tasks = tasks

  self.add_subtask = (parent_task) ->
    bootbox.prompt $translate('task_mame'), (name) ->
      if name
        Tasks.post({name:name, task_id: parent_task.id }).then (task) ->
          if parent_task.subtasks
            parent_task.subtasks.push task
    no

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
    no

  self.remove = (task, parent) ->
    console.log task, parent
    
    # bootbox.confirm $translate('indeed_remove'), (res) ->
    #   if res
    #     $http.delete("tasks/#{task.id}").then ->
    #       list = _.reject list, id:task.id
    # no

  self.expand_children = (task) ->

    Tasks.getList({for: task.id}).then (tasks) ->
      task.subtasks = tasks
      console.log tasks
    # $http.get("subtasks/#{task.id}").then (response) ->
    #   task.subtasks = response.data

  self.shrink_children = (task) ->
    $http.get("subtasks/#{task.id}").then (response) ->
      task.subtasks = response.data

  self.toggle_status = (task) ->
    task.status = !task.status
    $http.put('tasks', task).then (response)->
      task.name = response.data.name
]