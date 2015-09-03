describe 'Subscription flow', ->

  subscriptionCard = require './helpers/subscription_card_helper.coffee'
  testHelper = require './helpers/test_helper.coffee'

  describe 'signup from front page', ->
    # to do

  describe 'new group with 30 day trial', ->

    beforeEach ->
      testHelper.loadGroupOnTrial()

    it 'tells displays the trial card on group page', ->
      expect(subscriptionCard.cardText()).toContain('You can pick a pricing plan')

    it 'lets you choose gift plan', ->
      subscriptionCard.clickChoosePricingPlanButton()
      subscriptionCard.selectGiftPlan()
      expect(subscriptionCard.confirmGiftPlanText()).toContain('Gift plan selected')
      subscriptionCard.clickConfirmGiftPlanOk()

      