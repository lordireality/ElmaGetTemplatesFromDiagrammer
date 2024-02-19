select 
"Name" as "Наименование процесса",  
versionnumber as "Номер версии",
workflowprocess.description as "Комментарий к публикации",
"crt".FullName as "Автор публикации",
encode(diagram, 'escape') as "Диаграмма"
from workflowprocess
INNER JOIN "User" as "crt" ON (workflowprocess.creationauthor = "crt".Id)
where "Header" = {$Process.Id} /*Вы можете заменить process id на любой другой const в PGAdmin*/
order by workflowprocess.id DESC
