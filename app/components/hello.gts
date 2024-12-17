import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import Dropdown from './dropdown';
import { action } from '@ember/object';
import { on } from '@ember/modifier/on';

export default class Hello extends Component {
  get name() {
    return 'Jimmy';
  }
  @tracked index = 1;

  @tracked choices = [
    {
      value: 'jimmy',
      label: 'jimmy',
    },
    {
      value: 'hana',
      label: 'hana',
    },
  ];

  @action
  add() {
    const x = `toro ${this.index++}`;
    this.choices = [...this.choices, { value: x, label: x }];
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

    <button {{on "click" this.add}} type="button">Add</button>
    <Dropdown @choices={{this.data}} />

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
