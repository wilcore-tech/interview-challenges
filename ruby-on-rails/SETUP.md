## Mac OS install

1. After unzipping this code challenge into a folder, cd into that folder

2. Install homebrew from https://brew.sh

3. Install rbenv with `brew install rbenv`
4. Run `rbenv init`
5. Close and re-open your terminal
6. Cd back into the folder where the project was unzipped
7. Install Ruby 3.3.1 using your Ruby version manager, ie `rbenv install 3.3.1`

8. Install bundler with `gem install bundler`
9. Run `bundle install`
10. Install rails with `sudo gem install rails`
11. Close and re-open the terminal
12. Cd back into the folder where the project was unzipped
13. Complete the empty migration files in 
 20250924140936_create_people.rb and
 20250924141004_create_organizations.rb
14. Then run `rails db:setup` and `rails db:migrate`
15. Run `rails server` to start the server

Linux instructions for Ubuntu
1. After unzipping this code challenge into a folder, cd into that folder
2. Update packages with `sudo apt-get update`
3. Remove system ruby with `sudo apt-get remove ruby`
4. Install rbenv with `sudo apt-get install rbenv`
5. Run `rbenv init`
6. Attempt installing ruby with `rbenv install 3.3.1`
7. There may be an issue installing libffi and/or yaml, be sure the libffi-dev and libyaml-dev packages are installed via system package manager and try again
8. Close and reopen the terminal window
9. Switch to the backend-code-challenge folder
10. Install bundler: `gem install bundler`
11. Install rails: `gem install rails`
12. Close and reopen the terminal window
13. Switch to the backend-code-challenge folder
14. Complete the empty migration files in 
 20250924140936_create_people.rb and
 20250924141004_create_organizations.rb
15. Then run `rails db:setup` and `rails db:migrate`
16. Run `rails server` to start the server





