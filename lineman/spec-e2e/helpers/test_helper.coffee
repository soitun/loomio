module.exports = new class TestHelper
  loadGroupOnTrial: ->
    browser.get('http://localhost:8000/development/setup_group_on_trial')
