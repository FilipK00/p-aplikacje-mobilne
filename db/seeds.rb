users = User.create(
    [
        {
            index: '253047',
            name: 'Filip',
            password: 'testtest1'
        },
        {
            index: '047253',
            name: 'PiliF',
            password: 'testtest2'
        }
    ]
)

petrol_stations = PetrolStation.create(
    [
        {
            name: 'Orlen (Wroclaw, Szybowcowa)',
            address: 'ul. Szybowcowa 27, Wroclaw',
        },
        {
            name: 'Shell (Wroclaw, Malopanewska)',
            address: 'ul. Malopanewska 54, Wroclaw',
        }
    ]
)

# post_dates = PostDate.create(
#     [
#         {
#             title: '6-05-2022',
#             user: users.first,
#             petrol_station: petrol_stations.first
#         },
#         {
#             title: '4-05-2022',
#             user: users.first,
#             petrol_station: petrol_stations.last
#         }
#     ]
# )

#users.first.petrol_stations = petrol_stations