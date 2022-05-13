Article.destroy_all
Category.destroy_all
Category.create({ name: 'Football' })
Category.create({ name: 'Tennis' })

Article.create!(
  {
    title: 'Deep Football',
    body: 'Deep Football is the ability to focus without distration on the cognitively demanding task of playing football',
    author: 'Carl Newport',
    category: Category.find_by(name: 'Football')
    #  image: ( File.open(Rails.root.join('/db/seed_images/deep_work.png')),
    #    filename: 'attachment',
    #    content_type: 'image/png')
  }
)

Article.create!(
  {
    title: 'The Lean Football Manager Up',
    body: 'The lean football manager  is a new appraoch to business thats being adopted around the world. ',
    author: 'Eric Ries',
    category: Category.find_by(name: 'Football')
  }
)

Article.create!(
  {
    title: 'Open',
    body: 'Far more than a superb memoir about the highest levels of professional tennis, Open is the engrossing story of a remarkable life.',
    author: 'Andre Agassi',
    category: Category.find_by(name: 'Tennis')
  }
)

p "created #{Article.count} articles"
