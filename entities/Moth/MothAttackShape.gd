class_name MothAttackShape

static func cone(radius, arc_degrees, offset_deg, segments) -> ConvexPolygonShape2D:
	var shape := ConvexPolygonShape2D.new()
	var pts := PackedVector2Array([Vector2.ZERO])
	var half := deg_to_rad(arc_degrees) * 0.5
	var start := deg_to_rad(offset_deg) - half
	var count = max(2, segments)
	for i in count + 1:
		var a := start + (2.0 * half) * (float(i) / float(count))
		pts.append(Vector2(cos(a), sin(a)) * radius)
	shape.points = pts
	return shape
	
static func circle(radius: float) -> CircleShape2D:
	var shape := CircleShape2D.new()
	shape.radius = radius
	return shape
