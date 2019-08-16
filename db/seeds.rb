# client
alexandro = Client.create(first_name: "Alexandro", last_name: "Disla", email: "alexandrodisla@hotmail.com", username: "AD0791",password:'test')
jerry = Client.create(first_name: "Jerry", last_name: "Charles", email: "jerrycharles44@katkatgame.com", username: "jeycharles44",password:'test1')

# reservations
alexandro.reservations.create(bed_size: "large", occupancy: 1, date: '2019/02/12', number_of_day: 25, room: 'presidential')
jerry.reservations.create(bed_size: "medium", occupancy: 1, date: '2019/04/11', number_of_day: 30, room: 'suite')

#comments
alexandro.comments.create(comment: "I really love the service here!!!")
jerry.comments.create(comment: "I feel very happy from this experience.")