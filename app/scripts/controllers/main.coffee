Skwk.Controllers.createMainController = (sk)->
  console.log sk

  sk.newBladeView.on 'create-blade', (caller)->
    sk.addBlade( caller.getParams() )
  @
