/// @description Split
for (var i = 0; i < 10; i++) {
	 with instance_create_layer(x, y, "Projectile", o_doubleshot) {
		speed = 1;
		direction = i*36 + irandom_range(-10,10);
	 }
}
instance_destroy(self)







