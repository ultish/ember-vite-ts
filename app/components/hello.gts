import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import Dropdown from './dropdown';
import { action } from '@ember/object';
import { on } from '@ember/modifier/on';
import AltDropdown from './alt-dropdown';
import { hash } from '@ember/helper';
import DropdownOptions from './dropdown-options';
import DropdownCustom from './dopdown-custom.gts';

export default class Hello extends Component {
  get name() {
    return 'Jimmy';
  }
  @tracked index = 1;

  @tracked choices = [
    {
      value: 'jimmy',
      label: 'jimmy',
      id: 1,
      customProperties: {
        test: 'hi',
      },
    },
    {
      value: 'hana',
      label: 'hana',
      id: 2,
      customProperties: {
        test: 'mi',
      },
    },
  ];

  @action
  add() {
    const x = `toro ${this.index++}`;
    this.choices = [...this.choices, { value: x, label: x }];
  }

  @action
  handleChoice(e) {
    console.log('handleChoice', e);
  }

  get data() {
    return this.choices;
  }

  <template>
    {{! prettier-ignore }}
    <style>
      .hello { color: red; }
      .scroll-watcher {
        height: 10px;
        position: fixed;
        top: 0;
        z-index: 1000;
        background-color: lime;
        width: 100%;
        scale: 0 1;
        transform-origin: left;
        animation: scroll-watcher linear;
        animation-timeline: scroll();
      }

      @media (prefers-reduced-motion: no-preference) {
        img {
          opacity: 0;
          animation: fade-in linear forwards;
          animation-timeline: view();
          animation-range: 100px 300px;
        }
      }

      @keyframes scroll-watcher {
        to {
          scale: 1 1;
        }
      }

      @keyframes fade-in {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }
    </style>

    <DropdownCustom
      @choices={{this.choices}}
      @customChoiceComponent="CustomChoice"
      @onChoice={{this.handleChoice}}
    />

    {{!-- <DropdownOptions @choices={{this.data}} as |c|>
      {{log "what" c}}
      <option>Hello {{c.label}}</option>
    </DropdownOptions> --}}
    <button {{on "click" this.add}} type="button">Add</button>
    {{!-- <Dropdown @choices={{this.data}} />

    <AltDropdown
      @choices={{this.data}}
      @options={{hash
        removeItemButton=true
        placeholderValue="Select an option"
      }}
    /> --}}

    <div class="scroll-watcher"></div>

    Hello Component
    {{this.name}}

    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <img src="doge.webp" width="1000px" alt="doge" />
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>many</p>
    <p>
      {{yield}}
    </p>
  </template>
}
