json.array!(@tasks) do |task|
  json.id task.id
  json.title task.title
  json.start task.start_time  
  json.end task.end_time 
  json.description task.explanation
  json.condition task.condition_id

  if task.condition_id == 2
    json.color "#ff0000"  ##対応前はred
  elsif task.condition_id == 3
    json.color "#87cefa" ##対応中はlightskyblue
  elsif task.condition_id == 4
    json.color "#a9a9a9" ##対応済みはdarkgray
  else
    json.color "#000000" ##condition_idに当てはまらない場合は黒
  end
 end