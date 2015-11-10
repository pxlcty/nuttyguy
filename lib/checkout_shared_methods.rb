module CheckoutSharedMethods
	def subtotal
		return 0 unless line_items.any?
		line_items.collect(&:subtotal).inject(:+)
	end

	def total
		subtotal
	end
end
