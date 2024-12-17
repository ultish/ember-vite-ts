import Component from '@glimmer/component';
import { type InputChoice } from 'choices.js';
import choices from 'ember-vite-ts/modifiers/choices';
import betterChoices from 'ember-vite-ts/modifiers/better-choices';
import { action } from '@ember/object';

interface Signature {
  Args: {
    choices: InputChoice[];
    options: object;
  };
}

export default class AltDropdown extends Component<Signature> {
  get choices() {
    return this.args.choices;
  }

  get options() {
    return this.args.options;
  }

  @action
  onChange(data: string) {
    console.log('changed', data);
  }
  <template>
    <div>
      <select
        {{betterChoices this.choices this.options this.onChange}}
        aria-label="select"
      ></select>
    </div>
  </template>
}
