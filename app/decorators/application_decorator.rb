class Teste
	def find_palindrome(string, init)
		a = string.size - init
		while a >= 2
			n = string.size-a+1
			while n >= 1
				s = string.slice(n,a)
				return s if s == s.reverse
				n -= 1
			end
			a -= 1
		end
	end
end