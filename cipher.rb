puts "Enter cipher string:"
string = gets.chomp.split("")

puts "Enter shift value: "
shift = gets.chomp.to_i

while shift == 0 do
    puts "Invalid shift number"
    puts "Please enter a shift value"
    shift = gets.chomp.to_i
end


### ADD IN VERIFICATION THAT AN INTEGER HAS BEEN ENTERED
### ADD IN - IF NUMBER > 26 then NUMBER = NUMBER % 26 - This was if you enter something like 80000 as the shift value it will 
### work out how many times that would wrap through the alphabet instead of trying to access ascii 80000


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

p "#{encoded.join}"