extends Area2D
var currentGoblin = false

func _ready():
	if self.get_name() in Global.deadGoblinsOverworld:
		self.queue_free()

func _process(delta):
	if Global.currentGoblin == self.get_name():
		currentGoblin = true
	if currentGoblin == true:
		$Goblin.visible = false
		$shittyMeat.visible = true

func playerDetected( body ):
	if body.is_in_group("player") and currentGoblin == true:
			Global.shittyMeatOwned += 1
			Global.deadGoblinsOverworld.append(self.get_name())
			self.queue_free()

func _on_idleTimer_timeout():
	randomize()
	$idleTimer.wait_time = randi() % 10 + 2
	$goblinAnimator.play("idle")
