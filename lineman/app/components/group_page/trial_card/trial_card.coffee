angular.module('loomioApp').directive 'trialCard', ->
  scope: {group: '='}
  restrict: 'E'
  templateUrl: 'generated/components/group_page/trial_card/trial_card.html'
  replace: true
  controller: ($scope, ModalService, ChoosePlanModal) ->

    $scope.isExpired = ->
      true

    $scope.choosePlan = ->
      ModalService.open ChoosePlanModal, group: -> $scope.group
