Когато 'създам нова хитринка:' do |table|
  data = table.rows_hash

  visit new_tip_path
  fill_in 'Заглавие', with: data['Заглавие']
  fill_in 'Тяло', with: data['Тяло']
  # TODO Fill in date

  click_on 'Създай'
end

То 'трябва да съществува хитринка "$name"' do |name|
  visit tips_path

  page.should have_content "#{name}"
end

То 'хитринката "$name" трябва да не е публикувана' do |name|
  tip = Tip.find_by_title(name)
  tip.published_at.should be_nil
end
