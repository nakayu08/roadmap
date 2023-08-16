json.array!(@tasks) do |task|
  json.id task.id
  json.title task.title
  json.start task.start_time  
  json.end task.end_time 
  json.description task.explanation
 end