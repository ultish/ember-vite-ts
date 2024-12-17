import { modifier } from 'ember-modifier';
import Choices from 'choices.js';

export default modifier(
  (element, [choices]) => {
    // Initialize Choices.js instance once
    if (!element._choicesInstance) {
      element._choicesInstance = new Choices(element, {
        removeItemButton: true,
      });
    }

    // Update the choices array efficiently
    const instance = element._choicesInstance;

    console.log('clear choices and re-set');
    instance.clearChoices(); // Clear existing choices
    instance.setChoices(choices || [], 'value', 'label', true);
  },
  {
    // Teardown: Runs only when the element is removed from the DOM
    onTeardown(element) {
      console.log('💥');
      if (element._choicesInstance) {
        element._choicesInstance.destroy();
        element._choicesInstance = null;
      }
    },
  }
);
