module ApplicationHelper
  def convert_to_euro(num)
    string_array = num.to_s.chars
    result = []
    string_array.reverse.each_slice(3) { |a| result.push(a.join.reverse) }
    "#{result.reverse.join(' ')} €"
  end

  def total_price(booking)
    price = booking.jet.price
    days_of_reservations = (booking.end_date - booking.start_date).to_i
    days_of_reservations * price
  end
end
