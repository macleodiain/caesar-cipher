
# get string to be encoded then split into and array of chars
puts "Enter cipher string:"
string = gets.chomp.split("")

#get the shift value and convert to integer if possible
puts "Enter shift value: "
shift = gets.chomp.to_i

#check user input is valid, if not ask for input again
while shift <= 0 do
    puts "Invalid shift number"
    puts "Please enter a shift value"
    shift = gets.chomp.to_i
end

#if shift value is > 26, wrap back around to begining
if shift > 26
    shift = shift%26
end


encoded = string.map do|letter| 
    #check if letter is an upper or lowercase letter 
    if letter.ord.between?(65, 95)  || letter.ord.between?(97,122)
        # if upper-case
        if letter.ord.between?(65, 90)      #65..90 refers to ascii range for A..Z
            if (letter.ord)+shift > 90
                (((letter.ord)+shift)-26).chr   #-26 to wrap back through the alphabet i.e WXYZABCD
            else
                ((letter.ord)+shift).chr        # if no wrap is required return letter+shift
            end
        #if lower-case
        elsif letter.ord.between?(97, 122) 
                if (letter.ord)+shift > 122
                    (((letter.ord)+shift)-26).chr
                else
                    ((letter.ord)+shift).chr
                end
            end
    else 
        #if not a letter, return without changing
        letter
    end

  
end

puts "#{encoded.join}"