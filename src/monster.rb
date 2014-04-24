class Monster < Hatchling::Entity

	def initialize(x, y, type, target)
		@type = type.to_s		
		first_char = type[0]
		
		components = {}
		components[:display] = DisplayComponent.new(x, y, first_char, Color.new(0, 255, 0))
		
		# TODO: generate stats based on type
		case type
		when :drone
			health = 15 + rand(5)
			strength = 2 + rand(1)
			speed = 1
			experience = 10
		else
			raise "Not sure how to make a monster of type #{type}"
		end
		
		raise "Invalid monster: hp=#{health}, str=#{strength}, speed=#{speed} xp=#{experience}" if health.nil? || strength.nil? || speed.nil? || experience.nil?
		
		components[:health] = HealthComponent.new(health)
		components[:battle] = BattleComponent.new({:strength => strength, :speed => speed, :target => target})
		components[:name] = "Drone"
		components[:experience] = experience
		
		super(components)
	end
end
