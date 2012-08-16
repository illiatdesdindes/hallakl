
def fill_in_sign_up_form
  fill_in 'Email',                 with: 'person@example.com'
  fill_in 'Password',              with: 'foobar'
  fill_in 'Password confirmation', with: 'foobar'
end
