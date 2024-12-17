import { modifier } from 'ember-modifier';
import Choices from 'choices.js';

export default modifier((element, [choices]) => {
  // Initialize the Choices.js instance
  if (!element._choicesInstance) {
    element._choicesInstance = new Choices(element, {
      removeItemButton: true, // Optional: Enables item removal UI
    });
  }
  // Update the choices array without re-initializing
  const instance = element._choicesInstance;
  instance.clearChoices(); // Clear existing choices
  instance.setChoices(choices || [], 'value', 'label', true);

  return () => {
    // Clean up Choices.js instance when the element is destroyed
    console.log('booom');
    // instance.destroy();
    // element._choicesInstance = null;
  };
});
