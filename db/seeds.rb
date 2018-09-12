# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

zones = Zone.create([
    { name: 'Central', identifier: 'central' },
    { name: 'Occidental', identifier: 'western' },
    { name: 'Oriental', identifier: 'eastern' },
])

gas_types = GasType.create([
    { name: 'Especial', identifier: 'premium' },
    { name: 'Regular', identifier: 'regular' },
    { name: 'Diesel', identifier: 'diesel' },
    { name: 'Diesel bajo en azufre', identifier: 'diesel-low-sulfur' },
])

prices_file = File.read('data/prices.json')
prices_json = JSON.parse(prices_file)

prices_json['prices'].each { |price|
    price['zones'].each { |z|
        zone = Zone.find_by(identifier: z['name'])
        zone_prices = z['prices']
        zone_prices.keys.each { |gt|
            gas_type = GasType.find_by(identifier: gt)
            gas_price = zone_prices[gt]
            Price.create({
                from: price['from'],
                to: price['to'],
                zone: zone,
                gas_type: gas_type,
                price: gas_price,
            })
        }
    }
}
