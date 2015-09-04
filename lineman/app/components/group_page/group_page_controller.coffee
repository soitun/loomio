angular.module('loomioApp').controller 'GroupPageController', ($rootScope, $routeParams, Records, CurrentUser, ScrollService, MessageChannelService, AbilityService, ModalService, CoverPhotoForm, LogoPhotoForm) ->
  $rootScope.$broadcast 'currentComponent', {page: 'groupPage'}

  Records.groups.findOrFetchById($routeParams.key).then (group) =>
    @group = group
    $rootScope.$broadcast 'currentComponent', { page: 'groupPage' }
    $rootScope.$broadcast 'viewingGroup', @group
    $rootScope.$broadcast 'setTitle', @group.fullName()
    $rootScope.$broadcast 'analyticsSetGroup', @group
    MessageChannelService.subscribeTo("/group-#{@group.key}")
  , (error) ->
    $rootScope.$broadcast('pageError', error)

  @logoStyle = ->
    { 'background-image': "url(#{@group.logoUrl()})" }

  @coverStyle = ->
    { 'background-image': "url(#{@group.coverUrl()})" }

  @isMember = ->
    CurrentUser.membershipFor(@group)?

  @showDescriptionPlaceholder = ->
    AbilityService.canAdministerGroup(@group) and !@group.description

  @canManageMembershipRequests = ->
    AbilityService.canManageMembershipRequests(@group)

  @showTrialCard = ->
    @group.subscriptionKind == 'trial' and AbilityService.canAdministerGroup(@group)

  @showGiftCard = ->
    @group.subscriptionKind == 'gift'

  @canUploadPhotos = ->
    AbilityService.canAdministerGroup(@group)

  @openUploadCoverForm = ->
    ModalService.open CoverPhotoForm, group: => @group

  @openUploadLogoForm = ->
    ModalService.open LogoPhotoForm, group: => @group

  return
