
assertEquals \
    $(echo "ricardo") \
    : "ricardo"
    
assertEquals \
    : $(echo "ricardo") \
    : "pereira"



# assert_equals() "ricardo" "ricardo"
# assert_equals() ricardo ricardo

# assert_not_equals() "ricardo" "ricardo"
# assert_not_equals() ricardo ricardo