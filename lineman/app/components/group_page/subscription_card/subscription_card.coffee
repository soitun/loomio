angular.module('loomioApp').directive 'subscriptionCard', ->
  scope: {group: '='}
  restrict: 'E'
  templateUrl: 'generated/components/group_page/subscription_card/subscription_card.html'
  replace: true
  controller: ($scope, ModalService, ChoosePlanModal, ConfirmGiftPlanModal) ->

    $scope.isExpired = ->
      false

    $scope.choosePlan = ->
      ModalService.open ChoosePlanModal, group: -> $scope.group

    $scope.chooseGiftPlan = ->
      ModalService.open ConfirmGiftPlanModal, group: -> $scope.group
