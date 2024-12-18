import Component from '@glimmer/component';

interface Args {
  choice: { id: string; label: string; icon?: string };
}

export default class CustomChoice extends Component<Args> {
  <template>
    <div class="custom-choice">
      💥
      {{#if @choice.icon}}
        <img src={{@choice.icon}} alt="Icon" class="icon" />
      {{/if}}
      <span>{{@choice.label}}</span>
    </div>
  </template>
}
