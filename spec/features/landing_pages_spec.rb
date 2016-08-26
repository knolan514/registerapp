require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do

  context 'Going to website' do
     Steps 'User registration page' do
       Given 'I am on the landing page' do
         visit '/'
       end
       Then 'I can see a user registration form' do
         expect(page).to have_content("User Registration")
       end
     end
  end


  context 'Register' do
     Steps 'User can register information' do
       Given 'I am on the landing page' do
         visit '/'
       end
       When 'I fill in my name, address, email, user id and password' do
         fill_in 'name', with: 'Joe Shmoe'
         fill_in 'address', with: '7824 Sunny Dr.'
         fill_in 'city', with:'San Diego'
         fill_in 'state', with:'California'
         fill_in 'postal', with: '92104'
         fill_in 'country', with:'USA'
         fill_in 'email', with:'jshmoe@gmail.com'
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe123*'
       end
       And 'I can submit the information' do
         click_button 'Register'
       end
       Then "I'm taken to a confirmation page and I can see all my information except password." do
         expect(page).to have_content('Registration Confirmed')
       end
     end
  end

  context 'Register' do
     Steps 'User can register information' do
       Given 'I am on the landing page' do
         visit '/'
       end
       When 'I fill in nothing' do
       end
       And 'I submit the information' do
         click_button 'Register'
       end
       Then "I'm taken redirected to the home page and an error message is displayed." do
         expect(page).to have_content('User Registration')
         expect(page).to have_content('Please enter a user id and password.')
       end
     end
  end

  context 'Login' do
     Steps 'User can login to website' do
       Given 'I am on the login page' do
         visit '/'
         fill_in 'name', with: 'Joe Shmoe'
         fill_in 'address', with: '7824 Sunny Dr.'
         fill_in 'city', with:'San Diego'
         fill_in 'state', with:'California'
         fill_in 'postal', with: '92104'
         fill_in 'country', with:'USA'
         fill_in 'email', with:'jshmoe@gmail.com'
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe123*'
         click_button 'Register'
       end
       When 'I fill in my User ID and Password' do
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe123*'
       end
       And 'I can submit the information' do
         click_button 'Login'
       end
       Then "I'm taken to a confirmation page and I can see all my information except password." do
         expect(page).to have_content('Joe Shmoe')
         expect(page).to have_content('7824 Sunny Dr.')
         expect(page).to have_content('San Diego')
         expect(page).to have_content('California')
         expect(page).to have_content('92104')
         expect(page).to have_content('USA')
         expect(page).to have_content('jshmoe@gmail.com')
         expect(page).to have_content('JShmoe123')
       end
     end
  end

  context 'information' do
     Steps 'User can view all their information' do
       Given 'I am on the landing page' do
         visit '/'
         fill_in 'name', with: 'Joe Shmoe'
         fill_in 'address', with: '7824 Sunny Dr.'
         fill_in 'city', with:'San Diego'
         fill_in 'state', with:'California'
         fill_in 'postal', with: '92104'
         fill_in 'country', with:'USA'
         fill_in 'email', with:''
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe123*'
         click_button 'Register'
       end
       When 'I fill in my User ID and Password' do
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe123*'
       end
       And 'I can submit the information' do
         click_button 'Login'
       end
       Then "I'm taken to a confirmation page and I can see all my information except password." do
         expect(page).to have_content('Joe Shmoe')
         expect(page).to have_content('7824 Sunny Dr.')
         expect(page).to have_content('San Diego')
         expect(page).to have_content('California')
         expect(page).to have_content('92104')
         expect(page).to have_content('USA')
         expect(page).to have_content('No Email')
         expect(page).to have_content('JShmoe123')
       end
     end
  end

  context 'information' do
     Steps 'User can view all their information' do
       Given 'I am on the landing page' do
         visit '/'
         fill_in 'name', with: 'Joe Shmoe'
         fill_in 'address', with: '7824 Sunny Dr.'
         fill_in 'city', with:'San Diego'
         fill_in 'state', with:'California'
         fill_in 'postal', with: '92104'
         fill_in 'country', with:'USA'
         fill_in 'email', with:''
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe123*'
         click_button 'Register'
       end
       When 'I fill in my User ID and Password' do
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe12*'
       end
       And 'I can submit the information' do
         click_button 'Login'
       end
       Then "I'm taken back to the login page." do
         expect(page).to have_content('Login failed')
       end
     end
  end

  context 'information' do
     Steps 'User can view all their information' do
       Given 'I am on the landing page' do
         visit '/'
         fill_in 'name', with: 'Joe Shmoe'
         fill_in 'address', with: '7824 Sunny Dr.'
         fill_in 'city', with:'San Diego'
         fill_in 'state', with:'California'
         fill_in 'postal', with: '92104'
         fill_in 'country', with:'USA'
         fill_in 'email', with:''
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe123*'
         click_button 'Register'
       end
       When 'I try to register again with the same userID' do
         visit '/'
         fill_in 'name', with: 'Jolene Shmoe'
         fill_in 'address', with: '7822 Sunny Dr.'
         fill_in 'city', with:'San Diego'
         fill_in 'state', with:'California'
         fill_in 'postal', with: '92104'
         fill_in 'country', with:'USA'
         fill_in 'email', with:''
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'Jsmee123'
         click_button 'Register'
       end
       Then "I'm taken back to the registration page." do
         expect(page).to have_content('User ID taken, try another.')
       end
     end
  end

  context 'information' do
     Steps 'User can view all their information' do
       Given 'I am on the landing page' do
         visit '/'
         fill_in 'name', with: 'Joe Shmoe'
         fill_in 'address', with: '7824 Sunny Dr.'
         fill_in 'city', with:'San Diego'
         fill_in 'state', with:'California'
         fill_in 'postal', with: '92104'
         fill_in 'country', with:'USA'
         fill_in 'email', with:''
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe123*'
         click_button 'Register'
       end
       When 'I fill in my User ID and Password' do
         fill_in 'userid', with:'JShmoe123'
         fill_in 'password', with: 'joe123*'
       end
       And 'I can submit the information' do
         click_button 'Login'
       end
       Then "I can log out." do
         click_button 'Logout'
       end
       And 'I will be taken to the login page and told I have successfully logged out.' do
         expect(page).to have_content('You have been logged out successfully')
         expect(page).to have_content('Type a user name and password to log in!')
       end

     end
  end





end
