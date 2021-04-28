const es6 = """
# Importing
Imported values cannot be reassigned, though imported objects and arrays can be mutated (and the exporting module, and any other importers, will be affected by the mutation).  
In that way, they behave similarly to const declarations.
￼
## Named Imports
Import a specific item from a source module, with its original name.  
`import { something } from './module.js';`  
  
Import a specific item from a source module, with a custom name assigned upon import.  
``import { something as somethingElse } from './module.js';  ``
￼
## Namespace Imports
Import everything from the source module as an object which exposes all the source module's named exports as properties and methods.  
`import * as module from './module.js'`  
  
The something example from above would then be attached to the imported object as a property, e.g. module.something.  
If present, the default export can be accessed via module.default.
  
  
## Default Import
Import the default export of the source module.  
`import something from './module.js';`  
￼
## Empty Import
Load the module code, but don't make any new objects available.  
`import './module.js';`  
This is useful for polyfills, or when the primary purpose of the imported code is to muck about with prototypes.
￼


## Dynamic Import
Import modules using the dynamic import API.  
`
import('./modules.js').then(({ default: DefaultExport, NamedExport })=> {
  // do something with modules.
})`


This is useful for code-splitting applications and using modules on-the-fly.  
￼

# Exporting
## Named exports

Export a value that has been previously declared:  
`const something = true;
export { something };` 

Rename on export:  
`export { something as somethingElse };` 

Export a value immediately upon declaration:
// this works with `var`, `let`, `const`, `class`, and `function`
export const something = true;
￼
## Default Export
Export a single value as the source module's default export:  
`export default something;`  

This practice is only recommended if your source module only has one export.  

It is bad practice to mix default and named exports in the same module, though it is allowed by the specification.  
""";
