Skwk.Controllers.createMainController = (sk)->

  sk.newBladeView.on 'create-blade', (caller)->
    sk.addBlade( caller.getParams() )
  @
