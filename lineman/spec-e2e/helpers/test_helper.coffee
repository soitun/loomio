module.exports = new class TestHelper
  loadGroupOnTrialAdmin: ->
    browser.get('http://localhost:8000/development/setup_group_on_trial_admin')

  loadGroupOnTrial: ->
    browser.get('http://localhost:8000/development/setup_group_on_trial')
