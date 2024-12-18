import Component from '@glimmer/component';
import Choices, { type InputChoice } from 'choices.js';
import { modifier } from 'ember-modifier';

interface Signature {
  Args: {
    choices: InputChoice[];
  };
}
export default class DropdownOptions extends Component<Signature> {
  loadData = modifier(async (e) => {
    // force-disconnect from auto-tracking
    await Promise.resolve();

    console.log('asdasd', this.choices, e);

    this.instance = new Choices(e, {});
  });

  instance: Choices | undefined;

  get choices() {
    console.log('choices', this.args.choices);
    // void this.instance?.setChoices(this.args.choices);
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
      {{#each this.choices as |c|}}
        {{yield c}}
      {{/each}}
      {{!
      <option placeholder="true">Multiple Options</option>
      <option defaultValue="2">Paris</option>
      <option defaultValue="3">Bucharest</option>
      <option defaultValue="4">Rome</option>
      <option defaultValue="5">New York</option>
      <option defaultValue="6">Miami</option>
      <option defaultValue="7">Los Santos</option>
      <option defaultValue="8">Sydney</option>
      <option defaultValue="9">Piatra Neamt</option> }}
    </select>

    {{this.initChoices}}
  </template>
}
