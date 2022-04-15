const Scene = require('Scene');
export const Diagnostics = require('Diagnostics');
const Patches = require("Patches");

Promise.all([
		Scene.root.findFirst('Lno'),
]).then(onReady);


function onReady(assets) {
	  var counterNumber = assets[0];
		var scoreNumber = Patches.outputs.getScalar("Lvl");

	  scoreNumber.then(e=>{
	      e.monitor().subscribe(value=>{
	          counterNumber.text=value.newValue.toString();
	      });
	  });

}