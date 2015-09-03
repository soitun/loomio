angular.module('loomioApp').factory 'ChoosePlanModal', ->
  templateUrl: 'generated/components/group_page/subscription_card/choose_plan_modal/choose_plan_modal.html'
  size: 'choose-plan-modal'
  controller: ($scope, group, ModalService, ConfirmGiftPlanModal, CurrentUser, $window) ->
    $scope.group = group

    $scope.chooseGiftPlan = ->
      ModalService.open ConfirmGiftPlanModal, group: -> $scope.group

    $scope.chooseStandardPlan = ->
      # url = 'https://loomio.chargify.com/subscribe/hn58vxnf4fjs/standard-loomio-plan'
      url = 'https://loomio-test.chargify.com/subscribe/s8kb52jmj52m/test-standard-plan'
      params = 
        first_name: CurrentUser.firstName()
        last_name: CurrentUser.lastName()
        email: CurrentUser.email
        organization: $scope.group.name
        reference: "userId:#{CurrentUser.id},groupId:#{$scope.group.id}"

      encodeParams = (params) ->
        _.map(_.keys(params), (key) ->
          encodeURIComponent(key) + "=" + encodeURIComponent(params[key])
        ).join('&')

      $window.location = url + '?' + encodeParams(params)