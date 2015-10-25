angular.module('storeApp').factory 'translation', [
  '$http'
  ($http) ->
    o =
      'language': 'en'
      'ua':
        'hello': 'привіт'
        'close form': 'закрити форму'
        'reset form': 'очистити форму'
        'place order': 'створити замовлення'
        'order number': 'номер замовлення'
        'Number': 'Номер'
        'add item': 'додати позицію'
        'remove selected': 'видалити обрані'
        'remove all': 'видалити всі'
        'close add form': 'закрити форму внесення позицій'
        'total amount': 'загальна вартість'
      'ru':
        'hello': 'привіт'
        'close form': 'закрыть форму'
        'reset form': 'очистить форму'
        'place order': 'создать заказ'
        'order number': 'номер заказа'
        'Number': 'Номер'
        'add item': 'добавить позицию'
        'remove selected': 'удалить выделенные'
        'remove all': 'удалить все'
        'close add form': 'закрыть форму добавления позиций'
        'total amount': 'общая стоимость'
    o
]
