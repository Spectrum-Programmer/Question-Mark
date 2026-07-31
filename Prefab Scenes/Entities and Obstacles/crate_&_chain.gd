extends Node2D

@export var cutoff: Marker2D
@export var speed: float = 1
var raise = false

func _process(_delta: float) -> void:
	if(raise): raise_chain()

func on_activate() -> void:
	raise = not raise
	

func raise_chain() -> void:
	raise = false
	var chain_container = get_child(0)
	var crate_container = get_child(1) as Node2D
	var chains = chain_container.get_children() as Array[Node2D]
	for chain in chains:
		print(chain)
		chain.position.y -= speed
		if chain.position.y < cutoff.position.y:
			chain.visible = false
		else: 
			chain.visible = true
			raise = true
	if raise: crate_container.position.y -= 1
		
		
		
 
