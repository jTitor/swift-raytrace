#  Summary

Contains modules representing views used by the app.

## What are Views?

Views are modules that take data from the models and render them in a form usable by other systems, often the user but sometimes other applications or AI agents. Views are decoupled from models to ensure application state has one canonical value - if there has to be multiple renderings of the internal state, they will all be dependent on the canonical state and thus be inherently synchronized when the state changes.

As views render some element of state, they can be used by controllers to invert their conversion, taking an input in the view's space and converting it to a value in state space without the controller having to know the conversion method. 
