import { getOwner } from '@ember/application';
import Component from '@ember/component';
import { set } from '@ember/object';

export function renderComponentToHTML(componentName: string, args: Record<string, any> = {}): string {
  const owner = getOwner(this);

  // Look up the component factory
  const ComponentClass = owner.factoryFor(`component:${componentName}`);
  if (!ComponentClass) {
    throw new Error(`Component '${componentName}' not found`);
  }

  // Create the component instance
  const instance = ComponentClass.create(owner.ownerInjection(), args);

  // Render the component manually
  const element = document.createElement('div');
  instance.appendTo(element);

  // Extract the raw HTML
  const html = element.innerHTML;

  // Destroy the component instance after rendering
  instance.destroy();

  return html;
}
