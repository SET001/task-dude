window.app.config ['$translateProvider', ($translateProvider) ->
  $translateProvider.translations 'ru',
    tasks: 'Задания'
    new_task: 'Новое задание'
    language: 'Язык'
  $translateProvider.translations 'en',
    tasks: 'Tasks'
    new_task: 'New Task'
    language: 'Language'
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