# minitodo

A simple to-do list to demo test-driven development (TDD).

The application can be found in the `src` folder.
Tests can be found in the `spec` folder.

### Running the application

- Install Ruby 2.5
- In the project directory, run `bundle install`
- `ruby src/app.rb`

You can now access the application at <http://localhost:4567>. Restarting the application will discard all tasks.

### Running unit tests

- In the project directory, run `rspec spec/task_list_spec.rb`.

### Running UI tests

- In the project directory, run `rspec spec/app_spec.rb`.
