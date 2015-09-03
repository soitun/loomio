module.exports = new class SubscriptionCardHelper

  cardText: ->
    element(By.css('.subscription-card')).getText()

  clickChoosePricingPlanButton: ->
    element(By.css('.subscription-card__choose-plan-button')).click()

  selectGiftPlan: ->
    element(By.css('.choose-plan-modal__select-button--gift')).click()

  confirmGiftPlanText: ->
    element(By.css('.modal-confirm-gift-plan-modal')).getText()

  clickConfirmGiftPlanOk: ->
    element(By.css('.confirm-gift-plan-modal__submit-button')).click()