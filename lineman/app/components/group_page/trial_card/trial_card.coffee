angular.module('loomioApp').directive 'trialCard', ->
  scope: {group: '='}
  restrict: 'E'
  templateUrl: 'generated/components/group_page/trial_card/trial_card.html'
  replace: true
  controller: ($scope, ModalService, ChoosePlanModal, ConfirmGiftPlanModal) ->

    $scope.isExpired = ->
      true

    $scope.choosePlan = ->
      ModalService.open ChoosePlanModal, group: -> $scope.group

    $scope.chooseGiftPlan = ->
      ModalService.open ConfirmGiftPlanModal, group: -> $scope.group
