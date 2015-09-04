angular.module('loomioApp').directive 'trialCard', ->
  scope: {group: '='}
  restrict: 'E'
  templateUrl: 'generated/components/group_page/trial_card/trial_card.html'
  replace: true
  controller: ($scope, ModalService, ChoosePlanModal, ConfirmGiftPlanModal) ->

    $scope.showCard = ->
      _.includes ['gift', 'trial'], $scope.group.subscriptionKind

    $scope.isExpired = ->
      false

    $scope.choosePlan = ->
      ModalService.open ChoosePlanModal, group: -> $scope.group
