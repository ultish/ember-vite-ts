import Component from '@glimmer/component';
import Choices, { type InputChoice } from 'choices.js';
import { modifier } from 'ember-modifier';
import { runTask } from 'ember-lifeline';
import PhCube from 'ember-phosphor-icons/components/ph-cube';
import PhHeart from 'ember-phosphor-icons/components/ph-heart';

interface Signature {
  Args: {
    choices: InputChoice[];
  };
  Blocks: {
    default: [InputChoice];
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
    runTask(this, () => this.instance?.refresh());

    return this.args.choices;
  }

  initChoices() {
    console.log('So you can call functions from templates now');
  }

  <template>
    {{! prettier-ignore }}
    <style scoped>
      .hide {
        display: none;
      }
    </style>

    <PhCube @color="darkorchid" @weight="duotone">
      <animate
        attributeName="opacity"
        values="0.1;1;0.1"
        dur="4s"
        repeatCount="indefinite"
      />
      <animateTransform
        attributeName="transform"
        attributeType="XML"
        type="rotate"
        dur="5s"
        from="0 0 0"
        to="360 0 0"
        repeatCount="indefinite"
      />
    </PhCube>

    <PhCube />
    <PhHeart @size="32" @color="hotpink" @weight="fill" />

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
