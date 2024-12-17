import Component from '@glimmer/component';
import Choices, { type InputChoice } from 'choices.js';
import { modifier } from 'ember-modifier';

interface Signature {
  Args: {
    choices: InputChoice[];
  };
}
export default class Dropdown extends Component<Signature> {
  loadData = modifier(async (e) => {
    // force-disconnect from auto-tracking
    await Promise.resolve();

    console.log('asdasd', this.choices, e);

    this.instance = new Choices(e, {
      choices: this.choices,
    });
  });

  instance: Choices | undefined;

  get choices() {
    console.log('choices', this.args.choices);
    void this.instance?.setChoices(this.args.choices);
    return this.args.choices;
  }

  initChoices() {
    console.log('So you can call functions from templates now');
  }

  <template>
    <style scoped>
      .hide {
        display: none;
      }
    </style>
    <select id="test" {{this.loadData}}>
      My Test
    </select>

    {{this.initChoices this}}

    <span class="hide">
      {{this.choices}}
    </span>
  </template>
}
