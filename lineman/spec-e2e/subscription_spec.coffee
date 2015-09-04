describe 'Subscription flow', ->

  trialCard = require './helpers/trial_card_helper.coffee'
  testHelper = require './helpers/test_helper.coffee'

  describe 'signup from front page', ->
    # to do

  describe 'new group with 30 day trial', ->

    it 'displays the trial card to on group page for coordinators only', ->
      testHelper.loadGroupOnTrialAdmin()
      expect(trialCard.cardText()).toContain('You can pick a pricing plan')

    it 'does not display the trial card for non-coordinators', ->
      testHelper.loadGroupOnTrial()
      expect(trialCard.card().isPresent()).toBe(false)

    it 'lets coordinator choose gift plan', ->
      testHelper.loadGroupOnTrialAdmin()
      trialCard.clickChoosePricingPlanButton()
      trialCard.selectGiftPlan()
      expect(trialCard.confirmGiftPlanText()).toContain('Gift plan selected')
      trialCard.clickConfirmGiftPlanOk()
      expect(trialCard.giftCardText()).toContain('GIFT PLAN')
