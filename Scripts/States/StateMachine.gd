extends Node
class_name StateMachine

@export var initial_state: State
var state: State

func run():
	change_state(initial_state)

func change_state(new_state: State):
	if state is State:
		state._exit_state()
	new_state._enter_state()
	state = new_state
	
	print(new_state.name)
