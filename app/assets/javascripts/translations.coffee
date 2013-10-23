window.app.config ['$translateProvider', ($translateProvider) ->
  $translateProvider.translations 'en',
    tasks: 'Tasks'
    new_task: 'New Task'
    task_mame: 'Task name'
    total_tasks: 'Total tasks'
    indeed_remove: 'Are you sure you want remove this task?'
    remove: 'Remove'
    edit: 'Edit'
    expand: 'Expand'
    language: 'Language'
  $translateProvider.translations 'ru',
    tasks: 'Задания'
    new_task: 'Новое задание'
    task_mame: 'Название задания'
    total_tasks: 'Всего заданий'
    indeed_remove: 'Уверены что хотите удалить это задание?'
    remove: 'Удалить'
    edit: 'Редактировать'
    language: 'Язык'
  $translateProvider.translations 'de',
    tasks: 'Aufgaben'
    new_task: 'Neue Aufgabe'
    language: 'Sprache'


  browser_lang = ((window.navigator.userLanguage || window.navigator.language).split '-').shift()
  pref_lang = 'ru'
  if pref_lang in ['ru', 'en', 'de']
    pref_lang = browser_lang
  $translateProvider.preferredLanguage pref_lang
  $translateProvider.fallbackLanguage 'en'
]