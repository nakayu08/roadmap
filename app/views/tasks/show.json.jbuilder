json.array!(@tasks) do |task|
  json.id task.id
  json.start task.start_time  
  json.end task.end_time 
  json.description task.explanation
  json.condition task.condition_id

  if task.condition_id == 4
    json.classNames 'end-tasks'
  end

  if task.condition_id == 2
    json.color "#ff0000"  ##対応前はred
  elsif task.condition_id == 3
    json.color "#87cefa" ##対応中はlightskyblue
  elsif task.condition_id == 4
    json.color "#a9a9a9" ##対応済みはdarkgray
  else
    json.color "#000000" ##condition_idに当てはまらない場合は黒
  end

  if task.category_id == 2
    json.title "【会議】"+task.title
  elsif task.category_id == 3
    json.title "【面談】"+task.title
  elsif task.category_id == 4
    json.title "【外出】"+task.title
  elsif task.category_id == 5
    json.title "【対応】"+task.title
  elsif task.category_id == 6
    json.title "【その他】"+task.title
  else
    json.title "タスクの種類が登録されていません。"
  end

  json.url edit_task_path(task.id)
 end

 
 