require 'app'

Capybara.app = Sinatra::Application

feature 'Task management' do
  scenario 'User adds tasks, marks them as completed and clears completed tasks' do
    visit('/')

    fill_in('task', with: 'Milk')
    click_button('Add')
    fill_in('task', with: 'Toast')
    click_button('Add')
    fill_in('task', with: 'Honey')
    click_button('Add')

    expect(page).to have_content('Milk')
    expect(page).to have_content('Toast')
    expect(page).to have_content('Honey')

    click_link('Toast')
    click_link('Honey')

    expect(page).to have_css('.task.open', text: 'Milk')
    expect(page).to have_css('.task.completed', text: 'Honey')
    expect(page).to have_css('.task.completed', text: 'Toast')

    click_link('Clear completed')

    expect(page).to have_content('Milk')
    expect(page).to_not have_content('Honey')
    expect(page).to_not have_content('Toast')
  end
end
