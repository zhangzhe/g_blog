jsToolBar.prototype.elements.strong = {
	type: 'button',
	title: 'Strong',
	fn: {
	wiki: function() { this.singleTag('*') }
	}
}

jsToolBar.prototype.elements.em = {
	type: 'button',
	title: 'Italic',
	fn: {
		wiki: function() { this.singleTag("_") }
	}
}

jsToolBar.prototype.elements.ins = {
	type: 'button',
	title: 'Underline',
	fn: {
		wiki: function() { this.singleTag('+') }
	}
}

jsToolBar.prototype.elements.h = {
	type: 'button',
	title: 'Heading',
	fn: {
	    wiki: function() { this.singleTag('<h>', '</h>') }
	}	
    }

jsToolBar.prototype.elements.ul = {
	type: 'button',
	title: 'Unordered list',
	fn: {
		wiki: function() {
			this.encloseLineSelection('','',function(str) {
				str = str.replace(/\r/g,'');
				return str.replace(/(\n|^)[#-]?\s*/g,"$1* ");
			});
		}
	}
}

jsToolBar.prototype.elements.rails_code = {
	type: 'button',
	title: 'rails_code',
	fn: {
		wiki: function() { this.singleTag('[code:ruby]\n', '\n[/code]') }
	}
}

jsToolBar.prototype.elements.other_code = {
	type: 'button',
	title: 'other_code',
	fn: {
		wiki: function() { this.singleTag('[code:lisp]\n', '\n[/code]') }
	}
}

jsToolBar.prototype.elements.link = {
	type: 'button',
	title: 'link',
	fn: {
		wiki: function() { this.singleTag("[link:", "]  [/link]") }
	}
}

jsToolBar.prototype.elements.img = {
	type: 'button',
	title: 'Image',
	fn: {
		wiki: function() { this.singleTag("[img]", "[/img]") }
	}
}

    jsToolBar.prototype.elements.green = {
	type: 'button',
	title: 'green',
	fn: {
	    wiki: function() { this.singleTag('[green]', '[/green]') }
	}
    }

jsToolBar.prototype.elements.blue = {
	type: 'button',
	title: 'blue',
	fn: {
	    wiki: function() { this.singleTag('[blue]', '[/blue]') }
	}
    }

jsToolBar.prototype.elements.red = {
	type: 'button',
	title: 'red',
	fn: {
	    wiki: function() { this.singleTag('[red]', '[/red]') }
	}
    }

jsToolBar.prototype.elements.purple = {
	type: 'button',
	title: 'purple',
	fn: {
	    wiki: function() { this.singleTag('[purple]', '[/purple]') }
	}
    }
