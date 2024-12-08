import Route from 'ember-route-template';
import { pageTitle } from 'ember-page-title';
import Hello from 'ember-vite-ts/components/hello';

export default Route(
  <template>
    {{pageTitle "MyFancyAppTs"}}

    {{outlet}}

    {{! The following component displays Ember's default welcome message. }}
    Hello Vite wtf so fast
    <Hello>test</Hello>
  </template>
);
