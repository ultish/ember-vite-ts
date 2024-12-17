// import { module, test } from 'qunit';
// import { setupRenderingTest } from 'ember-vite-ts/tests/helpers';
// import { render } from '@ember/test-helpers';
// import { hbs } from 'ember-cli-htmlbars';

// module('Integration | Component | choice-test', function (hooks) {
//   setupRenderingTest(hooks);

//   test('it renders', async function (assert) {
//     // Set any properties with this.set('myProperty', 'value');
//     // Handle any actions with this.set('myAction', function(val) { ... });

//     await render(hbs`<ChoiceTest />`);

//     assert.dom().hasText('');

//     // Template block usage:
//     await render(hbs`
//       <ChoiceTest>
//         template block text
//       </ChoiceTest>
//     `);

//     assert.dom().hasText('template block text');
//   });
// });

import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render,   find } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | alt-dropdown-component', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders and updates choices', async function (assert) {
    this.set('choices', [
      { value: 'apple', label: 'Apple' },
      { value: 'banana', label: 'Banana' },
    ]);

    await render(hbs`<AltDropdown @choices={{this.choices}} />`);

    assert.ok(find('select'), 'The select element is rendered');

    // Update choices
    this.set('choices', [
      { value: 'cherry', label: 'Cherry' },
      { value: 'grape', label: 'Grape' },
    ]);

    assert.ok(find('select option[value="cherry"]'), 'Choices are updated');
  });
});
