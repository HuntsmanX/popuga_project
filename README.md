# Popuga Project

## Разобрать каждое требование на составляющие (актор, команда и событие). Определить, какие акторы будут в системе и какие события нужны.
### Акторы
* User
* Account manager
* Manager
* Admin
* System

1. **Таск-трекер**
     1. Таск-трекер должен быть отдельным дашбордом и доступен всем сотрудникам
          * **Actor** — User
          * **Command** — Login in system
          * **Data** - Dataset with cards
          * **Event** - Dataset with cards.all
     2. Авторизация в таск-трекере должна выполняться через общий сервис
          * **Actor** — User
          * **Command** — Login in system
          * **Data** - User info + Roles Info + Permission Info
          * **Event** - Set permissions for user with role
     3. В таск-трекере новые таски может создавать кто угодно.
          * **Actor** — All users in the system
          * **Command** — Create Task
          * **Data** - Task info
          * **Event** - Task.Created
     4. Менеджеры или администраторы должны иметь кнопку «заасайнить задачи»
          * **Actor** — Users with roles admin or manager with *assign* permissions
          * **Command** — Assign Task
          * **Data** - Task + User
          * **Event** - Task.Assigned
     5. Каждый сотрудник должен иметь возможность видеть в отдельном месте список заасайненых на него задач
          * **Actor** — Users
          * **Command** — Show Tasks
          * **Data** -  User + Tasks ids
          * **Event** - Users.Tasks
     6. Каждый сотрудник должен иметь возможность отметить задачу выполненной
          * **Actor** — Users
          * **Command** — Change Task Status
          * **Data** -  User + Task id
          * **Event** - ChangeTaskStatus
     7. После ассайна новой задачи сотруднику должно приходить оповещение на почту, в слак и в смс (от лица системы)
          * **Actor** — System
          * **Command** — Send Notification
          * **Data** -  User notification info
          * **Event** - SendNotification
     8.  После завершения задачи должна измениться информация о деньгах
          * **Actor** — "Task.StatusChanged" event 
          * **Command** — Create salary record
          * **Data** — User Salary info
2. **Аккаунтинг**
     1. Аккаунтинг должен быть в отдельном дашборде и доступным только для администраторов и бухгалтеров.
          * **Actor** —  Users with roles admin or financial staff
          * **Command** — Check info
          * **Data** - Salary info
          * **Event** - ShowSalaryInfo
     2. У каждого из сотрудников должен быть свой счёт, который показывает, сколько за сегодня сотрудник получил денег.
          * **Actor** —  Users
          * **Command** — Check info
          * **Data** - Salary info
          * **Event** - ShowSalaryInfo
     3. У счёта должен быть аудит лог того, за что были списаны или начислены деньги, с подробным описанием каждой из задач.
          * **Actor** —  Log
          * **Command** — Update Info
          * **Data** - Salary info
          * **Event** - UpdateInfo
     4. Cчитать сколько денег сотрудник получил за рабочий день
          * **Actor** —  System
          * **Command** — CountSalary
          * **Data** - Salary info
          * **Event** - UpdateSalaryInfo
     5. Cлать на почту сумму выплат
          * **Actor** — System
          * **Command** — Send Notification
          * **Data** -  User notification info
          * **Event** - SendNotification
     6. Выплачивать сумму
          * **Actor** — System
          * **Command** — Send Salary
          * **Data** -  User Salary info
          * **Event** - SendSalary
     7. Баланс должен обнуляться после выплаты зарплаты
          * **Actor** — BalanceInfo
          * **Command** — UpdateInfo
          * **Data** -  User Salary info
          * **Event** - Delete Salary Info
     8. В аудитлоге должно быть отображено, что была выплаченна сумма.
          * **Actor** — SalaryLog
          * **Command** — UpdateInfo
          * **Data** -  Salary Log info
          * **Event** - Update Salary Log Info
     9. Дашборд должен выводить информацию по дням, а не за весь период сразу.
          * **Actor** — System
          * **Command** — ShowInfo
          * **Data** -  Salary Info
          * **Event** - Sort Salary Info dataset
3. **Аналитика**
     1. Указывать, сколько заработал топ-менеджмент: сколько программистов ушло в минус.
          * **Actor** — Admin (user with "admin" role and edit permissions)
          * **Command** — Edit income card
          * **Data** - User's income card
          * **Event** - Income card updated
     2. Показывать самую дорогую задачу за: день, неделю и месяц.
          * **Actor** — Admin (user with "admin" role and edit permissions)
          * **Command** — Sort task card
          * **Data** - Dataset with task card
          * **Event** - Task cards sorted
