import Component from '@glimmer/component';
import { type InputChoice } from 'choices.js';
import choices from 'ember-vite-ts/modifiers/choices';
import betterChoices from 'ember-vite-ts/modifiers/better-choices';

interface Signature {
  Args: {
    choices: InputChoice[];
  };
}

export default class AltDropdown extends Component<Signature> {
  get choices() {
    return this.args.choices;
  }
  <template>
    <div>
      <select {{betterChoices this.choices}} aria-label="select"></select>
    </div>
  </template>
}
