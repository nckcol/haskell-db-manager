# Haskell DB manager

Разработать информационную систему "Пакеты прикладных программ, которые разработаны на факультете". Таблицы БД содержат такую информацию: Информация о студентах и преподавателях (....), которые занимаются разработкой ППП, график работы семинаров для ознакомления с ППП, план проведения демонстраций и тестовых испытаний. Предусмотреть возможность введения и корректирования информации. Количество таблиц должно быть больше 5.

## Tables

### Package

- id: number (AI)
- name: string
- license: string

### Contributor

- id: number (AI)
- first_name: string
- last_name: string
- email: string
- position: `['teacher', 'student']`

### Event

- id: number (AI)
- title: string
- type: `['demonstration', 'test']`
- package_id: foreing key
- date: date

### Workshop

- id: number (AI)
- title: string
- package_id: foreing key

### Schedule

- id: number (AI)
- day: `[0-6]`
- workshop_id: foreing key
- interval_id: foreing key

### Interval

- id: number (AI)
- start: time
- end: time
