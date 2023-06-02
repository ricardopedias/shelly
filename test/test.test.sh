
XABLAU=xuuuooo

assertEquals $(echo "ricardo") : "ricardo"
    
assertEquals : $(echo "ricardo") : "pereira"

assertContains : $(echo "ricardo") : "ric"



# assert_equals() "ricardo" "ricardo"
# assert_equals() ricardo ricardo

# assert_not_equals() "ricardo" "ricardo"
# assert_not_equals() ricardo ricardo