import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import Choices, { type InputChoice } from 'choices.js';
import { modifier } from 'ember-modifier';

interface Signature {
  Args: {
    choices: InputChoice[];
  };
}
export default class DropdownCustom extends Component<Signature> {
  @tracked init = false;
  instance: Choices | undefined;

  loadData = modifier(async (e) => {
    // force-disconnect from auto-tracking
    await Promise.resolve();

    console.log('asdasd', this.choices, e);

    /**
     * this is a silly exercise but it could be something with the in-element.
     * this.instance isnt tracking correctly as its undefined all the time.
     * if not, mite be able to toggle someting to cause template to re-render
     * the customtempalte function is called after selecting something which resets
     * the display
     */
    this.instance = new Choices(e, {
      choices: this.choices,
      callbackOnInit: () => {
        console.log('DONE');
        this.init = true;
      },
      callbackOnCreateTemplates: function (
        template,
        escapeForTemplate,
        getClassNames
      ) {
        return {
          item: ({ classNames }, data) => {
            return template(`
          <div class="${getClassNames(classNames.item).join(
            ' '
          )} ${getClassNames(
            data.highlighted
              ? classNames.highlightedState
              : classNames.itemSelectable
          ).join(' ')} ${
            data.placeholder ? classNames.placeholder : ''
          }" data-item data-id="${data.id}" data-value="${escapeForTemplate(
            true,
            data.value
          )}" ${data.active ? 'aria-selected="true"' : ''} ${
            data.disabled ? 'aria-disabled="true"' : ''
          }>
            <span>&bigstar;</span> ${escapeForTemplate(true, data.label)}
          </div>
        `);
          },
          choice: ({ classNames }, data) => {
            console.log('choiceDONE');
            return template(`
            <CustomChoice />
          <div class="${getClassNames(classNames.item).join(
            ' '
          )} ${getClassNames(classNames.itemChoice).join(' ')} ${getClassNames(
            data.disabled ? classNames.itemDisabled : classNames.itemSelectable
          ).join(' ')}" data-select-text="${
            this.config.itemSelectText
          }" data-choice ${
            data.disabled
              ? 'data-choice-disabled aria-disabled="true"'
              : 'data-choice-selectable'
          } data-id="${data.id}" data-value="${escapeForTemplate(
            data.value
          )}" ${data.groupId > 0 ? 'role="treeitem"' : 'role="option"'}>
            <span id="${data.id}">&bigstar;</span> ${escapeForTemplate(
              true,
              data.label
            )}
          </div>
        `);
          },
        };
      },
    });
  });

  get choices() {
    console.log('choices', this.args.choices);
    void this.instance?.setChoices(this.args.choices);
    return this.args.choices;
  }

  find(c) {
    debugger;
    return document.getElementById(c.id);
  }

  get foudn() {
    return document.getElementById('1');
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

      {{#if this.init}}
        {{#each this.choices as |c|}}
          {{#if (this.find c)}}
            {{#in-element (this.find c)}}
              sup
            {{/in-element}}
          {{/if}}
        {{/each}}
      {{/if}}
    </select>

    {{this.initChoices this}}

    <span class="hide">
      {{this.choices}}
    </span>
  </template>
}
