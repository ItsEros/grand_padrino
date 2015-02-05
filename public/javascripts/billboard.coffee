# Main Angular module
# ---------------------------------------------------------------------------------
angular.module('billboard', [])

# Billboard controller
# ---------------------------------------------------------------------------------
BillboardController =  ($http) ->
  vm = this

  # Add new comment
  # -------------------------------------------------------------------------------
  addComment = ->
    $http.post('/api/comment', { comment: vm.comment })
      .success ->
        vm.comment = ''
        fetchComments()

  # Fetch billboard list and comments on init
  # -------------------------------------------------------------------------------
  fetchBillboards = ->
    $http.get('/api/billboards.json')
      .success (data) ->
        vm.billboards = data

  fetchComments = ->
    $http.get('/api/comments.json')
      .success (data) ->
        vm.comments = data

  onInit = ->
    fetchBillboards()
    fetchComments()

  # Bind functions to scope and init
  # -------------------------------------------------------------------------------
  vm.addComment = -> addComment()

  onInit()
  return

# Inject into main module
# ---------------------------------------------------------------------------------
BillboardController.$inject = ['$http']

angular
  .module('billboard')
  .controller('BillboardController', BillboardController)
