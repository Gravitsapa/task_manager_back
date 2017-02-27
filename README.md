# https://liapin-taskmanager.herokuapp.com/
## FRONTEND
> https://github.com/Gravitsapa/task_manager_front

#### 1. get all statuses, not repeating, alphabetically ordered
```sql
	SELECT distinct status 
	FROM tasks;
```

#### 2. get the count of all tasks in each project, order by tasks count descending 
```sql
	SELECT project_id, count(*) 
	FROM tasks
	GROUP BY project_id 
	ORDER BY count(*) desc;
```

#### 3. get the count of all tasks in each project, order by projects names 
```sql
	SELECT projects.name, count(*) 
	FROM tasks, projects 
	WHERE projects.id = tasks.project_id 
	GROUP BY projects.name 
	ORDER BY projects.name;
```

##### 4. get the tasks for all projects having the name beginning with “N” letter 
```sql
	SELECT tasks.name 
	FROM tasks, projects 
	WHERE projects.id = tasks.project_id 
	AND projects.name like "N%";
```

#### 5. get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL 
```sql
	SELECT projects.name, count(*) 
	FROM tasks, projects 
	WHERE projects.id = tasks.project_id 
	AND projects.name like "%a%"
	GROUP BY projects.name 
	ORDER BY projects.name;
```

#### 6. get the list of tasks with duplicate names. Order alphabetically
```sql
	SELECT name FROM tasks 
	GROUP BY name 
	HAVING count(*) > 1;
```

#### 7. get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count 
```sql
	SELECT tasks.name 
	FROM tasks, projects 
	WHERE projects.id = tasks.project_id 
	AND projects.name = "Garage" 
	GROUP BY tasks.name, status
	HAVING count(*) > 1;
```


#### 8. get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id
```sql
	SELECT projects.name 
	FROM projects, tasks 
	WHERE projects.id = tasks.project_id 
	AND status = true 
	GROUP BY status
	HAVING count(*) > 10;
```
