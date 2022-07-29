User.create!([
  {
    name: 'Levy',
    email: 'levy@gmail.com',
    password: '123456'
  },
  {
    name: 'Debas',
    email: 'debas@gmail.com',
    password: '123456'
  }
])

Food.create!([
  {
    user_id: 1,
    name: 'Apple',
    measurement_unit: 'grams',
    unit_price: 10
  },
  {
      user_id: 1,
      name: 'Orange',
      measurement_unit: 'grams',
      unit_price: 3
  },
  {
    user_id: 2,
    name: 'Almond',
    measurement_unit: 'grams',
    unit_price: 12
  },
  {
    user_id: 2,
    name: 'Resins',
    measurement_unit: 'grams',
    unit_price: 22
  },
])

Recipe.create!([
  {
    user_id: 2,
    name: 'Loslas',
    preparation_time: '2hrs',
    cooking_time: '25min',
    description: 'Loslas descrption',
    public: true
  },
  {
    user_id: 1,
    name: 'Creapas',
    preparation_time: '1hrs',
    cooking_time: '45min',
    description: 'Creapas descrption',
    public: false
  },
  {
    user_id: 1,
    name: 'Dasus',
    preparation_time: '3hrs',
    cooking_time: '1.5hrs',
    description: 'Dasus descrption',
    public: true
  },{
    user_id: 2,
    name: 'Pilost',
    preparation_time: '7hrs',
    cooking_time: '3hrs',
    description: 'Pilost descrption',
    public: false
  }
])
puts 'Seed data loaded successfully'