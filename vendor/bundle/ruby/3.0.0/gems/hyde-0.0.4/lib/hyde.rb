
module Hyde
	Units = {
#		:metre      => 1,
		:m          => 1,
		:hyde       => 1.56,
		:barleycorn => 0.008467 ,
		:inch       => 0.0254   ,
		:feet       => 0.3048   ,
		:yard       => 0.9144   ,
		:pole       => 5.0292   ,
		:chain      => 20.1168  ,
		:furlong    => 201.168  ,
		:mile       => 1609.344 ,
		:league     => 4828.032 ,
	}

	Prefix = {
		:Y  => 1e24,
		:Z  => 1e21,
		:E  => 1e18,
		:P  => 1e15,
		:T  => 1e12,
		:G  => 1e9,
		:M  => 1e6,
		:k  => 1e3,
		:h  => 1e2,
		:da => 1e1,
		:d  => 1e-1,
		:c  => 1e-2,
		:m  => 1e-3,
		:u  => 1e-6,
		:n  => 1e-9,
		:p  => 1e-12,
		:f  => 1e-15,
		:a  => 1e-18,
		:z  => 1e-21,
		:y  => 1e-24,
	}

	Units.each do |u, v|
		module_eval <<-EOS
			def metre_to_#{u}(m)
				m / Units[:#{u}]
			end
			module_function :metre_to_#{u}

			def #{u}_to_metre(t)
				t * Units[:#{u}]
			end
			module_function :#{u}_to_metre

			def hyde_to_#{u}(hyde)
				metre_to_#{u}(hyde_to_metre(hyde))
			end
			module_function :hyde_to_#{u}

			def #{u}_to_hyde(t)
				metre_to_hyde(#{u}_to_metre(t))
			end
			module_function :#{u}_to_hyde
		EOS
	end

	module NumericExtension
		# convert to hyde taking self as m
		def in_hyde
			Hyde.m_to_hyde(self)
		end
	end

	class HydeCommand
		def run(argv)
			@argv = argv.dup
			@argv.each do |a|
				puts "%s: %s" % [a, convert(a)]
			end
		end

		def convert(a)
			_, num, prefix, unit = */([\d.]+)(#{Prefix.keys.join("|")})?(#{Units.keys.join("|")})/o.match(a)
			num = num.to_f
			num *= Prefix[prefix.to_sym] if prefix
			if unit == "hyde"
				"%fcm" % [Hyde.hyde_to_metre(num) * 100]
			else
				"%fhyde" % [Hyde.send("#{unit}_to_hyde", num)]
			end
		end
	end

end


class Numeric
	include Hyde::NumericExtension
end

